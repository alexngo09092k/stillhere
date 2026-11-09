import 'package:fluttering/fluttering.dart';
import 'package:still_here/core/ai/gemini_greeting_client.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/features/greeting/data/static_greetings.dart';
import 'package:still_here/shared/models/greeting.dart';
import 'package:intl/intl.dart';

/// Hybrid greeting: cache → AI (Gemini free) → static fallback.
/// PRD: max 1 successful AI request / day, timeout, validate.
/// Never sends check-in notes or mood payloads.
class GreetingService {
  GreetingService._();
  static final GreetingService instance = GreetingService._();

  static const String promptVersion = 'p2';
  static const Duration cacheTtl = Duration(hours: 12);
  static const String _aiGateKey = 'app.still_here.studio.ai_gate_date';

  /// Override from remote config / settings. Empty → AI disabled.
  String geminiApiKey = '';

  /// Model id (free tier). Prefer flash for cost/latency.
  String geminiModel = 'gemini-2.0-flash';

  String _localDate() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  TimeBucket _currentBucket() {
    final hour = DateTime.now().hour;
    return TimeBucket.fromHour(hour);
  }

  String _cacheKey({
    required String language,
    required TimeBucket bucket,
  }) {
    return '${_localDate()}:$language:${bucket.value}:$promptVersion';
  }

  Future<Greeting> getTodayGreeting({
    String language = 'vi',
    bool aiEnabled = true,
  }) async {
    final bucket = _currentBucket();
    final key = _cacheKey(language: language, bucket: bucket);

    final cached = await LocalStorage.instance.getGreeting(key);
    if (cached != null && cached.isValid) {
      Debug.log('[Greeting] cache hit: ${cached.source}');
      return cached;
    }

    // Render path: try AI only if enabled, online, and daily gate open
    if (aiEnabled && InternetConnection.instance.hasConnection) {
      final gateOpen = await _canRequestAiToday();
      if (gateOpen) {
        try {
          final aiText = await _requestAiGreeting(
            language: language,
            bucket: bucket,
          ).timeout(const Duration(seconds: 6), onTimeout: () => null);
          if (aiText != null && _isValidAiText(aiText)) {
            await _markAiSuccessToday();
            final g = _buildGreeting(
              text: aiText.trim(),
              source: 'AI',
              language: language,
              bucket: bucket,
              key: key,
            );
            await LocalStorage.instance.saveGreeting(g);
            return g;
          }
        } catch (e) {
          Debug.log('[Greeting] AI error: $e');
        }
      } else {
        Debug.log('[Greeting] AI daily gate closed');
      }
    }

    final staticText = StaticGreetings.get(
      bucket: bucket,
      language: language,
      seed: DateTime.now().day + bucket.index,
    );
    final g = _buildGreeting(
      text: staticText,
      source: 'STATIC',
      language: language,
      bucket: bucket,
      key: key,
    );
    await LocalStorage.instance.saveGreeting(g);
    return g;
  }

  bool _isValidAiText(String text) {
    final t = text.trim();
    if (t.length < 8 || t.length > 280) return false;
    final lower = t.toLowerCase();
    const banned = [
      'you should see a doctor',
      'suicide',
      'kill yourself',
      'tự tử',
      'chẩn đoán',
      'diagnose',
      'prescription',
    ];
    for (final b in banned) {
      if (lower.contains(b)) return false;
    }
    return true;
  }

  Future<bool> _canRequestAiToday() async {
    final last = AsyncStorage.instance.getString(_aiGateKey);
    return last != _localDate();
  }

  Future<void> _markAiSuccessToday() async {
    await AsyncStorage.instance.setString(_aiGateKey, _localDate());
  }

  Greeting _buildGreeting({
    required String text,
    required String source,
    required String language,
    required TimeBucket bucket,
    required String key,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return Greeting(
      cacheKey: key,
      greetingText: text,
      source: source,
      localDate: _localDate(),
      timeBucket: bucket,
      language: language,
      promptVersion: promptVersion,
      modelId: source == 'AI' ? geminiModel : null,
      createdAtUtc: now,
      expiresAtUtc: now + cacheTtl.inMilliseconds,
    );
  }

  /// Gemini free-tier request. Never throws to UI.
  Future<String?> _requestAiGreeting({
    required String language,
    required TimeBucket bucket,
  }) async {
    if (geminiApiKey.trim().isEmpty) {
      Debug.log('[Greeting] AI not configured (empty key) → static fallback');
      return null;
    }
    final client = GeminiGreetingClient(
      apiKey: geminiApiKey,
      model: geminiModel,
    );
    return client.generate(language: language, bucket: bucket);
  }
}
