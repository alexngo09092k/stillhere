part of '../theme.dart';

ThemeData getDarkTheme(BuildContext context, {double scale = 1}) {
  final base = ThemeData.dark().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  final textTheme = buildTextTheme(base.textTheme, scale: scale).apply(
    bodyColor: AppColors.darkInk,
    displayColor: AppColors.darkInk,
    decorationColor: AppColors.darkInk,
  );

  final colorScheme = ColorScheme.dark(
    primary: AppColors.brandSoft,
    onPrimary: const Color(0xFF211B3D),
    primaryContainer: const Color(0xFF393064),
    onPrimaryContainer: const Color(0xFFF1EDFF),
    secondary: AppColors.accent,
    onSecondary: const Color(0xFF30230D),
    secondaryContainer: const Color(0xFF493B27),
    onSecondaryContainer: const Color(0xFFFFE8BC),
    surface: AppColors.darkSurf,
    onSurface: AppColors.darkInk,
    surfaceVariant: const Color(0xFF29263F),
    onSurfaceVariant: const Color(0xFFC8C3DD),
    background: AppColors.darkBg,
    onBackground: AppColors.darkInk,
    error: const Color(0xFFF87171),
    onError: const Color(0xFF450A0A),
    outline: const Color(0xFF514B6B),
    outlineVariant: const Color(0xFF38344F),
    shadow: Colors.black,
  );

  return base.copyWith(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.brandSoft,
    scaffoldBackgroundColor: AppColors.darkBg,
    canvasColor: AppColors.darkBg,
    cardColor: AppColors.darkSurf,
    dividerColor: colorScheme.outlineVariant,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    colorScheme: colorScheme,
    splashColor: AppColors.brandSoft.withOpacity(0.12),
    highlightColor: AppColors.brandSoft.withOpacity(0.08),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: AppColors.darkBg,
      foregroundColor: AppColors.darkInk,
      centerTitle: true,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.darkInk,
      ),
      iconTheme: IconThemeData(
        color: AppColors.darkInk,
        size: AppDimensions.instance.icon,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkSurf,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.instance.radius),
        side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.brandSoft,
        foregroundColor: colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brandSoft,
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brandSoft,
        side: BorderSide(color: AppColors.brandSoft.withOpacity(0.45)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.brandSoft,
      foregroundColor: colorScheme.onPrimary,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurf,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      contentTextStyle: textTheme.bodyMedium,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkSurf,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF25223B),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.brandSoft, width: 1.4),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.darkMuted),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF29263F),
      selectedColor: AppColors.brandSoft.withOpacity(0.22),
      labelStyle: textTheme.labelMedium!,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: BorderSide.none,
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      iconColor: AppColors.darkInk.withOpacity(0.8),
      textColor: AppColors.darkInk,
      titleTextStyle: textTheme.titleSmall,
      subtitleTextStyle: textTheme.bodySmall?.copyWith(color: AppColors.darkMuted),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant.withOpacity(0.9),
      thickness: 1,
      space: 1,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.brandSoft,
      linearTrackColor: const Color(0xFF38344F),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF1F2937),
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    iconTheme: IconThemeData(
      color: AppColors.darkInk.withOpacity(0.9),
      size: AppDimensions.instance.icon,
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),


    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brandSoft,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkSurf,
      indicatorColor: AppColors.brand.withOpacity(0.18),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return textTheme.labelSmall?.copyWith(
          color: selected ? AppColors.brandSoft : AppColors.darkMuted,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? AppColors.brandSoft : AppColors.darkMuted,
        );
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurf,
      selectedItemColor: AppColors.brandSoft,
      unselectedItemColor: AppColors.darkMuted,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: textTheme.labelSmall,
      unselectedLabelStyle: textTheme.labelSmall,
    ),
  );
}
