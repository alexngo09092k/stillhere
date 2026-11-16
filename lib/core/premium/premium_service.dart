import 'package:fluttering/fluttering.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:fluttering_iap/fluttering_iap.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// Single source of premium entitlement for the app.
/// Uses existing [AwesomeIAP] only — no parallel IAP manager.
class PremiumService extends Provider {
  PremiumService._();
  static final PremiumService instance = PremiumService._();

  static const String _premiumKey = 'com.snapeditify.stillhere.premium';

  bool _isPremium = false;
  bool get isPremium => _isPremium;

  bool _bound = false;

  /// True when any non-consumable / subscription product is purchased.
  bool _premiumFromProducts(List<IAPProduct> products) {
    return products.any((p) => p.status && p.type != IAPType.consumables);
  }

  /// Call once after AwesomeIAP.initial.
  Future<void> bind() async {
    if (_bound) return;
    _bound = true;

    _isPremium = AsyncStorage.instance.getBool(_premiumKey) ?? false;
    notifyListeners();

    await syncFromIap();
    AwesomeIAP.instance.addListener(_onIapChanged);
  }

  void unbind() {
    if (!_bound) return;
    _bound = false;
    AwesomeIAP.instance.removeListener(_onIapChanged);
  }

  void _onIapChanged() {
    final products = AwesomeIAP.instance.products;
    if (products.isEmpty) return;
    final fromIap = _premiumFromProducts(products);
    if (fromIap != _isPremium) {
      _setPremium(fromIap);
    }
  }

  /// Sync entitlement from live IAP product list.
  /// - Empty list → leave current flag (store may still be loading).
  /// - Non-empty → set true/false from ownership (handles expiry + restore).
  Future<void> syncFromIap() async {
    try {
      final products = AwesomeIAP.instance.products;
      if (products.isEmpty) {
        Debug.log(
          '[PremiumService] syncFromIap: products empty, keep $_isPremium',
        );
        return;
      }
      final fromIap = _premiumFromProducts(products);
      await _setPremium(fromIap);
    } catch (e) {
      Debug.log('[PremiumService] syncFromIap: $e');
    }
  }

  Future<void> _setPremium(bool value) async {
    if (_isPremium == value) {
      // Still persist in case storage was wiped.
      await AsyncStorage.instance.setBool(_premiumKey, value);
      return;
    }
    _isPremium = value;
    await AsyncStorage.instance.setBool(_premiumKey, value);
    notifyListeners();
    Debug.log('[PremiumService] isPremium=$value');
  }

  Future<bool> purchase(IAPProduct product) async {
    try {
      AwesomeAnalytics.instance.sendEvent('purchase_start', {
        'product_id': product.id,
        'provider': product.provider.name,
      });
      await AwesomeIAP.instance.purchase(product);
      // Give store callback a moment, then resync (listener usually faster).
      await Future.delayed(const Duration(milliseconds: 800));
      await syncFromIap();
      if (_isPremium) {
        AwesomeAnalytics.instance.sendEvent('purchase_success', {
          'product_id': product.id,
        });
      }
      return _isPremium;
    } catch (e) {
      AwesomeAnalytics.instance.sendEvent('purchase_fail', {
        'product_id': product.id,
        'error': e.toString(),
      });
      Debug.log('[PremiumService] purchase error: $e');
      rethrow;
    }
  }

  /// Production restore: Google/Apple via InAppPurchase + Huawei via AwesomeIAP.restore().
  Future<void> restore() async {
    try {
      AwesomeAnalytics.instance.sendEvent('restore_start', {});

      try {
        await InAppPurchase.instance.restorePurchases();
      } catch (e) {
        Debug.log('[PremiumService] InAppPurchase.restorePurchases: $e');
      }

      try {
        await AwesomeIAP.instance.restore();
      } catch (e) {
        Debug.log('[PremiumService] AwesomeIAP.restore: $e');
      }

      await Future.delayed(const Duration(milliseconds: 600));
      await syncFromIap();
      AwesomeAnalytics.instance.sendEvent(
        _isPremium ? 'restore_success' : 'restore_empty',
        {},
      );
    } catch (e) {
      AwesomeAnalytics.instance.sendEvent('restore_fail', {
        'error': e.toString(),
      });
      Debug.log('[PremiumService] restore error: $e');
      rethrow;
    }
  }

  List<IAPProduct> get products {
    final live = AwesomeIAP.instance.products;
    if (live.isNotEmpty) return live;
    return AwesomeIAP.instance.config.products;
  }
}
