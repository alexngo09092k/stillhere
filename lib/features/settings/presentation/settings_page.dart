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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).dataDeleted)));
      _load();
    }
  }

  String _formatTime(int h, int m) {
    final hh = h.toString().padLeft(2, '0');
    final mm = m.toString().padLeft(2, '0');
    return '$hh:$mm';
  }

  String _langLabel(String? code) {
    switch (code) {
      case 'vi':
        return 'Tiếng Việt';
      case 'zh':
        return '中文';
      case 'th':
        return 'ไทย';
      case 'en':
      default:
        return 'English';
    }
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
    final lang = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          children: [
            Text(
              S.of(context).settingsTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: context.appInk,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              S.of(context).settingsSubtitle,
              style: TextStyle(fontSize: 13, color: context.appMuted),
            ),
            const SizedBox(height: 20),

            // App card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.appSurf,
                borderRadius: BorderRadius.circular(22),
                boxShadow: context.appCardShadow,
                border: Border.all(color: context.appBorder.withOpacity(0.6)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: context.appCtaGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.spa_rounded,
                        color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'StillHere',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: context.appInk,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Version 1.0.0',
                          style: TextStyle(
                            fontSize: 13,
                            color: context.appMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            _SettingsGroup(
              children: [
                _SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  title: S.of(context).dailyReminder,
                  trailing: Switch(
                    value: reminderOn,
                    onChanged: _onReminderToggle,
                  ),
                ),
                if (reminderOn)
                  _SettingsTile(
                    icon: Icons.schedule_rounded,
                    title: S.of(context).reminderTime,
                    subtitle: _formatTime(hour, minute),
                    onTap: _pickTime,
                  ),
                _SettingsTile(
                  icon: Icons.language_rounded,
                  title: S.of(context).language,
                  subtitle: _langLabel(
                    (_settings['language'] as String?) ?? 'en',
                  ),
                  showChevron: true,
                  onTap: () => _showLanguagePicker(),
                ),
                _SettingsTile(
                  icon: Icons.auto_awesome_rounded,
                  title: S.of(context).allowAiGreeting,
                  trailing: Switch(
                    value: aiOn,
                    onChanged: (v) => _update('ai.enabled', v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            _SettingsGroup(
              children: [
                _SettingsTile(
                  icon: Icons.workspace_premium_outlined,
                  title: S.of(context).removeAdsPremium,
                  subtitle: PremiumService.instance.isPremium
                      ? S.of(context).premiumActive
                      : S.of(context).upgradeToRemoveAds,
                  showChevron: true,
                  onTap: () {
                    AdRevenueManager.instance.onNavigation(placement: 'premium');
                    Navigator.of(context).pushNamed(AppRoutes.premiumPage).then(
                      (_) {
                        if (mounted) setState(() {});
                      },
                    );
                  },
                ),
                _SettingsTile(
                  icon: Icons.lock_outline_rounded,
                  title: S.of(context).privacy,
                  subtitle: S.of(context).dataStaysOnDevice,
                  showChevron: true,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutPage()),
                    );
                  },
                ),
                _SettingsTile(
                  icon: Icons.ios_share_rounded,
                  title: S.of(context).exportData,
                  subtitle: S.of(context).exportDataSubtitle,
                  showChevron: true,
                  onTap: () async {
                    try {
                      await DataExportService.instance.shareExport();
                    } catch (_) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).saveFailed)),
                      );
                    }
                  },
                ),
                _SettingsTile(
                  icon: Icons.info_outline_rounded,
                  title: S.of(context).aboutTitle,
                  showChevron: true,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutPage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),

            _SettingsGroup(
              children: [
                _SettingsTile(
                  icon: Icons.brightness_6_outlined,
                  title: S.of(context).theme,
                  subtitle: _themeLabel(),
                  showChevron: true,
                  onTap: _showThemePicker,
                ),
                _SettingsTile(
                  icon: Icons.delete_outline_rounded,
                  title: S.of(context).deleteAllData,
                  titleColor: const Color(0xFFC45C4A),
                  iconColor: const Color(0xFFC45C4A),
                  onTap: _confirmDeleteAll,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Center(
              child: Text(
                S.of(context).youreEnough,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: context.appMuted.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _themeLabel() {
    ThemeMode current = ThemeMode.light;
    try {
      current = ManagerProvider.of<IThemeProvider>().themeMode;
    } catch (_) {}
    final s = S.of(context);
    switch (current) {
      case ThemeMode.system:
        return s.themeSystem;
      case ThemeMode.dark:
        return s.themeDark;
      case ThemeMode.light:
        return s.themeLight;
    }
  }

  Future<void> _showLanguagePicker() async {
    final current = (_settings['language'] as String?) ?? 'vi';
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: context.appSurf,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final options = [
          {'code': 'en', 'label': 'English'},
          {'code': 'vi', 'label': 'Tiếng Việt'},
          {'code': 'th', 'label': 'ไทย'},
          {'code': 'zh', 'label': '中文'},
        ];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.appBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              ...options.map((e) {
                final selected = e['code'] == current;
                return ListTile(
                  title: Text(
                    e['label']!,
                    style: TextStyle(
                      fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w500,
                      color: context.appInk,
                    ),
                  ),
                  trailing: selected
                      ? Icon(Icons.check_rounded, color: context.appBrand)
                      : null,
                  onTap: () => Navigator.pop(ctx, e['code']),
                );
              }),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (picked != null) {
      await _update('language', picked);
      try {
        ManagerProvider.of<IThemeProvider>().changeLocale(Locale(picked));
      } catch (_) {}
      if (mounted) setState(() {});
    }
  }

  Future<void> _showThemePicker() async {
    ThemeMode current = ThemeMode.light;
    try {
      current = ManagerProvider.of<IThemeProvider>().themeMode;
    } catch (_) {}
    final s = S.of(context);
    final picked = await showModalBottomSheet<ThemeMode>(
      context: context,
      backgroundColor: context.appSurf,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final options = [
          (ThemeMode.system, s.themeSystem, Icons.brightness_auto),
          (ThemeMode.light, s.themeLight, Icons.light_mode_outlined),
          (ThemeMode.dark, s.themeDark, Icons.dark_mode_outlined),
        ];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.appBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              ...options.map((e) {
                final selected = e.$1 == current;
                return ListTile(
                  leading: Icon(e.$3, color: context.appBrand),
                  title: Text(
                    e.$2,
                    style: TextStyle(
                      fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  trailing: selected
                      ? Icon(Icons.check_rounded, color: context.appBrand)
                      : null,
                  onTap: () => Navigator.pop(ctx, e.$1),
                );
              }),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (picked != null) {
      await _update('theme', picked.name);
      try {
        ManagerProvider.of<IThemeProvider>().changeThemeMode(picked);
      } catch (_) {}
      if (mounted) setState(() {});
    }
  }
}

class _SettingsGroup extends StatelessWidget {
  final List<Widget> children;
  const _SettingsGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appSurf,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.appBorder.withOpacity(0.6)),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1)
              Divider(
                height: 1,
                indent: 56,
                color: context.appBorder.withOpacity(0.7),
              ),
          ],
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.showChevron = false,
    this.onTap,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: (iconColor ?? context.appBrand).withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 20, color: iconColor ?? context.appBrandDeep),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: titleColor ?? context.appInk,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: TextStyle(fontSize: 12, color: context.appMuted),
            ),
      trailing: trailing ??
          (showChevron
              ? Icon(Icons.chevron_right_rounded, color: context.appMuted)
              : null),
    );
  }
}
