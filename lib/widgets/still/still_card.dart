import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/widgets/still/still_widgets.dart';

/// Soft elevated surface used across Home, History, Stats, Care.
class StillCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? color;
  final Border? border;
  final double radius;
  final bool elevated;

  const StillCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.color,
    this.border,
    this.radius = AppDimensions.radiusLg,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    final surface = Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppDimensions.cardPadding),
      decoration: BoxDecoration(
        color: color ?? context.appSurf,
        borderRadius: BorderRadius.circular(radius),
        border: border ??
            Border.all(
              color: context.appBorder.withOpacity(context.isDark ? 0.9 : 0.85),
            ),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color:
                      context.appInk.withOpacity(context.isDark ? 0.22 : 0.05),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap == null) return surface;
    return StillPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: surface,
    );
  }
}
