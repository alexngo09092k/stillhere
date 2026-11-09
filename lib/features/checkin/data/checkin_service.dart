import 'package:fluttering/fluttering.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:intl/intl.dart';

/// Check-in service – 1 bản ghi / localDate, cho phép edit cùng ngày.
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

  /// Tạo hoặc cập nhật check-in của ngày hiện tại (hoặc ngày chỉ định).
  Future<CheckIn?> save({
    required CheckInStatus status,
    String? note,
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

    final checkIn = existing != null
        ? existing.copyWith(
            status: status,
            note: cleanedNote,
            updatedAtUtc: now,
          )
        : CheckIn(
            id: _generateId(),
            localDate: date,
            status: status,
            note: cleanedNote,
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

  /// Tổng quan tuần / tháng
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
}
