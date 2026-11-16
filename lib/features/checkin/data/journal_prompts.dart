import 'package:still_here/shared/models/check_in.dart';

/// Gentle reflection prompts — enriches check-in content (AppGallery 4.1).
class JournalPrompts {
  JournalPrompts._();

  static const List<String> general = [
    'What felt a little softer today?',
    'Is there one thing you handled kindly?',
    'What do you want to leave behind for tonight?',
    'Who or what made you feel less alone?',
    'What would “enough” look like right now?',
  ];

  static const List<String> ok = [
    'What is supporting this calm?',
    'Name one small win you almost overlooked.',
    'How can you protect this energy tomorrow?',
  ];

  static const List<String> share = [
    'What would you say if a friend felt this way?',
    'Which part of today needs a little more room?',
    'What emotion is asking to be named?',
  ];

  static const List<String> selfCare = [
    'What would feel caring in the next hour?',
    'Where can you ask for less of yourself today?',
    'What boundary would help you rest?',
  ];

  static String forStatus(CheckInStatus? status, {int seed = 0}) {
    final list = switch (status) {
      CheckInStatus.ok => ok,
      CheckInStatus.share => share,
      CheckInStatus.selfCare => selfCare,
      null => general,
    };
    final pool = [...list, ...general];
    return pool[seed.abs() % pool.length];
  }

  static String daily({int? dayOfYear}) {
    final d = dayOfYear ?? DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
    return general[d.abs() % general.length];
  }
}
