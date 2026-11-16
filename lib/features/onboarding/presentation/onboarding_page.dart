import 'package:flutter/material.dart';
import 'package:still_here/common/app_routes.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:still_here/widgets/still/still_button.dart';

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
        icon: Icons.wb_twilight_rounded,
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

  void _next(int total) {
    if (_index >= total - 1) {
      _finish();
    } else {
      _controller.nextPage(
        duration: AppDimensions.normal,
        curve: AppDimensions.easeOut,
      );
    }
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
                style: TextButton.styleFrom(
                  foregroundColor: context.appMuted,
                  minimumSize: const Size(64, 44),
                ),
                child: Text(S.of(context).skip),
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
                          width: 108,
                          height: 108,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.appBrand.withValues(alpha: 0.22),
                                context.appBrand.withValues(alpha: 0.08),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Icon(
                            p.icon,
                            size: 48,
                            color: context.appBrandDeep,
                          ),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: context.appInk,
                            height: 1.25,
                            letterSpacing: -0.35,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          p.body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.55,
                            color: context.appMuted,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: AppDimensions.fast,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active
                        ? context.appBrand
                        : context.appBorder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: StillButton(
                label: last
                    ? S.of(context).getStarted
                    : S.of(context).continueAction,
                onPressed: () => _next(pages.length),
                icon: last ? Icons.spa_rounded : Icons.arrow_forward_rounded,
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
