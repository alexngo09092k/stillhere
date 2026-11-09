import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttering/fluttering.dart';
import 'package:still_here/common/constants.dart';

class AppThemeProvider extends ThemeProvider {
  AppThemeProvider({
    super.themeMode = ThemeMode.system,
    super.locale = const Locale('en'),
  });

  @override
  void setStatusBarByTheme(ThemeMode themeMode) {
    final platformDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    final useDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && platformDark);

    if (useDark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppColors.darkBg,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: AppColors.lightBg,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}
