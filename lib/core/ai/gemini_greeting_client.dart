import 'dart:convert';

import 'package:fluttering/fluttering.dart';
import 'package:http/http.dart' as http;
import 'package:still_here/shared/models/greeting.dart';

/// Free-tier Gemini client for daily greeting.
///
/// Uses Google AI Studio free quota (gemini-2.0-flash / gemini-1.5-flash).
/// - No check-in notes or mood data are ever sent (PRD security baseline).
/// - Payload: language + time bucket + short style instruction only.
/// - On any failure → returns null so caller falls back to static greeting.
class GeminiGreetingClient {
  GeminiGreetingClient({
    required this.apiKey,
    this.model = 'gemini-2.0-flash',
    this.timeout = const Duration(seconds: 5),
  });

  /// From remote config or compile-time env. Empty key → always null.
  final String apiKey;
  final String model;
  final Duration timeout;

  static const String _base =
      'https://generativelanguage.googleapis.com/v1beta/models';

  /// Returns a short gentle greeting, or null on any error / invalid key.
  Future<String?> generate({
    required String language,
    required TimeBucket bucket,
  }) async {
    if (apiKey.trim().isEmpty) {
      Debug.log('[Gemini] no API key → skip');
      return null;
    }

    final langName = _languageName(language);
    final period = _periodName(bucket, language);

    final prompt = '''
You are a warm, quiet companion for a wellbeing app called "Still Here".
Write ONE short daily greeting (1–2 sentences, max 200 characters).
Tone: gentle, non-clinical, non-judgmental, hopeful. No medical advice.
No questions that demand a long answer. No hashtags, no emoji overload (0–1 emoji max).
IMPORTANT: Write the ENTIRE greeting in $langName only. Do not mix languages. If the language is Vietnamese, Thai, or Chinese, do not use English words except proper names.
Time of day: $period.
Do not mention AI, models, or that you are a bot.
Output only the greeting text, nothing else.
''';

    final uri = Uri.parse(
      '$_base/$model:generateContent?key=${Uri.encodeQueryComponent(apiKey)}',
    );

    try {
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'contents': [
                {
                  'parts': [
                    {'text': prompt},
                  ],
                },
              ],
              'generationConfig': {
                'temperature': 0.85,
                'maxOutputTokens': 120,
                'topP': 0.9,
              },
              'safetySettings': [
                {
                  'category': 'HARM_CATEGORY_HARASSMENT',
                  'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
                },
                {
                  'category': 'HARM_CATEGORY_HATE_SPEECH',
                  'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
                },
                {
                  'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT',
                  'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
                },
                {
                  'category': 'HARM_CATEGORY_DANGEROUS_CONTENT',
                  'threshold': 'BLOCK_MEDIUM_AND_ABOVE',
                },
              ],
            }),
          )
          .timeout(timeout);

      if (response.statusCode != 200) {
        Debug.log(
          '[Gemini] HTTP ${response.statusCode}: ${response.body.length > 200 ? response.body.substring(0, 200) : response.body}',
        );
        return null;
      }

      final map = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = map['candidates'] as List?;
      if (candidates == null || candidates.isEmpty) return null;

      final content = candidates.first['content'] as Map<String, dynamic>?;
      final parts = content?['parts'] as List?;
      if (parts == null || parts.isEmpty) return null;

      final text = (parts.first['text'] as String?)?.trim();
      if (text == null || text.isEmpty) return null;
      return text;
    } catch (e) {
      Debug.log('[Gemini] error: $e');
      return null;
    }
  }

  String _languageName(String code) {
    switch (code.toLowerCase()) {
      case 'vi':
        return 'Vietnamese';
      case 'th':
        return 'Thai';
      case 'zh':
        return 'Simplified Chinese';
      case 'en':
      default:
        return 'English';
    }
  }

  String _periodName(TimeBucket bucket, String language) {
    final lang = language.toLowerCase();
    switch (bucket) {
      case TimeBucket.morning:
        if (lang == 'vi') return 'buổi sáng';
        if (lang == 'th') return 'เช้า';
        if (lang == 'zh') return '早上';
        return 'morning';
      case TimeBucket.afternoon:
        if (lang == 'vi') return 'buổi chiều';
        if (lang == 'th') return 'บ่าย';
        if (lang == 'zh') return '下午';
        return 'afternoon';
      case TimeBucket.evening:
        if (lang == 'vi') return 'buổi tối';
        if (lang == 'th') return 'เย็น';
        if (lang == 'zh') return '晚上';
        return 'evening';
    }
  }
}
