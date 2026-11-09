part of '../constants.dart';

/// Still Here palette — calm twilight violet with warm sunrise accents.
class AppColors extends FlutteringColors {
  static final AppColors _instance = AppColors._internal();
  static AppColors get instance => _instance;

  factory AppColors() => _instance;

  AppColors._internal();

  // Brand — twilight violet, inspired by the Still Here sunrise mark.
  static const Color brand = Color(0xFF7057D9);
  static const Color brandSoft = Color(0xFF9B88FF);
  static const Color accent = Color(0xFFE8B96B);

  // Light surfaces
  static const Color lightBg = Color(0xFFF8F7FC);
  static const Color lightSurf = Color(0xFFFFFFFF);
  static const Color lightInk = Color(0xFF25233B);
  static const Color lightMuted = Color(0xFF706E88);
  static const Color lightBorder = Color(0xFFE7E3F2);

  // Dark surfaces — deep indigo rather than pure black.
  static const Color darkBg = Color(0xFF11101D);
  static const Color darkSurf = Color(0xFF1D1B30);
  static const Color darkInk = Color(0xFFF3F0FF);
  static const Color darkMuted = Color(0xFFB8B3D0);
  static const Color darkBorder = Color(0xFF38344F);

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
        colors: [Color(0xFF7057D9), Color(0xFF9B88FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get heroGradient => const LinearGradient(
        colors: [
          Color(0xFF7057D9),
          Color(0xFF9B88FF),
          Color(0xFFE8B96B),
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
