import 'package:flutter/material.dart';
import 'package:still_here/common/constants.dart';

/// Theme-aware StillHere colors for screens.
extension AppThemeColors on BuildContext {
  ColorScheme get cs => Theme.of(this).colorScheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get appBg => isDark ? AppColors.darkBg : AppColors.lightBg;
  Color get appSurf => isDark ? AppColors.darkSurf : AppColors.lightSurf;
  Color get appInk => isDark ? AppColors.darkInk : AppColors.lightInk;
  Color get appMuted => isDark ? AppColors.darkMuted : AppColors.lightMuted;
  Color get appBorder => isDark ? AppColors.darkBorder : AppColors.lightBorder;
  Color get appBrand => AppColors.brand;
  Color get appBrandSoft =>
      isDark ? AppColors.brandSoft : AppColors.brand;
}
