import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/common/theme.dart';

void main() {
  testWidgets('light theme uses the Still Here light palette', (tester) async {
    late ThemeData theme;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            theme = getLightTheme(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(theme.brightness, Brightness.light);
    expect(theme.scaffoldBackgroundColor, AppColors.lightBg);
    expect(theme.cardColor, AppColors.lightSurf);
    expect(theme.colorScheme.primary, AppColors.brand);
    expect(theme.inputDecorationTheme.fillColor, isNot(Colors.white));
  });

  testWidgets('dark theme uses dark surfaces and readable text', (tester) async {
    late ThemeData theme;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            theme = getDarkTheme(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(theme.brightness, Brightness.dark);
    expect(theme.scaffoldBackgroundColor, AppColors.darkBg);
    expect(theme.cardColor, AppColors.darkSurf);
    expect(theme.colorScheme.onSurface, AppColors.darkInk);
    expect(theme.colorScheme.primary, AppColors.brandSoft);
    expect(theme.colorScheme.onPrimary, const Color(0xFF211B3D));
    expect(theme.inputDecorationTheme.fillColor, const Color(0xFF25223B));
    expect(theme.inputDecorationTheme.fillColor, isNot(Colors.white));
  });
}
