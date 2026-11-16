import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/widgets/still/still_button.dart';

/// Calm empty state — never guilt-framed for a wellbeing app.
class StillEmpty extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? body;
  final String? actionLabel;
  final VoidCallback? onAction;

  const StillEmpty({
    super.key,
    required this.icon,
    required this.title,
    this.body,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.appBrand.withValues(alpha: 0.18),
                  context.appBrand.withValues(alpha: 0.06),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 34, color: context.appBrandDeep),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: context.appInk,
              height: 1.3,
              letterSpacing: -0.2,
            ),
          ),
          if (body != null) ...[
            const SizedBox(height: 10),
            Text(
              body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: context.appMuted,
              ),
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 24),
            StillButton(
              label: actionLabel!,
              onPressed: onAction,
              expanded: false,
              height: 48,
              variant: StillButtonVariant.soft,
            ),
          ],
        ],
      ),
    );
  }
}
