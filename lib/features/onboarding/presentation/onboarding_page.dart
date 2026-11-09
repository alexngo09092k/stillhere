import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
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
        icon: Icons.waving_hand_rounded,
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
                itemCount: _pagesOf(context).length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  final p = _pagesOf(context)[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: context.appBrand.withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(p.icon, size: 48, color: context.appBrand),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          p.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: context.appInk,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          p.body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: context.appInk.withOpacity(0.7),
                            height: 1.5,
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
              children: List.generate(_pagesOf(context).length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _index == i ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _index == i
                        ? context.appBrand
                        : context.appBorder,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: context.appBrand,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_index < _pagesOf(context).length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      _finish();
                    }
                  },
                  child: Text(
                    _index < _pagesOf(context).length - 1 ? S.of(context).continueAction : S.of(context).getStarted,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
  const _OnboardData({required this.icon, required this.title, required this.body});
}
