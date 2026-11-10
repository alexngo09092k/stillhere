import 'dart:convert';
import 'package:fluttering/fluttering.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/shared/models/greeting.dart';

/// Local-first storage based on SharedPreferences (available in fluttering).
/// No additional libraries.
class LocalStorage {
  LocalStorage._();
  static final LocalStorage instance = LocalStorage._();

  static const String _prefix = 'com.snapeditify.stillhere.';
  static const String _checkInsKey = '${_prefix}check_ins';
  static const String _greetingsKey = '${_prefix}greeting_cache';
  static const String _settingsKey = '${_prefix}app_settings';
  static const String _onboardingDoneKey = '${_prefix}onboarding_done';

  // ---------- Check-ins ----------
  Future<List<CheckIn>> getAllCheckIns() async {
    try {
      final raw = AsyncStorage.instance.getString(_checkInsKey);
      if (raw == null || raw.isEmpty) return [];
      final list = json.decode(raw) as List<dynamic>;
      return list
          .map((e) => CheckIn.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList()
        ..sort((a, b) => b.localDate.compareTo(a.localDate));
    } catch (e) {
      Debug.log('[LocalStorage] getAllCheckIns error: $e');
      return [];
    }
  }

  Future<CheckIn?> getCheckInByDate(String localDate) async {
    final all = await getAllCheckIns();
    try {
      return all.firstWhere((c) => c.localDate == localDate);
    } catch (_) {
      return null;
    }
  }

  Future<bool> upsertCheckIn(CheckIn checkIn) async {
    try {
      final all = await getAllCheckIns();
      final idx = all.indexWhere((c) => c.localDate == checkIn.localDate);
      if (idx >= 0) {
        all[idx] = checkIn;
      } else {
        all.add(checkIn);
      }
      all.sort((a, b) => b.localDate.compareTo(a.localDate));
      final encoded = json.encode(all.map((e) => e.toMap()).toList());
      await AsyncStorage.instance.setString(_checkInsKey, encoded);
      return true;
    } catch (e) {
      Debug.log('[LocalStorage] upsertCheckIn error: $e');
      return false;
    }
  }

  Future<bool> deleteCheckIn(String localDate) async {
    try {
      final all = await getAllCheckIns();
      all.removeWhere((c) => c.localDate == localDate);
      final encoded = json.encode(all.map((e) => e.toMap()).toList());
      await AsyncStorage.instance.setString(_checkInsKey, encoded);
      return true;
    } catch (e) {
      Debug.log('[LocalStorage] deleteCheckIn error: $e');
      return false;
    }
  }

  Future<bool> deleteAllCheckIns() async {
    try {
      await AsyncStorage.instance.remove(_checkInsKey);
      return true;
    } catch (e) {
      Debug.log('[LocalStorage] deleteAllCheckIns error: $e');
      return false;
    }
  }

  // ---------- Greetings cache ----------
  Future<Greeting?> getGreeting(String cacheKey) async {
    try {
      final raw = AsyncStorage.instance.getString(_greetingsKey);
      if (raw == null || raw.isEmpty) return null;
      final map = json.decode(raw) as Map<String, dynamic>;
      final item = map[cacheKey];
      if (item == null) return null;
      final g = Greeting.fromMap(Map<String, dynamic>.from(item as Map));
      if (!g.isValid) return null;
      return g;
    } catch (e) {
      Debug.log('[LocalStorage] getGreeting error: $e');
      return null;
    }
  }

  Future<void> saveGreeting(Greeting greeting) async {
    try {
      final raw = AsyncStorage.instance.getString(_greetingsKey);
      Map<String, dynamic> map = {};
      if (raw != null && raw.isNotEmpty) {
        map = Map<String, dynamic>.from(json.decode(raw) as Map);
      }
      map[greeting.cacheKey] = greeting.toMap();
      // Keep at most 30 most recent cache entries
      if (map.length > 30) {
        final keys = map.keys.toList()
          ..sort((a, b) {
            final ea = (map[a] as Map)['expiresAtUtc'] as int? ?? 0;
            final eb = (map[b] as Map)['expiresAtUtc'] as int? ?? 0;
            return ea.compareTo(eb);
          });
        for (var i = 0; i < map.length - 30; i++) {
          map.remove(keys[i]);
        }
      }
      await AsyncStorage.instance.setString(_greetingsKey, json.encode(map));
    } catch (e) {
      Debug.log('[LocalStorage] saveGreeting error: $e');
    }
  }

  Future<List<String>> getRecentGreetingTexts({int limit = 5}) async {
    try {
      final raw = AsyncStorage.instance.getString(_greetingsKey);
      if (raw == null || raw.isEmpty) return [];
      final map = json.decode(raw) as Map<String, dynamic>;
      final list =
          map.values
              .map((e) => Greeting.fromMap(Map<String, dynamic>.from(e as Map)))
              .toList()
            ..sort((a, b) => b.createdAtUtc.compareTo(a.createdAtUtc));
      return list.take(limit).map((e) => e.greetingText).toList();
    } catch (_) {
      return [];
    }
  }

  /// Clear cached greetings so the next load uses the current language.
  Future<void> clearGreetings() async {
    try {
      await AsyncStorage.instance.remove(_greetingsKey);
    } catch (e) {
      Debug.log('[LocalStorage] clearGreetings error: $e');
    }
  }

  // ---------- Settings ----------
  Future<Map<String, dynamic>> getSettings() async {
    try {
      final raw = AsyncStorage.instance.getString(_settingsKey);
      if (raw == null || raw.isEmpty) return _defaultSettings();
      return Map<String, dynamic>.from(json.decode(raw) as Map);
    } catch (_) {
      return _defaultSettings();
    }
  }

  Future<void> saveSettings(Map<String, dynamic> settings) async {
    try {
      await AsyncStorage.instance.setString(
        _settingsKey,
        json.encode(settings),
      );
    } catch (e) {
      Debug.log('[LocalStorage] saveSettings error: $e');
    }
  }

  Future<void> updateSetting(String key, dynamic value) async {
    final s = await getSettings();
    s[key] = value;
    await saveSettings(s);
  }

  Map<String, dynamic> _defaultSettings() => {
    'reminder.enabled': false,
    'reminder.hour': 9,
    'reminder.minute': 0,
    'ai.enabled': true,
    'language': 'en',
    'theme': 'light',
  };

  // ---------- Onboarding ----------
  Future<bool> isOnboardingDone() async {
    final v = AsyncStorage.instance.getBool(_onboardingDoneKey);
    return v ?? false;
  }

  Future<void> setOnboardingDone(bool done) async {
    await AsyncStorage.instance.setBool(_onboardingDoneKey, done);
  }

  // ---------- Clear all ----------
  Future<void> clearAll() async {
    await AsyncStorage.instance.remove(_checkInsKey);
    await AsyncStorage.instance.remove(_greetingsKey);
    await AsyncStorage.instance.remove(_settingsKey);
    await AsyncStorage.instance.remove(_onboardingDoneKey);
  }
}
