import 'package:fluttering/fluttering.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:fluttering_iap/fluttering_iap.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:still_here/core/database/local_storage.dart';

/// Single source of premium entitlement for the app.
/// Uses existing [AwesomeIAP] only — no parallel IAP manager.
///
/// Note: [IAwesomeIAP] does not expose isPremium/restore, so we derive premium
/// from product statuses and call the store restore API directly.
class PremiumService extends Provider {
  PremiumService._();
  static final PremiumService instance = PremiumService._();

  static const String _premiumKey = 'app.still_here.studio.premium';

  bool _isPremium = false;
  bool get isPremium => _isPremium;

  bool _bound = false;

  /// True when any non-consumable / subscription product is purchased.
  bool _premiumFromProducts(List<IAPProduct> products) {
    return products.any(
      (p) => p.status && p.type != IAPType.consumables,
    );
  }

  /// Call once after AwesomeIAP.initial (e.g. in onDidInitialize or first screen).
  Future<void> bind() async {
    if (_bound) return;
    _bound = true;

    // Local cache first (offline / fast path)
    _isPremium = AsyncStorage.instance.getBool(_premiumKey) ?? false;
    notifyListeners();

    // Sync from IAP product state when available
    await syncFromIap();

    // React to IAP product updates
    AwesomeIAP.instance.addListener(_onIapChanged);
  }

  void unbind() {
    if (!_bound) return;
    _bound = false;
    AwesomeIAP.instance.removeListener(_onIapChanged);
  }

  void _onIapChanged() {
    final fromIap = _premiumFromProducts(AwesomeIAP.instance.products);
    if (fromIap != _isPremium) {
      _setPremium(fromIap);
    }
  }

  Future<void> syncFromIap() async {
    try {
      final fromIap = _premiumFromProducts(AwesomeIAP.instance.products);
      if (fromIap) {
        await _setPremium(true);
      }
      // Do not force false from empty product list (store may still be loading)
    } catch (e) {
      Debug.log('[PremiumService] syncFromIap: $e');
    }
  }

  Future<void> _setPremium(bool value) async {
    _isPremium = value;
    await AsyncStorage.instance.setBool(_premiumKey, value);
    notifyListeners();
    Debug.log('[PremiumService] isPremium=$value');
  }

  /// Purchase the given product via existing AwesomeIAP.
  Future<bool> purchase(IAPProduct product) async {
    try {
      AwesomeAnalytics.instance.sendEvent('purchase_start', {
        'product_id': product.id,
        'provider': product.provider.name,
      });
      await AwesomeIAP.instance.purchase(product);
      // Status is updated asynchronously via purchase stream → listener
      // Give a short window then re-sync
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

  Future<void> restore() async {
    try {
      AwesomeAnalytics.instance.sendEvent('restore_start', {});
      // IAwesomeIAP has no restore(); call the store API directly (Google/Apple).
      // Huawei path still depends on fluttering_iap internal load — best-effort only.
      try {
        await InAppPurchase.instance.restorePurchases();
      } catch (e) {
        Debug.log('[PremiumService] InAppPurchase.restorePurchases: $e');
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
    // Fallback to config products (not yet loaded from store)
    return AwesomeIAP.instance.config.products;
  }
}
