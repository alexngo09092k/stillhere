import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
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

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
    _ctrl.forward();
    _bootstrap();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    // Restore language + theme from local settings before first navigation
    // so Home / Onboarding open already in the user's preferred locale.
    await _restorePreferences();
    await Future.delayed(const Duration(milliseconds: 1100));
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

  Future<void> _restorePreferences() async {
    try {
      final settings = await LocalStorage.instance.getSettings();
      final lang = (settings['language'] as String?)?.toLowerCase() ?? 'en';
      final themeStr = (settings['theme'] as String?)?.toLowerCase() ?? 'light';
      final provider = ManagerProvider.of<IThemeProvider>();
      provider.changeLocale(Locale(lang));
      final mode = switch (themeStr) {
        'dark' => ThemeMode.dark,
        'system' => ThemeMode.system,
        _ => ThemeMode.light,
      };
      provider.changeThemeMode(mode);
    } catch (e) {
      Debug.log('[Splash] restore preferences: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBg,
      body: FadeTransition(
        opacity: _fade,
        child: ScaleTransition(
          scale: _scale,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.instance.logoMark,
                  width: 96,
                  height: 96,
                  errorBuilder: (_, __, ___) => Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      gradient: context.appCtaGradient,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Icon(Icons.spa_rounded,
                        color: Colors.white, size: 48),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  Configuration.instance.business.appName.isNotEmpty
                      ? Configuration.instance.business.appName
                      : 'Still Here',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: context.appInk,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).splashTagline,
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
