import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_iap/fluttering_iap.dart';
import 'package:still_here/core/premium/premium_service.dart';
import 'package:still_here/widgets/still/still_button.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  bool _loading = false;
  bool _restoring = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    PremiumService.instance.addListener(_onChanged);
    AwesomeIAP.instance.addListener(_onChanged);
    PremiumService.instance.syncFromIap();
  }

  @override
  void dispose() {
    PremiumService.instance.removeListener(_onChanged);
    AwesomeIAP.instance.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _purchase(IAPProduct product) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final ok = await PremiumService.instance.purchase(product);
      if (!mounted) return;
      if (ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).purchaseSuccess),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).maybePop();
      } else {
        setState(() => _error = S.of(context).purchaseIncomplete);
      }
    } catch (e) {
      if (mounted) setState(() => _error = S.of(context).purchaseFailed('$e'));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _restore() async {
    setState(() {
      _restoring = true;
      _error = null;
    });
    try {
      await PremiumService.instance.restore();
      if (!mounted) return;
      final ok = PremiumService.instance.isPremium;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ok ? S.of(context).restoreSuccess : S.of(context).restoreEmpty,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      if (ok) Navigator.of(context).maybePop();
    } catch (e) {
      if (mounted) setState(() => _error = S.of(context).restoreFailed('$e'));
    } finally {
      if (mounted) setState(() => _restoring = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final premium = PremiumService.instance.isPremium;
    final products = PremiumService.instance.products;
    final iapEnabled = AwesomeIAP.instance.config.enable;

    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        title: Text(
          S.of(context).premium,
          style: TextStyle(color: context.appInk),
        ),
        iconTheme: IconThemeData(color: context.appInk),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Icon(Icons.workspace_premium, size: 72, color: context.appBrand),
          const SizedBox(height: 16),
          Text(
            premium
                ? S.of(context).youArePremium
                : S.of(context).adFreeExperience,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            premium
                ? S.of(context).premiumThanks
                : S.of(context).premiumSupportDesc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: context.appInk.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 32),
          _Benefit(icon: Icons.block, text: S.of(context).benefitNoAds),
          _Benefit(
            icon: Icons.auto_awesome,
            text: S.of(context).benefitAiPriority,
          ),
          _Benefit(
            icon: Icons.insights_rounded,
            text: S.of(context).benefitFullInsights,
          ),
          _Benefit(
            icon: Icons.file_download_outlined,
            text: S.of(context).benefitExportJournal,
          ),
          _Benefit(icon: Icons.favorite, text: S.of(context).benefitSupportDev),
          const SizedBox(height: 28),
          if (_error != null) ...[
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.redAccent, fontSize: 13),
            ),
            const SizedBox(height: 12),
          ],
          if (premium)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.appBrand.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: context.appBrand),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      S.of(context).premiumActiveOnDevice,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: context.appInk,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else if (!iapEnabled)
            Text(
              S.of(context).iapUnavailable,
              textAlign: TextAlign.center,
              style: TextStyle(color: context.appMuted),
            )
          else if (products.isEmpty)
            Column(
              children: [
                Text(
                  S.of(context).loadingPlans,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.appMuted),
                ),
                const SizedBox(height: 16),
                _PurchaseButton(
                  loading: _loading,
                  label: S.of(context).upgradePremium,
                  onPressed: () {
                    final cfg = AwesomeIAP.instance.config.products;
                    if (cfg.isNotEmpty) _purchase(cfg.first);
                  },
                ),
              ],
            )
          else
            ...products.map((p) {
              final name = p.info?.name ?? p.id;
              final price = p.info?.price ?? '';
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PurchaseButton(
                  loading: _loading,
                  label: price.isNotEmpty
                      ? '$name · $price'
                      : S.of(context).upgradePremium,
                  onPressed: () => _purchase(p),
                ),
              );
            }),
          if (!premium) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: _restoring ? null : _restore,
              child: _restoring
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(S.of(context).restorePurchases),
            ),
          ],
        ],
      ),
    );
  }
}

class _PurchaseButton extends StatelessWidget {
  final bool loading;
  final String label;
  final VoidCallback onPressed;
  const _PurchaseButton({
    required this.loading,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return StillButton(
      label: label,
      loading: loading,
      onPressed: loading ? null : onPressed,
      icon: Icons.workspace_premium_rounded,
    );
  }
}

class _Benefit extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Benefit({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, color: context.appBrand, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: context.appInk),
            ),
          ),
        ],
      ),
    );
  }
}
