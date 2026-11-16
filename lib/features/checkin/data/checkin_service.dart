import 'package:fluttering/fluttering.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:intl/intl.dart';

/// Check-in service – 1 record per localDate, editable same day.
class CheckInService {
  CheckInService._();
  static final CheckInService instance = CheckInService._();

  String _generateId() =>
      DateTime.now().millisecondsSinceEpoch.toString() +
      (1000 + DateTime.now().microsecond % 9000).toString();

  String todayLocalDate() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<CheckIn?> getToday() async {
    return LocalStorage.instance.getCheckInByDate(todayLocalDate());
  }

  Future<CheckIn?> getByDate(String localDate) async {
    return LocalStorage.instance.getCheckInByDate(localDate);
  }

  Future<List<CheckIn>> getAll() async {
    return LocalStorage.instance.getAllCheckIns();
  }

  Future<List<CheckIn>> getByMonth(int year, int month) async {
    final all = await getAll();
    final prefix = '$year-${month.toString().padLeft(2, '0')}';
    return all.where((c) => c.localDate.startsWith(prefix)).toList();
  }

  /// Create or update check-in for the current day (or a specified day).
  Future<CheckIn?> save({
    required CheckInStatus status,
    String? note,
    List<String>? activities,
    String? localDate,
  }) async {
    final date = localDate ?? todayLocalDate();
    final existing = await getByDate(date);
    final now = DateTime.now().millisecondsSinceEpoch;
    final tz = DateTime.now().timeZoneName;

    final cleanedNote = (note?.trim().isEmpty ?? true) ? null : note!.trim();
    if (cleanedNote != null && cleanedNote.length > 500) {
      Debug.log('[CheckIn] note too long');
      return null;
    }

    final acts = activities ?? existing?.activities ?? const <String>[];

    final checkIn = existing != null
        ? existing.copyWith(
            status: status,
            note: cleanedNote,
            activities: acts,
            updatedAtUtc: now,
          )
        : CheckIn(
            id: _generateId(),
            localDate: date,
            status: status,
            note: cleanedNote,
            activities: acts,
            timezoneId: tz,
            createdAtUtc: now,
            updatedAtUtc: now,
          );

    final ok = await LocalStorage.instance.upsertCheckIn(checkIn);
    return ok ? checkIn : null;
  }

  Future<bool> delete(String localDate) async {
    return LocalStorage.instance.deleteCheckIn(localDate);
  }

  Future<bool> deleteAll() async {
    return LocalStorage.instance.deleteAllCheckIns();
  }

  /// Weekly / monthly overview
  Future<Map<String, int>> summaryForMonth(int year, int month) async {
    final list = await getByMonth(year, month);
    final result = <String, int>{
      'total': list.length,
      'OK': 0,
      'SHARE': 0,
      'SELF_CARE': 0,
    };
    for (final c in list) {
      result[c.status.value] = (result[c.status.value] ?? 0) + 1;
    }
    return result;
  }

  /// Current consecutive daily check-in streak ending today or yesterday.
  Future<int> getCurrentStreak() async {
    final all = await getAll();
    if (all.isEmpty) return 0;
    final dates = all.map((c) => c.localDate).toSet();
    final today = DateTime.now();
    var cursor = DateTime(today.year, today.month, today.day);
    final todayStr = DateFormat('yyyy-MM-dd').format(cursor);
    if (!dates.contains(todayStr)) {
      cursor = cursor.subtract(const Duration(days: 1));
    }
    var streak = 0;
    while (true) {
      final key = DateFormat('yyyy-MM-dd').format(cursor);
      if (!dates.contains(key)) break;
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  /// Longest consecutive streak in history.
  Future<int> getLongestStreak() async {
    final all = await getAll();
    if (all.isEmpty) return 0;
    final dates = all.map((c) => c.localDate).toSet().toList()..sort();
    var longest = 1;
    var current = 1;
    for (var i = 1; i < dates.length; i++) {
      final prev = DateTime.parse(dates[i - 1]);
      final cur = DateTime.parse(dates[i]);
      if (cur.difference(prev).inDays == 1) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 1;
      }
    }
    return longest;
  }

  /// Total check-in days.
  Future<int> getTotalDays() async {
    final all = await getAll();
    return all.length;
  }

  /// Past check-ins on the same month-day (memory / "on this day").
  Future<List<CheckIn>> getOnThisDay({DateTime? of}) async {
    final ref = of ?? DateTime.now();
    final mm = ref.month.toString().padLeft(2, '0');
    final dd = ref.day.toString().padLeft(2, '0');
    final suffix = '-$mm-$dd';
    final today = todayLocalDate();
    final all = await getAll();
    return all
        .where((c) => c.localDate.endsWith(suffix) && c.localDate != today)
        .toList();
  }
}
