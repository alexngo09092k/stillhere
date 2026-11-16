import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';

enum StillButtonVariant { primary, secondary, ghost, soft }

/// Primary CTA and secondary actions with consistent height, radius, loading.
class StillButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final StillButtonVariant variant;
  final bool loading;
  final bool expanded;
  final IconData? icon;
  final double height;

  const StillButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = StillButtonVariant.primary,
    this.loading = false,
    this.expanded = true,
    this.icon,
    this.height = AppDimensions.ctaHeight,
  });

  @override
  State<StillButton> createState() => _StillButtonState();
}

class _StillButtonState extends State<StillButton> {
  bool _down = false;

  bool get _enabled => widget.onPressed != null && !widget.loading;

  void _handleTap() {
    if (!_enabled) return;
    HapticFeedback.lightImpact();
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final child = AnimatedScale(
      scale: _down && _enabled ? 0.98 : 1,
      duration: AppDimensions.fast,
      curve: AppDimensions.easeOut,
      child: AnimatedOpacity(
        opacity: _enabled ? 1 : 0.55,
        duration: AppDimensions.fast,
        child: _buildSurface(context),
      ),
    );

    return GestureDetector(
      onTapDown: _enabled ? (_) => setState(() => _down = true) : null,
      onTapUp: _enabled
          ? (_) {
              setState(() => _down = false);
              _handleTap();
            }
          : null,
      onTapCancel: () => setState(() => _down = false),
      child: widget.expanded
          ? SizedBox(width: double.infinity, height: widget.height, child: child)
          : SizedBox(height: widget.height, child: child),
    );
  }

  Widget _buildSurface(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      color: _labelColor(context),
    );

    final content = widget.loading
        ? SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: _labelColor(context),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 20, color: _labelColor(context)),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle,
                ),
              ),
            ],
          );

    switch (widget.variant) {
      case StillButtonVariant.primary:
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: context.appCtaGradient,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            boxShadow: [
              BoxShadow(
                color: AppColors.brand.withValues(alpha: 0.28),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: content,
        );
      case StillButtonVariant.secondary:
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.appSurf,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            border: Border.all(color: context.appBorder, width: 1.2),
          ),
          child: content,
        );
      case StillButtonVariant.soft:
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.appBrand.withValues(alpha: context.isDark ? 0.2 : 0.14),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          ),
          child: content,
        );
      case StillButtonVariant.ghost:
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          ),
          child: content,
        );
    }
  }

  Color _labelColor(BuildContext context) {
    switch (widget.variant) {
      case StillButtonVariant.primary:
        return Colors.white;
      case StillButtonVariant.secondary:
      case StillButtonVariant.ghost:
        return context.appInk;
      case StillButtonVariant.soft:
        return context.appBrandDeep;
    }
  }
}
