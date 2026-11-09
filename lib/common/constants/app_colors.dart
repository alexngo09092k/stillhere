part of '../constants.dart';

/// StillHere palette — soft sage background + coral accent.
class AppColors extends FlutteringColors {
  static final AppColors _instance = AppColors._internal();
  static AppColors get instance => _instance;

  factory AppColors() => _instance;

  AppColors._internal();

  // Brand
  static const Color brand = Color(0xFFE58B78);
  static const Color brandSoft = Color(0xFFF0A897);
  static const Color accent = Color(0xFF7CB8A4);

  // Light
  static const Color lightBg = Color(0xFFF7F9F8);
  static const Color lightSurf = Color(0xFFFFFFFF);
  static const Color lightInk = Color(0xFF263238);
  static const Color lightMuted = Color(0xFF607D8B);
  static const Color lightBorder = Color(0xFFDDE9E1);

  // Dark
  static const Color darkBg = Color(0xFF12171A);
  static const Color darkSurf = Color(0xFF1C2428);
  static const Color darkInk = Color(0xFFE8EEF0);
  static const Color darkMuted = Color(0xFF9AAEB8);
  static const Color darkBorder = Color(0xFF2A353A);

  @override
  Color get lightBackground => lightBg;
  @override
  Color get darkBackground => darkBg;

  @override
  Color get darkOnPrimary => white;
  @override
  Color get darkOnSecondary => white;

  @override
  LinearGradient get gradient => const LinearGradient(
        colors: [Color(0xFFE58B78), Color(0xFFF0A897)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get heroGradient => const LinearGradient(
        colors: [
          Color(0xFFE58B78),
          Color(0xFFF0A897),
          Color(0xFF7CB8A4),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  BoxShadow get boxShadow => BoxShadow(
        color: const Color(0xFF64748B).withOpacity(0.08),
        offset: const Offset(0, 6),
        blurRadius: 20,
        spreadRadius: -4,
      );

  BoxShadow get softShadow => BoxShadow(
        color: const Color(0xFF64748B).withOpacity(0.05),
        offset: const Offset(0, 3),
        blurRadius: 12,
        spreadRadius: -2,
      );

  BoxShadow get cardShadow => BoxShadow(
        color: const Color(0xFF64748B).withOpacity(0.07),
        offset: const Offset(0, 8),
        blurRadius: 24,
        spreadRadius: -6,
      );

  BoxShadow get darkCardShadow => BoxShadow(
        color: Colors.black.withOpacity(0.35),
        offset: const Offset(0, 8),
        blurRadius: 24,
        spreadRadius: -6,
      );
}
