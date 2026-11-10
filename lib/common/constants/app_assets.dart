part of '../constants.dart';

///APP IMAGES
class AppAssets {
  static final AppAssets _instance = AppAssets._internal();
  static AppAssets get instance => _instance;

  factory AppAssets() => _instance;

  AppAssets._internal();

  /// Lotties
  static const String lottiePath = 'assets/lotties';

  final String auToAIAnim = '$lottiePath/autoai_anim.json';
  final String brushAnim = '$lottiePath/brush_anim.json';
  final String enhanceGuideBfAf = '$lottiePath/enhance_guide_bf_af.json';
  final String heartTeam = "$lottiePath/heart.json";
  final String confetti = "$lottiePath/confetti.json";

  /// Images
  static const String imagePath = 'assets/images';

  final String logo = "$imagePath/logo.png";
  final String logoMark = "$imagePath/logo_mark.png";
  final String logoWordmark = "$imagePath/logo_wordmark.png";
  final String heroSunrise = "$imagePath/hero_sunrise.jpg";
  final String heroMorning = "$imagePath/hero_morning.jpg";
  final String heroNoon = "$imagePath/hero_noon.jpg";
  final String heroAfternoon = "$imagePath/hero_afternoon.jpg";
  final String heroEvening = "$imagePath/hero_evening.jpg";
  final String heroSunriseSm = "$imagePath/hero_sunrise_sm.jpg";
  final String bgSuccess = "$imagePath/bg_success.jpg";
  final String imagePlaceholder = "$imagePath/image_placeholder.png";

  /// Icons
  static const String iconPath = '$imagePath/icons';
}
