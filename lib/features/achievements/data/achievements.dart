import 'package:still_here/features/checkin/data/checkin_service.dart';

class Achievement {
  final String id;
  final String titleVi;
  final String titleEn;
  final String descVi;
  final String descEn;
  final String emoji;
  final bool unlocked;
  final int progress;
  final int target;

  const Achievement({
    required this.id,
    required this.titleVi,
    required this.titleEn,
    required this.descVi,
    required this.descEn,
    required this.emoji,
    this.unlocked = false,
    this.progress = 0,
    this.target = 1,
  });

  String title(String lang) => lang == 'vi' ? titleVi : titleEn;
  String desc(String lang) => lang == 'vi' ? descVi : descEn;

  Achievement copyWith({bool? unlocked, int? progress}) {
    return Achievement(
      id: id,
      titleVi: titleVi,
      titleEn: titleEn,
      descVi: descVi,
      descEn: descEn,
      emoji: emoji,
      unlocked: unlocked ?? this.unlocked,
      progress: progress ?? this.progress,
      target: target,
    );
  }
}

/// Milestone system — another content layer beyond plain check-ins.
class AchievementService {
  AchievementService._();
  static final AchievementService instance = AchievementService._();

  static const _defs = <Achievement>[
    Achievement(
      id: 'first_checkin',
      titleVi: 'Bắt đầu hành trình',
      titleEn: 'Journey begins',
      descVi: 'Hoàn thành check-in đầu tiên',
      descEn: 'Complete your first check-in',
      emoji: '🌱',
      target: 1,
    ),
    Achievement(
      id: 'streak_3',
      titleVi: '3 ngày liên tiếp',
      titleEn: '3-day streak',
      descVi: 'Check-in 3 ngày liên tục',
      descEn: 'Check in 3 days in a row',
      emoji: '🔥',
      target: 3,
    ),
    Achievement(
      id: 'streak_7',
      titleVi: 'Một tuần dịu dàng',
      titleEn: 'Gentle week',
      descVi: 'Check-in 7 ngày liên tục',
      descEn: 'Check in 7 days in a row',
      emoji: '✨',
      target: 7,
    ),
    Achievement(
      id: 'streak_14',
      titleVi: 'Hai tuần hiện diện',
      titleEn: 'Two weeks present',
      descVi: 'Check-in 14 ngày liên tục',
      descEn: 'Check in 14 days in a row',
      emoji: '🌙',
      target: 14,
    ),
    Achievement(
      id: 'streak_30',
      titleVi: 'Một tháng ở đây',
      titleEn: 'A month here',
      descVi: 'Check-in 30 ngày liên tục',
      descEn: 'Check in 30 days in a row',
      emoji: '🏆',
      target: 30,
    ),
    Achievement(
      id: 'total_10',
      titleVi: '10 lần lắng nghe',
      titleEn: '10 moments of listening',
      descVi: 'Tổng 10 ngày đã check-in',
      descEn: '10 total check-in days',
      emoji: '📖',
      target: 10,
    ),
    Achievement(
      id: 'total_30',
      titleVi: '30 ngày quan tâm',
      titleEn: '30 days of care',
      descVi: 'Tổng 30 ngày đã check-in',
      descEn: '30 total check-in days',
      emoji: '💚',
      target: 30,
    ),
    Achievement(
      id: 'total_100',
      titleVi: '100 ngày vẫn ở đây',
      titleEn: '100 days still here',
      descVi: 'Tổng 100 ngày đã check-in',
      descEn: '100 total check-in days',
      emoji: '🌟',
      target: 100,
    ),
    Achievement(
      id: 'note_writer',
      titleVi: 'Người viết',
      titleEn: 'The writer',
      descVi: 'Viết note trong 5 lần check-in',
      descEn: 'Write a note on 5 check-ins',
      emoji: '✍️',
      target: 5,
    ),
    Achievement(
      id: 'self_care_friend',
      titleVi: 'Bạn của bản thân',
      titleEn: 'Friend to yourself',
      descVi: 'Chọn “Cần tự chăm sóc” 3 lần',
      descEn: 'Choose “Need self-care” 3 times',
      emoji: '🫂',
      target: 3,
    ),
  ];

  Future<List<Achievement>> evaluate() async {
    final total = await CheckInService.instance.getTotalDays();
    final streak = await CheckInService.instance.getCurrentStreak();
    final longest = await CheckInService.instance.getLongestStreak();
    final all = await CheckInService.instance.getAll();
    final notes = all.where((c) => (c.note ?? '').trim().isNotEmpty).length;
    final selfCare =
        all.where((c) => c.status.value == 'SELF_CARE').length;

    final bestStreak = streak > longest ? streak : longest;

    return _defs.map((a) {
      int progress = 0;
      switch (a.id) {
        case 'first_checkin':
        case 'total_10':
        case 'total_30':
        case 'total_100':
          progress = total;
          break;
        case 'streak_3':
        case 'streak_7':
        case 'streak_14':
        case 'streak_30':
          progress = bestStreak;
          break;
        case 'note_writer':
          progress = notes;
          break;
        case 'self_care_friend':
          progress = selfCare;
          break;
      }
      final unlocked = progress >= a.target;
      return a.copyWith(
        unlocked: unlocked,
        progress: progress.clamp(0, a.target),
      );
    }).toList();
  }
}
