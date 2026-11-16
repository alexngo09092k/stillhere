import 'dart:convert';

import 'package:fluttering/fluttering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';

/// Export local data as JSON (Should-have / FR-export).
class DataExportService {
  DataExportService._();
  static final DataExportService instance = DataExportService._();

  Future<String> buildJson() async {
    final checkIns = await CheckInService.instance.getAll();
    final settings = await LocalStorage.instance.getSettings();
    // Strip nothing sensitive beyond what user already owns locally
    final payload = {
      'exportedAtUtc': DateTime.now().toUtc().toIso8601String(),
      'app': 'Still Here',
      'checkIns': checkIns.map((e) => e.toMap()).toList(),
      'settings': {
        'language': settings['language'],
        'ai.enabled': settings['ai.enabled'],
        'reminder.enabled': settings['reminder.enabled'],
        'reminder.hour': settings['reminder.hour'],
        'reminder.minute': settings['reminder.minute'],
      },
    };
    return const JsonEncoder.withIndent('  ').convert(payload);
  }

  Future<void> shareExport() async {
    try {
      final json = await buildJson();
      await SharePlus.instance.share(ShareParams(text: json, subject: 'Still Here export'));
    } catch (e) {
      Debug.log('[Export] error: $e');
      rethrow;
    }
  }
}
