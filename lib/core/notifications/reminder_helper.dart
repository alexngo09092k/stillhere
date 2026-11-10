import 'package:flutter/material.dart';
import 'package:fluttering/fluttering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Local reminder per PRD (FR-010).
/// Uses flutter_local_notifications — justified Must-have, not covered by custom libs.
class ReminderHelper {
  ReminderHelper._();
  static final ReminderHelper instance = ReminderHelper._();

  static const int _notificationId = 1001;
  static const String _channelId = 'still_here_reminder';
  static const String _channelName = 'Check-in reminder';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    try {
      tz_data.initializeTimeZones();
      try {
        final name = await _localTimezoneName();
        tz.setLocalLocation(tz.getLocation(name));
        Debug.log('[Reminder] timezone set to $name');
      } catch (e) {
        Debug.log('[Reminder] timezone fallback UTC: $e');
        tz.setLocalLocation(tz.UTC);
      }

      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const ios = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
      await _plugin.initialize(
        settings: const InitializationSettings(android: android, iOS: ios),
      );
      _initialized = true;
      Debug.log('[Reminder] initialized');
    } catch (e) {
      Debug.log('[Reminder] init error: $e');
    }
  }

  /// Resolves device IANA timezone.
  /// Uses offset mapping for primary markets (VN/TH/CN/global).
  /// Falls back to Asia/Ho_Chi_Minh then UTC.
  Future<String> _localTimezoneName() async {
    try {
      final now = DateTime.now();
      final offset = now.timeZoneOffset;
      final hours = offset.inHours;
      final minutes = offset.inMinutes.remainder(60).abs();

      if (hours == 7 && minutes == 0) {
        final name = now.timeZoneName.toUpperCase();
        if (name.contains('ICT') || name.contains('INDOCHINA')) {
          return 'Asia/Bangkok';
        }
        return 'Asia/Ho_Chi_Minh';
      }
      if (hours == 8 && minutes == 0) return 'Asia/Shanghai';
      if (hours == 9 && minutes == 0) return 'Asia/Tokyo';
      if (hours == 0 && minutes == 0) return 'UTC';
      if (hours == 1 && minutes == 0) return 'Europe/Paris';
      if (hours == -5 && minutes == 0) return 'America/New_York';
      if (hours == -8 && minutes == 0) return 'America/Los_Angeles';

      final platformName = now.timeZoneName;
      if (platformName.isNotEmpty &&
          !platformName.contains('+') &&
          !platformName.contains('-') &&
          platformName.length > 2) {
        try {
          tz.getLocation(platformName);
          return platformName;
        } catch (_) {}
      }
    } catch (_) {}

    return 'Asia/Ho_Chi_Minh';
  }

  Future<bool> isEnabled() async {
    final s = await LocalStorage.instance.getSettings();
    return s['reminder.enabled'] == true;
  }

  Future<TimeOfDay> getTime() async {
    final s = await LocalStorage.instance.getSettings();
    final h = (s['reminder.hour'] as int?) ?? 9;
    final m = (s['reminder.minute'] as int?) ?? 0;
    return TimeOfDay(hour: h, minute: m);
  }

  Future<bool> enable({required int hour, required int minute}) async {
    await init();

    final status = await Permission.notification.status;
    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      final result = await Permission.notification.request();
      if (!result.isGranted) {
        Debug.log('[Reminder] permission denied');
        await LocalStorage.instance.updateSetting('reminder.enabled', false);
        return false;
      }
    }

    await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    await LocalStorage.instance.updateSetting('reminder.enabled', true);
    await LocalStorage.instance.updateSetting('reminder.hour', hour);
    await LocalStorage.instance.updateSetting('reminder.minute', minute);

    await _schedule(hour: hour, minute: minute);
    Debug.log('[Reminder] enabled at $hour:$minute');
    return true;
  }

  Future<void> disable() async {
    await init();
    await LocalStorage.instance.updateSetting('reminder.enabled', false);
    await _plugin.cancel(id: _notificationId);
    Debug.log('[Reminder] disabled');
  }

  Future<void> updateTime({required int hour, required int minute}) async {
    await LocalStorage.instance.updateSetting('reminder.hour', hour);
    await LocalStorage.instance.updateSetting('reminder.minute', minute);
    if (await isEnabled()) {
      await _schedule(hour: hour, minute: minute);
      Debug.log('[Reminder] reschedule to $hour:$minute');
    }
  }

  Future<({String title, String body})> _localizedContent() async {
    final s = await LocalStorage.instance.getSettings();
    final lang = (s['language'] as String?)?.toLowerCase() ?? 'en';

    switch (lang) {
      case 'vi':
        return (
          title: 'Still Here',
          body: 'Một lời chào nhỏ đang chờ bạn.',
        );
      case 'th':
        return (
          title: 'Still Here',
          body: 'ทักทายเล็กๆ กำลังรอคุณอยู่',
        );
      case 'zh':
        return (
          title: 'Still Here',
          body: '一句小小的问候在等着你。',
        );
      case 'en':
      default:
        return (
          title: 'Still Here',
          body: 'A small hello is waiting for you.',
        );
    }
  }

  Future<void> _schedule({required int hour, required int minute}) async {
    await init();
    await _plugin.cancel(id: _notificationId);

    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (!scheduled.isAfter(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    final content = await _localizedContent();

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'Daily check-in reminder for Still Here',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      id: _notificationId,
      title: content.title,
      body: content.body,
      scheduledDate: scheduled,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    Debug.log(
      '[Reminder] scheduled ${content.title} at $scheduled (${tz.local.name})',
    );
  }

  /// Call on app resume / after language change to keep next notification in sync.
  Future<void> rescheduleIfEnabled() async {
    if (await isEnabled()) {
      final t = await getTime();
      await _schedule(hour: t.hour, minute: t.minute);
    }
  }
}
