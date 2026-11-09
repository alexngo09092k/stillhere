import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering/fluttering.dart';
import 'package:still_here/common/app_routes.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_page.dart';
import 'package:still_here/features/greeting/data/greeting_service.dart';
import 'package:still_here/features/history/presentation/history_page.dart';
import 'package:still_here/features/settings/presentation/settings_page.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/shared/models/greeting.dart';
import 'package:still_here/widgets/base/ad_view.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Greeting? _greeting;
  CheckIn? _todayCheckIn;
  bool _loading = true;
  int _navIndex = 0;
  final GlobalKey<HistoryPageState> _historyKey = GlobalKey<HistoryPageState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _load();
    }
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final settings = await LocalStorage.instance.getSettings();
    final aiEnabled = settings['ai.enabled'] != false;
    final lang =
        (settings['language'] as String?) ??
        Localizations.maybeLocaleOf(context)?.languageCode ??
        'vi';
    final results = await Future.wait([
      GreetingService.instance.getTodayGreeting(
        language: lang,
        aiEnabled: aiEnabled,
      ),
      CheckInService.instance.getToday(),
    ]);
    if (!mounted) return;
    setState(() {
      _greeting = results[0] as Greeting;
      _todayCheckIn = results[1] as CheckIn?;
      _loading = false;
    });
  }

  void _openCheckIn() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) => CheckInPage(existing: _todayCheckIn),
          ),
        )
        .then((_) => _load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: IndexedStack(
          index: _navIndex,
          children: [
            _buildHomeTab(),
            HistoryPage(key: _historyKey),
            const SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navIndex,
        onDestinationSelected: (i) {
          setState(() => _navIndex = i);
        },
        backgroundColor: context.appSurf,
        indicatorColor: context.appBrand.withOpacity(0.15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: context.appBrand),
            label: S.of(context).navHome,
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(
              Icons.calendar_month_rounded,
              color: context.appBrand,
            ),
            label: S.of(context).navHistory,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded, color: context.appBrand),
            label: S.of(context).navSettings,
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    final now = DateTime.now();
    final lang = Localizations.localeOf(context).languageCode;
    final dateLocale = lang == 'zh' ? 'zh_CN' : lang;
    final dateStr = DateFormat('EEEE, d MMMM yyyy', dateLocale).format(now);

    return RefreshIndicator(
      onRefresh: _load,
      color: context.appBrand,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Still Here',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: context.appInk.withOpacity(0.55),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateStr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.appInk,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() => _navIndex = 2);
                },
                icon: Icon(Icons.settings_outlined, color: context.appMuted),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: context.appSurf,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: _loading
                ? SizedBox(
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.appBrand,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: context.appBorder,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _greeting?.timeBucket.label ??
                                  S.of(context).today,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: context.appInk,
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (_greeting?.source == 'AI')
                            Icon(
                              Icons.auto_awesome,
                              size: 16,
                              color: context.appBrand,
                            ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        _greeting?.greetingText ??
                            S.of(context).greetingFallback,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.45,
                          color: context.appInk,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 24),
          Text(
            _todayCheckIn != null
                ? S.of(context).checkInToday
                : S.of(context).howAreYouFeeling,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 12),
          if (_todayCheckIn != null) ...[
            _TodayCheckInCard(checkIn: _todayCheckIn!, onEdit: _openCheckIn),
          ] else ...[
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.appBrand,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _openCheckIn,
                child: Text(
                  S.of(context).checkInCta,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
          const SizedBox(height: 28),
          const AdView(),
        ],
      ),
    );
  }
}

class _TodayCheckInCard extends StatelessWidget {
  final CheckIn checkIn;
  final VoidCallback onEdit;

  const _TodayCheckInCard({required this.checkIn, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appSurf,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.appBorder),
          ),
          child: Row(
            children: [
              Text(checkIn.status.emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      checkIn.status.label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.appInk,
                      ),
                    ),
                    if (checkIn.note != null && checkIn.note!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        checkIn.note!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: context.appInk.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.edit_outlined, size: 20, color: context.appMuted),
            ],
          ),
        ),
      ),
    );
  }
}
