import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/shared/models/check_in.dart';

/// Màn hình xác nhận sau khi lưu check-in (theo PRD – Success screen).
class CheckInSuccessPage extends StatelessWidget {
  final CheckIn checkIn;

  const CheckInSuccessPage({super.key, required this.checkIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: context.appBrand.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    checkIn.status.emoji,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                    S.of(context).thankYouCheckIn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: context.appInk,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                checkIn.status.label,
                style: TextStyle(
                  fontSize: 16,
                  color: context.appInk.withOpacity(0.7),
                ),
              ),
              if (checkIn.note != null && checkIn.note!.trim().isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.appSurf,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: context.appBorder),
                  ),
                  child: Text(
                    checkIn.note!,
                    style: TextStyle(
                      fontSize: 15,
                      color: context.appInk,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.appBrand,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Pop về Home (xóa cả CheckInPage)
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text(
                    S.of(context).backHome,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  // Home sẽ tự chuyển tab History nếu cần – đơn giản pop là đủ.
                },
                child: Text(
                    S.of(context).viewHistory,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.appMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
