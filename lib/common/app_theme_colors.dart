import 'package:flutter/material.dart';
import 'package:still_here/common/constants.dart';

/// Theme-aware StillHere colors for screens.
extension AppThemeColors on BuildContext {
  ColorScheme get cs => Theme.of(this).colorScheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get appBg => isDark ? AppColors.darkBg : AppColors.lightBg;
  Color get appSurf => isDark ? AppColors.darkSurf : AppColors.lightSurf;
  Color get appSurfSoft =>
      isDark ? AppColors.darkSurf : AppColors.lightSurfSoft;
  Color get appInk => isDark ? AppColors.darkInk : AppColors.lightInk;
  Color get appMuted => isDark ? AppColors.darkMuted : AppColors.lightMuted;
  Color get appBorder => isDark ? AppColors.darkBorder : AppColors.lightBorder;
  Color get appBrand => isDark ? AppColors.brandSoft : AppColors.brand;
  Color get appBrandSoft => AppColors.brandSoft;
  Color get appBrandDeep => AppColors.brandDeep;
  Color get appAccent => AppColors.accent;

  LinearGradient get appCtaGradient => AppColors.instance.ctaGradient;
  LinearGradient get appHeroGradient => AppColors.instance.heroGradient;
  LinearGradient get appSoftPeachGradient =>
      AppColors.instance.softPeachGradient;

  List<BoxShadow> get appCardShadow => [
        isDark ? AppColors.instance.darkCardShadow : AppColors.instance.cardShadow,
      ];
}
