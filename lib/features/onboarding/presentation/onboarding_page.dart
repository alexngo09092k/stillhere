import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:still_here/common/app_routes.dart';
import 'package:still_here/core/database/local_storage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;

  List<_OnboardData> _pagesOf(BuildContext context) {
    final s = S.of(context);
    return [
      _OnboardData(
        icon: Icons.spa_rounded,
        title: s.onboard1Title,
        body: s.onboard1Body,
      ),
      _OnboardData(
        icon: Icons.favorite_outline_rounded,
        title: s.onboard2Title,
        body: s.onboard2Body,
      ),
      _OnboardData(
        icon: Icons.lock_outline_rounded,
        title: s.onboard3Title,
        body: s.onboard3Body,
      ),
    ];
  }

  Future<void> _finish() async {
    await LocalStorage.instance.setOnboardingDone(true);
    AwesomeAnalytics.instance.sendEvent('onboarding_complete', {});
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pagesOf(context);
    final last = _index == pages.length - 1;

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(
                  S.of(context).skip,
                  style: TextStyle(color: context.appMuted),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  final p = pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            gradient: context.appSoftPeachGradient,
                            shape: BoxShape.circle,
                            boxShadow: context.appCardShadow,
                          ),
                          child: i == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(22),
                                  child: Image.asset(
                                    AppAssets.instance.logoMark,
                                    errorBuilder: (_, __, ___) => Icon(
                                      p.icon,
                                      size: 48,
                                      color: context.appBrandDeep,
                                    ),
                                  ),
                                )
                              : Icon(p.icon,
                                  size: 48, color: context.appBrandDeep),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: context.appInk,
                            height: 1.3,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          p.body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: context.appMuted,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (i) {
                final on = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: on ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: on ? context.appBrand : context.appBorder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: context.appCtaGradient,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: context.appBrand.withOpacity(0.28),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: () {
                      if (last) {
                        _finish();
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 320),
                          curve: Curves.easeOutCubic,
                        );
                      }
                    },
                    child: Text(
                      last
                          ? S.of(context).getStarted
                          : S.of(context).continueAction,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final IconData icon;
  final String title;
  final String body;
  const _OnboardData({
    required this.icon,
    required this.title,
    required this.body,
  });
}
