import 'package:still_here/generated/l10n.dart';
import 'package:still_here/shared/models/check_in.dart';

/// Gentle reflection prompts — localized via [S].
class JournalPrompts {
  JournalPrompts._();

  static List<String> _general(S s) => [
        s.promptGeneral1,
        s.promptGeneral2,
        s.promptGeneral3,
        s.promptGeneral4,
        s.promptGeneral5,
      ];

  static List<String> _ok(S s) => [
        s.promptOk1,
        s.promptOk2,
        s.promptOk3,
      ];

  static List<String> _share(S s) => [
        s.promptShare1,
        s.promptShare2,
        s.promptShare3,
      ];

  static List<String> _selfCare(S s) => [
        s.promptSelfCare1,
        s.promptSelfCare2,
        s.promptSelfCare3,
      ];

  static String forStatus(CheckInStatus? status, {int seed = 0, S? s}) {
    final loc = s ?? S.current;
    final list = switch (status) {
      CheckInStatus.ok => _ok(loc),
      CheckInStatus.share => _share(loc),
      CheckInStatus.selfCare => _selfCare(loc),
      null => _general(loc),
    };
    final pool = [...list, ..._general(loc)];
    return pool[seed.abs() % pool.length];
  }

  static String daily({int? dayOfYear, S? s}) {
    final loc = s ?? S.current;
    final general = _general(loc);
    final d = dayOfYear ??
        DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
    return general[d.abs() % general.length];
  }
}
