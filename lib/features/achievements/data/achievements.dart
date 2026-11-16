import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/generated/l10n.dart';

class Achievement {
  final String id;
  final String emoji;
  final bool unlocked;
  final int progress;
  final int target;

  const Achievement({
    required this.id,
    required this.emoji,
    this.unlocked = false,
    this.progress = 0,
    this.target = 1,
  });

  /// Localized title via S.of(context). Call only with a loaded S instance.
  String title(S s) {
    switch (id) {
      case 'first_checkin':
        return s.achievementFirstCheckinTitle;
      case 'streak_3':
        return s.achievementStreak3Title;
      case 'streak_7':
        return s.achievementStreak7Title;
      case 'streak_14':
        return s.achievementStreak14Title;
      case 'streak_30':
        return s.achievementStreak30Title;
      case 'total_10':
        return s.achievementTotal10Title;
      case 'total_30':
        return s.achievementTotal30Title;
      case 'total_100':
        return s.achievementTotal100Title;
      case 'note_writer':
        return s.achievementNoteWriterTitle;
      case 'self_care_friend':
        return s.achievementSelfCareFriendTitle;
      default:
        return id;
    }
  }

  /// Localized description via S.of(context).
  String desc(S s) {
    switch (id) {
      case 'first_checkin':
        return s.achievementFirstCheckinDesc;
      case 'streak_3':
        return s.achievementStreak3Desc;
      case 'streak_7':
        return s.achievementStreak7Desc;
      case 'streak_14':
        return s.achievementStreak14Desc;
      case 'streak_30':
        return s.achievementStreak30Desc;
      case 'total_10':
        return s.achievementTotal10Desc;
      case 'total_30':
        return s.achievementTotal30Desc;
      case 'total_100':
        return s.achievementTotal100Desc;
      case 'note_writer':
        return s.achievementNoteWriterDesc;
      case 'self_care_friend':
        return s.achievementSelfCareFriendDesc;
      default:
        return '';
    }
  }

  Achievement copyWith({bool? unlocked, int? progress}) {
    return Achievement(
      id: id,
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
      emoji: '🌱',
      target: 1,
    ),
    Achievement(
      id: 'streak_3',
      emoji: '🔥',
      target: 3,
    ),
    Achievement(
      id: 'streak_7',
      emoji: '✨',
      target: 7,
    ),
    Achievement(
      id: 'streak_14',
      emoji: '🌙',
      target: 14,
    ),
    Achievement(
      id: 'streak_30',
      emoji: '🏆',
      target: 30,
    ),
    Achievement(
      id: 'total_10',
      emoji: '📖',
      target: 10,
    ),
    Achievement(
      id: 'total_30',
      emoji: '💚',
      target: 30,
    ),
    Achievement(
      id: 'total_100',
      emoji: '🌟',
      target: 100,
    ),
    Achievement(
      id: 'note_writer',
      emoji: '✍️',
      target: 5,
    ),
    Achievement(
      id: 'self_care_friend',
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
