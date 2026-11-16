import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/shared/models/check_in.dart';

/// Local-only weekly summary for Home (personalized, no network).
class WeeklyInsight {
  final int daysCheckedIn;
  final int daysInWindow;
  final CheckInStatus? dominantStatus;
  final int streak;

  const WeeklyInsight({
    required this.daysCheckedIn,
    required this.daysInWindow,
    required this.dominantStatus,
    required this.streak,
  });

  static Future<WeeklyInsight> compute({int windowDays = 7}) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: windowDays - 1));
    final all = await CheckInService.instance.getAll();
    final inWindow = all.where((c) {
      final d = DateTime.tryParse(c.localDate);
      if (d == null) return false;
      final day = DateTime(d.year, d.month, d.day);
      return !day.isBefore(start) && !day.isAfter(now);
    }).toList();

    final counts = <CheckInStatus, int>{};
    for (final c in inWindow) {
      counts[c.status] = (counts[c.status] ?? 0) + 1;
    }
    CheckInStatus? dominant;
    var best = 0;
    counts.forEach((k, v) {
      if (v > best) {
        best = v;
        dominant = k;
      }
    });

    final streak = await CheckInService.instance.getCurrentStreak();
    return WeeklyInsight(
      daysCheckedIn: inWindow.length,
      daysInWindow: windowDays,
      dominantStatus: dominant,
      streak: streak,
    );
  }

  /// Human message in the user's language — original copy, not third-party.
  String message(String lang) {
    if (daysCheckedIn == 0) {
      return _t(
        lang,
        en: 'This week is still open. One small check-in is enough to begin.',
        vi: 'Tuần này vẫn còn trống. Một lần check-in nhỏ là đủ để bắt đầu.',
        th: 'สัปดาห์นี้ยังว่าง เช็คอินเล็ก ๆ ครั้งเดียวก็พอเริ่ม',
        zh: '这周还可以开始。一次小小的打卡就够了。',
      );
    }

    final moodBit = switch (dominantStatus) {
      CheckInStatus.ok => _t(
          lang,
          en: 'Okay moments showed up most often.',
          vi: 'Những ngày “ổn” xuất hiện nhiều nhất.',
          th: 'ช่วง “โอเค” โผล่มากที่สุด',
          zh: '“还好”的日子出现得最多。',
        ),
      CheckInStatus.share => _t(
          lang,
          en: 'You often marked days that needed space to share.',
          vi: 'Bạn thường ghi những ngày cần được chia sẻ.',
          th: 'หลายวันที่อยากแบ่งปานถูกบันทึกไว้',
          zh: '你常记录需要被倾听的日子。',
        ),
      CheckInStatus.selfCare => _t(
          lang,
          en: 'Self-care days stood out this week.',
          vi: 'Những ngày cần tự chăm sóc nổi bật tuần này.',
          th: 'วันที่ต้องการดูแลตัวเองเด่นขึ้นสัปดาห์นี้',
          zh: '需要自我照顾的日子在这周很显眼。',
        ),
      null => '',
    };

    final head = _t(
      lang,
      en: 'You checked in $daysCheckedIn of $daysInWindow days.',
      vi: 'Bạn đã check-in $daysCheckedIn/$daysInWindow ngày.',
      th: 'เช็คอินแล้ว $daysCheckedIn จาก $daysInWindow วัน',
      zh: '本周已打卡 $daysCheckedIn/$daysInWindow 天。',
    );

    if (streak >= 2) {
      final streakBit = _t(
        lang,
        en: 'Streak: $streak days.',
        vi: 'Chuỗi hiện tại: $streak ngày.',
        th: 'ต่อเนื่อง $streak วัน',
        zh: '连续 $streak 天。',
      );
      return [head, moodBit, streakBit].where((e) => e.isNotEmpty).join(' ');
    }
    return [head, moodBit].where((e) => e.isNotEmpty).join(' ');
  }

  static String _t(
    String lang, {
    required String en,
    required String vi,
    required String th,
    required String zh,
  }) {
    switch (lang) {
      case 'vi':
        return vi;
      case 'th':
        return th;
      case 'zh':
        return zh;
      default:
        return en;
    }
  }
}
