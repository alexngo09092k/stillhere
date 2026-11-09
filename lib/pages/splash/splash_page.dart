import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering/fluttering.dart';
import 'package:still_here/common/app_routes.dart';
import 'package:still_here/common/configuration.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/features/onboarding/presentation/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // Đảm bảo storage sẵn sàng
    await Future.delayed(const Duration(milliseconds: 600));
    final done = await LocalStorage.instance.isOnboardingDone();
    if (!mounted) return;
    if (done) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = Configuration.instance.business.appName;
    return Scaffold(
      backgroundColor: context.appBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: context.appBrand.withOpacity(0.18),
                    blurRadius: 22,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/logo.png',
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              name.isNotEmpty ? name : 'Still Here',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: context.appInk,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).appTagline,
              style: TextStyle(
                fontSize: 15,
                color: context.appInk.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: context.appBrand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
