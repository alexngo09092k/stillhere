import 'package:still_here/generated/l10n.dart';
import 'dart:convert';

enum TimeBucket {
  morning('MORNING'),
  afternoon('AFTERNOON'),
  evening('EVENING');

  const TimeBucket(this.value);
  final String value;

  static TimeBucket fromHour(int hour) {
    if (hour >= 5 && hour < 12) return TimeBucket.morning;
    if (hour >= 12 && hour < 18) return TimeBucket.afternoon;
    return TimeBucket.evening;
  }

  static TimeBucket fromString(String v) {
    switch (v.toUpperCase()) {
      case 'MORNING':
        return TimeBucket.morning;
      case 'AFTERNOON':
        return TimeBucket.afternoon;
      case 'EVENING':
        return TimeBucket.evening;
      default:
        return TimeBucket.morning;
    }
  }

  String get label {
    try {
      final s = S.current;
      switch (this) {
        case TimeBucket.morning:
          return s.morning;
        case TimeBucket.afternoon:
          return s.afternoon;
        case TimeBucket.evening:
          return s.evening;
      }
    } catch (_) {
      switch (this) {
        case TimeBucket.morning:
          return 'Morning';
        case TimeBucket.afternoon:
          return 'Afternoon';
        case TimeBucket.evening:
          return 'Evening';
      }
    }
  }

  @Deprecated('Use label')
  String get labelVi => label;
}

class Greeting {
  final String cacheKey;
  final String greetingText;
  final String source; // AI | STATIC
  final String localDate;
  final TimeBucket timeBucket;
  final String language;
  final String promptVersion;
  final String? modelId;
  final int createdAtUtc;
  final int expiresAtUtc;

  const Greeting({
    required this.cacheKey,
    required this.greetingText,
    required this.source,
    required this.localDate,
    required this.timeBucket,
    required this.language,
    required this.promptVersion,
    this.modelId,
    required this.createdAtUtc,
    required this.expiresAtUtc,
  });

  bool get isValid {
    final now = DateTime.now().millisecondsSinceEpoch;
    return now < expiresAtUtc && greetingText.trim().isNotEmpty;
  }

  Map<String, dynamic> toMap() {
    return {
      'cacheKey': cacheKey,
      'greetingText': greetingText,
      'source': source,
      'localDate': localDate,
      'timeBucket': timeBucket.value,
      'language': language,
      'promptVersion': promptVersion,
      'modelId': modelId,
      'createdAtUtc': createdAtUtc,
      'expiresAtUtc': expiresAtUtc,
    };
  }

  factory Greeting.fromMap(Map<String, dynamic> map) {
    return Greeting(
      cacheKey: map['cacheKey'] as String,
      greetingText: map['greetingText'] as String,
      source: map['source'] as String,
      localDate: map['localDate'] as String,
      timeBucket: TimeBucket.fromString(map['timeBucket'] as String),
      language: map['language'] as String,
      promptVersion: map['promptVersion'] as String,
      modelId: map['modelId'] as String?,
      createdAtUtc: map['createdAtUtc'] as int,
      expiresAtUtc: map['expiresAtUtc'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Greeting.fromJson(String source) =>
      Greeting.fromMap(json.decode(source) as Map<String, dynamic>);
}
