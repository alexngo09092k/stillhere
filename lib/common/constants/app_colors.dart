part of '../constants.dart';

/// StillHere palette — soft wellness: warm cream, peach, nature greens.
/// Aligned with the product design mockups (sunrise / florals / calm).
class AppColors extends FlutteringColors {
  static final AppColors _instance = AppColors._internal();
  static AppColors get instance => _instance;

  factory AppColors() => _instance;

  AppColors._internal();

  // Brand — warm peach / soft terracotta (CTA & accents)
  static const Color brand = Color(0xFFD4A574);
  static const Color brandSoft = Color(0xFFE8C4A0);
  static const Color brandDeep = Color(0xFFC4895A);
  static const Color accent = Color(0xFF8BA888); // soft sage
  static const Color accentWarm = Color(0xFFE8B89A);

  // Mood accents
  static const Color moodOk = Color(0xFFF0C27A); // sun
  static const Color moodShare = Color(0xFFA8C5D4); // cloud
  static const Color moodSelfCare = Color(0xFF8BA888); // leaf

  // Light surfaces — cream / warm white
  static const Color lightBg = Color(0xFFF7F2EB);
  static const Color lightSurf = Color(0xFFFFFCF9);
  static const Color lightSurfSoft = Color(0xFFFDF8F3);
  static const Color lightInk = Color(0xFF3D3429);
  static const Color lightMuted = Color(0xFF9A8F82);
  static const Color lightBorder = Color(0xFFEDE6DC);
  static const Color lightCardBorder = Color(0xFFF0E9DF);

  // Dark surfaces — warm deep brown / charcoal
  static const Color darkBg = Color(0xFF1A1612);
  static const Color darkSurf = Color(0xFF25201B);
  static const Color darkInk = Color(0xFFF5EFE6);
  static const Color darkMuted = Color(0xFFB5A99A);
  static const Color darkBorder = Color(0xFF3A332C);

  @override
  Color get lightBackground => lightBg;
  @override
  Color get darkBackground => darkBg;

  @override
  Color get darkOnPrimary => const Color(0xFF2A2118);
  @override
  Color get darkOnSecondary => const Color(0xFF2A2118);

  @override
  LinearGradient get gradient => const LinearGradient(
        colors: [Color(0xFFE8C4A0), Color(0xFFD4A574)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get heroGradient => const LinearGradient(
        colors: [
          Color(0xFFFFE8D6),
          Color(0xFFF7F2EB),
          Color(0xFFE8F0E6),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  LinearGradient get ctaGradient => const LinearGradient(
        colors: [Color(0xFFE8B89A), Color(0xFFD4A574)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

  LinearGradient get softPeachGradient => const LinearGradient(
        colors: [Color(0xFFFFF5EC), Color(0xFFF5E6D8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  BoxShadow get boxShadow => BoxShadow(
        color: const Color(0xFF3D3429).withOpacity(0.06),
        offset: const Offset(0, 6),
        blurRadius: 20,
        spreadRadius: -4,
      );

  BoxShadow get softShadow => BoxShadow(
        color: const Color(0xFF3D3429).withOpacity(0.04),
        offset: const Offset(0, 3),
        blurRadius: 12,
        spreadRadius: -2,
      );

  BoxShadow get cardShadow => BoxShadow(
        color: const Color(0xFF3D3429).withOpacity(0.05),
        offset: const Offset(0, 8),
        blurRadius: 28,
        spreadRadius: -6,
      );

  BoxShadow get darkCardShadow => BoxShadow(
        color: Colors.black.withOpacity(0.35),
        offset: const Offset(0, 8),
        blurRadius: 24,
        spreadRadius: -6,
      );
}
