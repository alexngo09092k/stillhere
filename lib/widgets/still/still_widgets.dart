import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';

export 'still_button.dart';
export 'still_card.dart';
export 'still_empty.dart';
export 'still_section.dart';

/// Soft scale-on-press wrapper with optional light haptic.
class StillPressable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool haptic;
  final double scale;
  final BorderRadius? borderRadius;

  const StillPressable({
    super.key,
    required this.child,
    this.onTap,
    this.haptic = true,
    this.scale = 0.97,
    this.borderRadius,
  });

  @override
  State<StillPressable> createState() => _StillPressableState();
}

class _StillPressableState extends State<StillPressable> {
  bool _down = false;

  void _setDown(bool v) {
    if (_down == v) return;
    setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onTap == null ? null : (_) => _setDown(true),
      onTapUp: widget.onTap == null
          ? null
          : (_) {
              _setDown(false);
              if (widget.haptic) {
                HapticFeedback.selectionClick();
              }
              widget.onTap?.call();
            },
      onTapCancel: () => _setDown(false),
      child: AnimatedScale(
        scale: _down ? widget.scale : 1,
        duration: AppDimensions.fast,
        curve: AppDimensions.easeOut,
        child: widget.child,
      ),
    );
  }
}

/// Soft horizontal chip used for filters / tags.
class StillChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? selectedColor;

  const StillChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.icon,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final accent = selectedColor ?? context.appBrand;
    return StillPressable(
      onTap: onTap,
      scale: 0.96,
      child: AnimatedContainer(
        duration: AppDimensions.fast,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? accent.withOpacity(context.isDark ? 0.22 : 0.16)
              : context.appSurf,
          borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
          border: Border.all(
            color: selected ? accent.withOpacity(0.55) : context.appBorder,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: selected ? accent : context.appMuted,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? context.appInk : context.appMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Segmented control (week / month / year style).
class StillSegmented extends StatelessWidget {
  final List<String> labels;
  final int index;
  final ValueChanged<int> onChanged;

  const StillSegmented({
    super.key,
    required this.labels,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.appSurfSoft,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.appBorder.withOpacity(0.8)),
      ),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == index;
          return Expanded(
            child: StillPressable(
              onTap: () => onChanged(i),
              scale: 0.98,
              child: AnimatedContainer(
                duration: AppDimensions.fast,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? context.appSurf : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: context.appInk.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[i],
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight:
                        selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? context.appInk : context.appMuted,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
