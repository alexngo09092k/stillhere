import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:fluttering/fluttering.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/core/notifications/reminder_helper.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/common/app_routes.dart';
import 'package:still_here/utils/ad_revenue_manager.dart';
import 'package:still_here/core/premium/premium_service.dart';
import 'package:still_here/core/export/data_export_service.dart';
import 'package:still_here/features/about/presentation/about_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, dynamic> _settings = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final s = await LocalStorage.instance.getSettings();
    if (!mounted) return;
    setState(() {
      _settings = s;
      _loading = false;
    });
  }

  Future<void> _update(String key, dynamic value) async {
    await LocalStorage.instance.updateSetting(key, value);
    setState(() => _settings[key] = value);
  }

  Future<void> _onReminderToggle(bool value) async {
    final hour = (_settings['reminder.hour'] as int?) ?? 9;
    final minute = (_settings['reminder.minute'] as int?) ?? 0;

    if (value) {
      final ok = await ReminderHelper.instance.enable(
        hour: hour,
        minute: minute,
      );
      if (!mounted) return;
      if (!ok) {
        // Permission denied – giữ OFF và hướng dẫn
        setState(() => _settings['reminder.enabled'] = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).needNotificationPermission),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      setState(() => _settings['reminder.enabled'] = true);
    } else {
      await ReminderHelper.instance.disable();
      setState(() => _settings['reminder.enabled'] = false);
    }
  }

  Future<void> _pickTime() async {
    final hour = (_settings['reminder.hour'] as int?) ?? 9;
    final minute = (_settings['reminder.minute'] as int?) ?? 0;
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hour, minute: minute),
    );
    if (picked != null) {
      await ReminderHelper.instance.updateTime(
        hour: picked.hour,
        minute: picked.minute,
      );
      setState(() {
        _settings['reminder.hour'] = picked.hour;
        _settings['reminder.minute'] = picked.minute;
      });
    }
  }

  Future<void> _confirmDeleteAll() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).deleteAllData),
        content: Text(S.of(context).deleteAllDataConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
    if (ok == true) {
      await CheckInService.instance.deleteAll();
      await LocalStorage.instance.clearAll();
      await LocalStorage.instance.setOnboardingDone(true);
      await ReminderHelper.instance.disable();
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).dataDeleted)));
      _load();
    }
  }

  String _formatTime(int h, int m) {
    final hh = h.toString().padLeft(2, '0');
    final mm = m.toString().padLeft(2, '0');
    return '$hh:$mm';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        backgroundColor: context.appBg,
        body: Center(child: CircularProgressIndicator(color: context.appBrand)),
      );
    }

    final reminderOn = _settings['reminder.enabled'] == true;
    final aiOn = _settings['ai.enabled'] != false;
    final hour = (_settings['reminder.hour'] as int?) ?? 9;
    final minute = (_settings['reminder.minute'] as int?) ?? 0;

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          children: [
            Text(
              S.of(context).settingsTitle,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: context.appInk,
              ),
            ),
            const SizedBox(height: 24),

            _Section(
              title: S.of(context).sectionReminder,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(S.of(context).enableCheckInReminder),
                  subtitle: Text(
                    reminderOn
                        ? S.of(context).reminderAt(_formatTime(hour, minute))
                        : S.of(context).reminderOff,
                  ),
                  value: reminderOn,
                  activeColor: context.appBrand,
                  onChanged: _onReminderToggle,
                ),
                if (reminderOn)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(S.of(context).reminderTime),
                    trailing: Text(
                      _formatTime(hour, minute),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.appBrand,
                      ),
                    ),
                    onTap: _pickTime,
                  ),
              ],
            ),

            _Section(
              title: S.of(context).theme,
              children: [
                ...[
                  {
                    'mode': ThemeMode.system,
                    'label': S.of(context).themeSystem,
                    'icon': Icons.brightness_auto,
                  },
                  {
                    'mode': ThemeMode.light,
                    'label': S.of(context).themeLight,
                    'icon': Icons.light_mode_outlined,
                  },
                  {
                    'mode': ThemeMode.dark,
                    'label': S.of(context).themeDark,
                    'icon': Icons.dark_mode_outlined,
                  },
                ].map((entry) {
                  final mode = entry['mode'] as ThemeMode;
                  final label = entry['label'] as String;
                  final icon = entry['icon'] as IconData;
                  ThemeMode current = ThemeMode.light;
                  try {
                    current = ManagerProvider.of<IThemeProvider>().themeMode;
                  } catch (_) {}
                  return RadioListTile<ThemeMode>(
                    contentPadding: EdgeInsets.zero,
                    secondary: Icon(icon, color: context.appBrand),
                    title: Text(label),
                    value: mode,
                    groupValue: current,
                    activeColor: context.appBrand,
                    onChanged: (v) async {
                      if (v == null) return;
                      await _update('theme', v.name);
                      try {
                        ManagerProvider.of<IThemeProvider>().changeThemeMode(v);
                      } catch (_) {}
                      if (mounted) setState(() {});
                    },
                  );
                }),
              ],
            ),

            _Section(
              title: S.of(context).sectionGreeting,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(S.of(context).useAiGreeting),
                  subtitle: Text(S.of(context).useAiGreetingSubtitle),
                  value: aiOn,
                  activeColor: context.appBrand,
                  onChanged: (v) => _update('ai.enabled', v),
                ),
              ],
            ),

            _Section(
              title: S.of(context).language,
              children: [
                ...[
                  {'code': 'vi', 'label': 'Tiếng Việt'},
                  {'code': 'en', 'label': 'English'},
                  {'code': 'th', 'label': 'ไทย'},
                  {'code': 'zh', 'label': '中文'},
                ].map((entry) {
                  final code = entry['code']!;
                  final label = entry['label']!;
                  return RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(label),
                    value: code,
                    groupValue: (_settings['language'] as String?) ?? 'vi',
                    activeColor: context.appBrand,
                    onChanged: (v) async {
                      if (v == null) return;
                      await _update('language', v);
                      try {
                        ManagerProvider.of<IThemeProvider>().changeLocale(
                          Locale(v),
                        );
                      } catch (_) {}
                      if (mounted) setState(() {});
                    },
                  );
                }),
              ],
            ),

            _Section(
              title: S.of(context).sectionPremium,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.workspace_premium,
                    color: context.appBrand,
                  ),
                  title: Text(S.of(context).removeAdsPremium),
                  subtitle: Text(
                    PremiumService.instance.isPremium
                        ? S.of(context).premiumActive
                        : S.of(context).upgradeToRemoveAds,
                    style: TextStyle(
                      fontSize: 13,
                      color: PremiumService.instance.isPremium
                          ? context.appBrand
                          : context.appMuted,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    AdRevenueManager.instance.onNavigation(
                      placement: 'premium',
                    );
                    Navigator.of(context).pushNamed(AppRoutes.premiumPage).then(
                      (_) {
                        if (mounted) setState(() {});
                      },
                    );
                  },
                ),
              ],
            ),

            _Section(
              title: S.of(context).sectionAbout,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.info_outline, color: context.appMuted),
                  title: Text(S.of(context).aboutTitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutPage()),
                    );
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.ios_share, color: context.appMuted),
                  title: Text(S.of(context).exportData),
                  subtitle: Text(S.of(context).exportDataSubtitle),
                  onTap: () async {
                    try {
                      await DataExportService.instance.shareExport();
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).exportFailed)),
                      );
                    }
                  },
                ),
              ],
            ),

            _Section(
              title: S.of(context).sectionData,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.delete_outline, color: Colors.redAccent),
                  title: Text(S.of(context).deleteAllData),
                  onTap: _confirmDeleteAll,
                ),
              ],
            ),

            const SizedBox(height: 24),
            Center(
              child: Text(
                S.of(context).dataStaysOnDevice,
                style: TextStyle(
                  fontSize: 13,
                  color: context.appInk.withOpacity(0.45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: context.appInk.withOpacity(0.5),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: context.appSurf,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: context.appBorder),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
