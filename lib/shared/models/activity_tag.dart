import 'package:flutter/material.dart';
import 'package:still_here/generated/l10n.dart';

/// Activity tags that can be attached to a check-in for richer context.
enum ActivityTag {
  work,
  family,
  friends,
  health,
  rest,
  hobby,
  study,
  outdoor,
  food,
  other;

  String get id => name;

  static ActivityTag fromString(String v) {
    return ActivityTag.values.firstWhere(
      (e) => e.name == v.toLowerCase(),
      orElse: () => ActivityTag.other,
    );
  }

  /// Localized label via [S.current]. Falls back to English if S is not loaded.
  String label([String? lang]) {
    try {
      final s = S.current;
      switch (this) {
        case ActivityTag.work:
          return s.tagWork;
        case ActivityTag.family:
          return s.tagFamily;
        case ActivityTag.friends:
          return s.tagFriends;
        case ActivityTag.health:
          return s.tagHealth;
        case ActivityTag.rest:
          return s.tagRest;
        case ActivityTag.hobby:
          return s.tagHobby;
        case ActivityTag.study:
          return s.tagStudy;
        case ActivityTag.outdoor:
          return s.tagOutdoor;
        case ActivityTag.food:
          return s.tagFood;
        case ActivityTag.other:
          return s.tagOther;
      }
    } catch (_) {
      return _fallbackEn();
    }
  }

  String _fallbackEn() {
    switch (this) {
      case ActivityTag.work:
        return 'Work';
      case ActivityTag.family:
        return 'Family';
      case ActivityTag.friends:
        return 'Friends';
      case ActivityTag.health:
        return 'Health';
      case ActivityTag.rest:
        return 'Rest';
      case ActivityTag.hobby:
        return 'Hobby';
      case ActivityTag.study:
        return 'Study';
      case ActivityTag.outdoor:
        return 'Outdoor';
      case ActivityTag.food:
        return 'Food';
      case ActivityTag.other:
        return 'Other';
    }
  }

  @Deprecated('Use label()')
  String labelVi() => label();

  @Deprecated('Use label()')
  String labelEn() => label();

  String get emoji {
    switch (this) {
      case ActivityTag.work:
        return '💼';
      case ActivityTag.family:
        return '🏠';
      case ActivityTag.friends:
        return '🤝';
      case ActivityTag.health:
        return '💪';
      case ActivityTag.rest:
        return '😴';
      case ActivityTag.hobby:
        return '🎨';
      case ActivityTag.study:
        return '📚';
      case ActivityTag.outdoor:
        return '🌳';
      case ActivityTag.food:
        return '🍜';
      case ActivityTag.other:
        return '✨';
    }
  }

  IconData get icon {
    switch (this) {
      case ActivityTag.work:
        return Icons.work_outline_rounded;
      case ActivityTag.family:
        return Icons.home_outlined;
      case ActivityTag.friends:
        return Icons.people_outline_rounded;
      case ActivityTag.health:
        return Icons.favorite_outline_rounded;
      case ActivityTag.rest:
        return Icons.bedtime_outlined;
      case ActivityTag.hobby:
        return Icons.palette_outlined;
      case ActivityTag.study:
        return Icons.menu_book_outlined;
      case ActivityTag.outdoor:
        return Icons.park_outlined;
      case ActivityTag.food:
        return Icons.restaurant_outlined;
      case ActivityTag.other:
        return Icons.auto_awesome_outlined;
    }
  }
}
