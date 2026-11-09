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
      } catch (_) {
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

  Future<String> _localTimezoneName() async {
    // Best-effort; falls back to UTC in init()
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

    // iOS explicit permission via plugin
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

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: 'Daily check-in reminder for StillHere',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );
    const iosDetails = DarwinNotificationDetails();
    const details =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _plugin.zonedSchedule(
      id: _notificationId,
      title: 'StillHere',
      body: 'A small hello is waiting for you.',
      scheduledDate: scheduled,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
