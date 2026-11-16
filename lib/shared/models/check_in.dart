import 'package:flutter/material.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/generated/l10n.dart';
import 'dart:convert';

/// Check-in status per PRD: OK | SHARE | SELF_CARE
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

  /// Localized label via [S.current]. Falls back to English if S is not loaded.
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
          return 'Okay';
        case CheckInStatus.share:
          return 'Want to share';
        case CheckInStatus.selfCare:
          return 'Need self-care';
      }
    }
  }

  /// Design-aligned longer title for option cards (localized).
  String get titleLocalized {
    try {
      final s = S.current;
      switch (this) {
        case CheckInStatus.ok:
          return s.statusOkTitle;
        case CheckInStatus.share:
          return s.statusShareTitle;
        case CheckInStatus.selfCare:
          return s.statusSelfCareTitle;
      }
    } catch (_) {
      return label;
    }
  }

  String get subtitleLocalized {
    try {
      final s = S.current;
      switch (this) {
        case CheckInStatus.ok:
          return s.statusOkSubtitle;
        case CheckInStatus.share:
          return s.statusShareSubtitle;
        case CheckInStatus.selfCare:
          return s.statusSelfCareSubtitle;
      }
    } catch (_) {
      return '';
    }
  }

  @Deprecated('Use titleLocalized')
  String get titleVi => titleLocalized;

  @Deprecated('Use subtitleLocalized')
  String get subtitleVi => subtitleLocalized;

  @Deprecated('Use label')
  String get labelVi => label;

  String get emoji {
    switch (this) {
      case CheckInStatus.ok:
        return '☀️';
      case CheckInStatus.share:
        return '☁️';
      case CheckInStatus.selfCare:
        return '🌱';
    }
  }

  IconData get iconData {
    switch (this) {
      case CheckInStatus.ok:
        return Icons.wb_sunny_rounded;
      case CheckInStatus.share:
        return Icons.cloud_rounded;
      case CheckInStatus.selfCare:
        return Icons.eco_rounded;
    }
  }

  Color get accentColor {
    switch (this) {
      case CheckInStatus.ok:
        return AppColors.moodOk;
      case CheckInStatus.share:
        return AppColors.moodShare;
      case CheckInStatus.selfCare:
        return AppColors.moodSelfCare;
    }
  }
}

class CheckIn {
  final String id;
  final String localDate; // yyyy-MM-dd
  final CheckInStatus status;
  final String? note;
  /// Optional activity tags (work, family, rest, ...) for richer context.
  final List<String> activities;
  final String timezoneId;
  final int createdAtUtc;
  final int updatedAtUtc;

  const CheckIn({
    required this.id,
    required this.localDate,
    required this.status,
    this.note,
    this.activities = const [],
    required this.timezoneId,
    required this.createdAtUtc,
    required this.updatedAtUtc,
  });

  CheckIn copyWith({
    String? id,
    String? localDate,
    CheckInStatus? status,
    String? note,
    List<String>? activities,
    String? timezoneId,
    int? createdAtUtc,
    int? updatedAtUtc,
  }) {
    return CheckIn(
      id: id ?? this.id,
      localDate: localDate ?? this.localDate,
      status: status ?? this.status,
      note: note ?? this.note,
      activities: activities ?? this.activities,
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
      'activities': activities,
      'timezoneId': timezoneId,
      'createdAtUtc': createdAtUtc,
      'updatedAtUtc': updatedAtUtc,
    };
  }

  factory CheckIn.fromMap(Map<String, dynamic> map) {
    final rawActs = map['activities'];
    final acts = <String>[];
    if (rawActs is List) {
      for (final e in rawActs) {
        if (e != null) acts.add(e.toString());
      }
    }
    return CheckIn(
      id: map['id'] as String,
      localDate: map['localDate'] as String,
      status: CheckInStatus.fromString(map['status'] as String),
      note: map['note'] as String?,
      activities: acts,
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
      'CheckIn(id: $id, localDate: $localDate, status: ${status.value}, activities: $activities)';
}
