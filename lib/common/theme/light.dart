part of '../theme.dart';

ThemeData getLightTheme(BuildContext context, {double scale = 1}) {
  final base = ThemeData.light().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  final textTheme = buildTextTheme(base.textTheme, scale: scale).apply(
    bodyColor: AppColors.lightInk,
    displayColor: AppColors.lightInk,
    decorationColor: AppColors.lightInk,
  );

  final colorScheme = ColorScheme.light(
    primary: AppColors.brand,
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFF5E6D8),
    onPrimaryContainer: const Color(0xFF3D3429),
    secondary: AppColors.accent,
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFE4EFE3),
    onSecondaryContainer: const Color(0xFF2A3A28),
    surface: AppColors.lightSurf,
    onSurface: AppColors.lightInk,
    surfaceContainerHighest: AppColors.lightSurfSoft,
    onSurfaceVariant: AppColors.lightMuted,
    error: const Color(0xFFC45C4A),
    onError: Colors.white,
    outline: AppColors.lightBorder,
    outlineVariant: AppColors.lightCardBorder,
    shadow: const Color(0xFF3D3429),
  );

  return base.copyWith(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.brand,
    scaffoldBackgroundColor: AppColors.lightBg,
    canvasColor: AppColors.lightBg,
    cardColor: AppColors.lightSurf,
    dividerColor: colorScheme.outlineVariant,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    colorScheme: colorScheme,
    splashColor: AppColors.brand.withOpacity(0.08),
    highlightColor: AppColors.brand.withOpacity(0.05),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.lightBg,
      foregroundColor: AppColors.lightInk,
      centerTitle: true,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.lightInk,
      ),
      iconTheme: IconThemeData(
        color: AppColors.lightInk,
        size: AppDimensions.instance.icon,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurf,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.brand,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brandDeep,
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brandDeep,
        side: BorderSide(color: AppColors.brand.withOpacity(0.45)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.brand,
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightSurf,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titleTextStyle:
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      contentTextStyle: textTheme.bodyMedium,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightSurf,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurfSoft,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.brand, width: 1.4),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.lightMuted),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightSurfSoft,
      selectedColor: AppColors.brand.withOpacity(0.16),
      labelStyle: textTheme.labelMedium!,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: BorderSide.none,
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      iconColor: AppColors.lightInk.withOpacity(0.75),
      textColor: AppColors.lightInk,
      titleTextStyle: textTheme.titleSmall,
      subtitleTextStyle:
          textTheme.bodySmall?.copyWith(color: AppColors.lightMuted),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant.withOpacity(0.7),
      thickness: 1,
      space: 1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.brand,
      linearTrackColor: Color(0xFFEDE6DC),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.lightInk,
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    iconTheme: IconThemeData(
      color: AppColors.lightInk.withOpacity(0.88),
      size: AppDimensions.instance.icon,
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brand,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),
        switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.white;
        return const Color(0xFFF7F2EB);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.brandDeep;
        return const Color(0xFFD9D0C4);
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.transparent;
        return const Color(0xFFC9BFAF);
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightSurf,
      indicatorColor: AppColors.brand.withOpacity(0.16),
      elevation: 0,
      height: 68,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return textTheme.labelSmall?.copyWith(
          color: selected ? AppColors.brandDeep : AppColors.lightMuted,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? AppColors.brandDeep : AppColors.lightMuted,
        );
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurf,
      selectedItemColor: AppColors.brandDeep,
      unselectedItemColor: AppColors.lightMuted,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: textTheme.labelSmall,
      unselectedLabelStyle: textTheme.labelSmall,
    ),
  );
}
