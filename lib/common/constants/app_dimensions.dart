part of '../constants.dart';

/// Spacing, radius, motion, and layout tokens for Still Here.
class AppDimensions {
  static final AppDimensions _instance = AppDimensions._internal();
  static AppDimensions get instance => _instance;

  factory AppDimensions() => _instance;

  AppDimensions._internal();

  // ---- Legacy API (kept for existing call sites) ----
  final double fontsize = 14;
  double fontsizeX(double x) => fontsize * x;

  final double padding = 16;
  double paddingX(double x) => padding * x;

  final double radius = 16;
  double radiusX(double x) => radius * x;

  final double icon = 24;
  double iconX(double x) => icon * x;

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
  );

  Size get gridItemSize {
    final int count = gridDelegate.crossAxisCount;
    final double spacing = gridDelegate.crossAxisSpacing;
    final double horizontalPad = padding * 2;
    final double side = (AwesomeAppState.screen.width -
            horizontalPad -
            spacing * (count - 1)) /
        count;
    return Size(side, side);
  }

  double get contentMaxWidth => AwesomeAppState.screen.width - padding * 2;

  // ---- Design system scale (prefer these in new UI) ----
  static const double unit = 4;
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 12;
  static const double spaceLg = 16;
  static const double spaceXl = 20;
  static const double space2xl = 24;
  static const double space3xl = 32;
  static const double space4xl = 40;

  static const double pagePaddingH = 20;
  static const double pagePaddingV = 16;
  static const EdgeInsets pagePadding =
      EdgeInsets.fromLTRB(pagePaddingH, pagePaddingV, pagePaddingH, 28);

  static const double radiusSm = 10;
  static const double radiusMd = 14;
  static const double radiusLg = 18;
  static const double radiusXl = 24;
  static const double radiusPill = 999;

  static const double minTouch = 48;
  static const double ctaHeight = 54;
  static const double cardPadding = 16;
  static const double cardPaddingLg = 20;

  static const Duration fast = Duration(milliseconds: 160);
  static const Duration normal = Duration(milliseconds: 240);
  static const Duration slow = Duration(milliseconds: 360);
  static const Curve easeOut = Curves.easeOutCubic;
  static const Curve easeInOut = Curves.easeInOutCubic;
}
