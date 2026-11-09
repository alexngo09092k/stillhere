import 'package:still_here/generated/l10n.dart';
import 'dart:convert';

/// Trạng thái check-in theo PRD: OK | SHARE | SELF_CARE
enum CheckInStatus {
  ok('OK'),
  share('SHARE'),
  selfCare('SELF_CARE');

  const CheckInStatus(this.value);
  final String value;

  static CheckInStatus fromString(String v) {
    switch (v.toUpperCase()) {
      case 'OK':
        return CheckInStatus.ok;
      case 'SHARE':
        return CheckInStatus.share;
      case 'SELF_CARE':
        return CheckInStatus.selfCare;
      default:
        return CheckInStatus.ok;
    }
  }

  /// Localized label via [S.current]. Falls back to Vietnamese if S not loaded.
  String get label {
    try {
      final s = S.current;
      switch (this) {
        case CheckInStatus.ok:
          return s.statusOk;
        case CheckInStatus.share:
          return s.statusShare;
        case CheckInStatus.selfCare:
          return s.statusSelfCare;
      }
    } catch (_) {
      switch (this) {
        case CheckInStatus.ok:
          return 'Ổn';
        case CheckInStatus.share:
          return 'Muốn chia sẻ';
        case CheckInStatus.selfCare:
          return 'Cần tự chăm sóc';
      }
    }
  }

  @Deprecated('Use label')
  String get labelVi => label;

  String get emoji {
    switch (this) {
      case CheckInStatus.ok:
        return '😌';
      case CheckInStatus.share:
        return '💬';
      case CheckInStatus.selfCare:
        return '🌱';
    }
  }
}

class CheckIn {
  final String id;
  final String localDate; // yyyy-MM-dd
  final CheckInStatus status;
  final String? note;
  final String timezoneId;
  final int createdAtUtc;
  final int updatedAtUtc;

  const CheckIn({
    required this.id,
    required this.localDate,
    required this.status,
    this.note,
    required this.timezoneId,
    required this.createdAtUtc,
    required this.updatedAtUtc,
  });

  CheckIn copyWith({
    String? id,
    String? localDate,
    CheckInStatus? status,
    String? note,
    String? timezoneId,
    int? createdAtUtc,
    int? updatedAtUtc,
  }) {
    return CheckIn(
      id: id ?? this.id,
      localDate: localDate ?? this.localDate,
      status: status ?? this.status,
      note: note ?? this.note,
      timezoneId: timezoneId ?? this.timezoneId,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'localDate': localDate,
      'status': status.value,
      'note': note,
      'timezoneId': timezoneId,
      'createdAtUtc': createdAtUtc,
      'updatedAtUtc': updatedAtUtc,
    };
  }

  factory CheckIn.fromMap(Map<String, dynamic> map) {
    return CheckIn(
      id: map['id'] as String,
      localDate: map['localDate'] as String,
      status: CheckInStatus.fromString(map['status'] as String),
      note: map['note'] as String?,
      timezoneId: map['timezoneId'] as String? ?? 'Asia/Ho_Chi_Minh',
      createdAtUtc: map['createdAtUtc'] as int,
      updatedAtUtc: map['updatedAtUtc'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckIn.fromJson(String source) =>
      CheckIn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CheckIn(id: $id, localDate: $localDate, status: ${status.value})';
}
