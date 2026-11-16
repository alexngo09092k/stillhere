import 'package:flutter/material.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/widgets/still/still_button.dart';
import 'package:still_here/utils/ad_revenue_manager.dart';

class CheckInSuccessPage extends StatefulWidget {
  final CheckIn checkIn;
  const CheckInSuccessPage({super.key, required this.checkIn});

  @override
  State<CheckInSuccessPage> createState() => _CheckInSuccessPageState();
}

class _CheckInSuccessPageState extends State<CheckInSuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: AppDimensions.slow);
    _scale = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack);
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
    // Soft ad placement after a high-value action (respects cooldowns).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdRevenueManager.instance.onHighValueAction(placement: 'checkin_success');
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.of(context).popUntil((r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFE8C4A0),
              AppColors.brand,
              const Color(0xFFC4895A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 24, 28, 20),
            child: Column(
              children: [
                const Spacer(flex: 2),
                FadeTransition(
                  opacity: _fade,
                  child: ScaleTransition(
                    scale: _scale,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.22),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.35),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 46,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                FadeTransition(
                  opacity: _fade,
                  child: Text(
                    S.of(context).doingGreat,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.25,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FadeTransition(
                  opacity: _fade,
                  child: Text(
                    S.of(context).enoughQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.white.withOpacity(0.92),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                StillButton(
                  label: S.of(context).viewJourney,
                  onPressed: _goHome,
                  icon: Icons.menu_book_rounded,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withOpacity(0.45)),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusLg),
                      ),
                    ),
                    onPressed: _goHome,
                    child: Text(
                      S.of(context).backHome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).dataStaysOnDevice,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.75),
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
