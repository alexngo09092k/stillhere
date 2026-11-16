import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/core/database/local_storage.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_page.dart';
import 'package:still_here/features/greeting/data/greeting_service.dart';
import 'package:still_here/features/history/presentation/history_page.dart';
import 'package:still_here/features/care/presentation/care_page.dart';
import 'package:still_here/features/settings/presentation/settings_page.dart';
import 'package:still_here/features/stats/presentation/stats_page.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/shared/models/greeting.dart';
import 'package:still_here/widgets/base/ad_view.dart';
import 'package:still_here/common/configuration.dart';
import 'package:still_here/features/home/data/weekly_insight.dart';
import 'package:still_here/widgets/still/still_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Greeting? _greeting;
  CheckIn? _todayCheckIn;
  bool _loading = true;
  int _streak = 0;
  int _totalDays = 0;
  WeeklyInsight? _weeklyInsight;
  int _navIndex = 0;
  final GlobalKey<HistoryPageState> _historyKey = GlobalKey<HistoryPageState>();
  final GlobalKey<StatsPageState> _statsKey = GlobalKey<StatsPageState>();
  final GlobalKey<CarePageState> _careKey = GlobalKey<CarePageState>();

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
    if (state == AppLifecycleState.resumed) _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final fallbackLang =
        Localizations.maybeLocaleOf(context)?.languageCode ?? 'en';
    final settings = await LocalStorage.instance.getSettings();
    final aiEnabled = settings['ai.enabled'] != false;
    final lang = (settings['language'] as String?) ?? fallbackLang;
    final results = await Future.wait([
      GreetingService.instance.getTodayGreeting(
        language: lang,
        aiEnabled: aiEnabled,
      ),
      CheckInService.instance.getToday(),
      CheckInService.instance.getCurrentStreak(),
      CheckInService.instance.getTotalDays(),
    ]);
    if (!mounted) return;
    final insight = await WeeklyInsight.compute();
    if (!mounted) return;
    setState(() {
      _greeting = results[0] as Greeting;
      _todayCheckIn = results[1] as CheckIn?;
      _streak = results[2] as int;
      _totalDays = results[3] as int;
      _weeklyInsight = insight;
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
        .then((_) {
      _load();
      _historyKey.currentState?.reload();
      _statsKey.currentState?.reload();
      _careKey.currentState?.reload();
    });
  }

  String _navJournalLabel(BuildContext context) => S.of(context).navJournal;

  String _navStatsLabel(BuildContext context) => S.of(context).navStats;

  String _navCareLabel(BuildContext context) => S.of(context).navCare;

  void _openSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SettingsPage()))
        .then((_) {
      _load();
      _careKey.currentState?.reload();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _navIndex,
          children: [
            _buildHomeTab(),
            CarePage(key: _careKey),
            HistoryPage(key: _historyKey),
            StatsPage(key: _statsKey),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNav(
        index: _navIndex,
        onChanged: (i) {
          setState(() => _navIndex = i);
          if (i == 0) _load();
          if (i == 1) _careKey.currentState?.reload();
          if (i == 2) _historyKey.currentState?.reload();
          if (i == 3) _statsKey.currentState?.reload();
        },
        labels: [
          S.of(context).navHome,
          _navCareLabel(context),
          _navJournalLabel(context),
          _navStatsLabel(context),
        ],
      ),
    );
  }


  /// Hero visual by local hour: morning / noon / afternoon / evening.
  String _heroAssetForNow() {
    final hour = DateTime.now().hour;
    final a = AppAssets.instance;
    if (hour >= 5 && hour < 11) return a.heroMorning;
    if (hour >= 11 && hour < 14) return a.heroNoon;
    if (hour >= 14 && hour < 18) return a.heroAfternoon;
    return a.heroEvening;
  }

  String _homeHeadline(BuildContext context) {
    final s = S.of(context);
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) return s.headlineMorning;
    if (hour >= 11 && hour < 14) return s.headlineNoon;
    if (hour >= 14 && hour < 18) return s.headlineAfternoon;
    return s.headlineEvening;
  }

  String _homeGreeting(BuildContext context) {
    final s = S.of(context);
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return s.helloMorning;
    if (hour >= 12 && hour < 18) return s.helloAfternoon;
    return s.helloEvening;
  }

  Widget _buildHomeTab() {
    return RefreshIndicator(
      onRefresh: _load,
      color: context.appBrand,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          // Top bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.instance.logoMark,
                  width: 34,
                  height: 34,
                  errorBuilder: (_, __, ___) => Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      gradient: context.appCtaGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.spa_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  Configuration.instance.business.appName.isNotEmpty
                      ? Configuration.instance.business.appName
                      : 'Still Here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: context.appInk,
                    letterSpacing: -0.3,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _openSettings,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: context.appSurf,
                      shape: BoxShape.circle,
                      border: Border.all(color: context.appBorder),
                    ),
                    child: Icon(Icons.person_outline_rounded,
                        size: 20, color: context.appMuted),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Streak + presence summary (content richness for AppGallery 4.1)
          if (!_loading && (_streak > 0 || _totalDays > 0))
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  if (_streak > 0)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: context.appSurf,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: context.appBorder),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.local_fire_department_rounded,
                                color: context.appBrand, size: 22),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                S.of(context).streakDays(_streak),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: context.appInk,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_streak > 0 && _totalDays > 0) const SizedBox(width: 10),
                  if (_totalDays > 0)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: context.appSurf,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: context.appBorder),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_rounded,
                                color: context.appMuted, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                S.of(context).daysPresent(_totalDays),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: context.appInk,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),


          // Weekly insight (local, personalized — AppGallery 4.1)
          if (!_loading && _weeklyInsight != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                decoration: BoxDecoration(
                  color: context.appSurf,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: context.appBorder),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: context.appBrand.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.insights_rounded,
                          size: 20, color: context.appBrandDeep),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Localizations.localeOf(context).languageCode == 'vi'
                                ? 'Góc nhìn tuần này'
                                : Localizations.localeOf(context).languageCode == 'th'
                                    ? 'มุมมองสัปดาห์นี้'
                                    : Localizations.localeOf(context).languageCode == 'zh'
                                        ? '本周小结'
                                        : 'This week at a glance',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: context.appBrandDeep,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _weeklyInsight!.message(
                              Localizations.localeOf(context).languageCode,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: context.appInk,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Hero card with image — matches design mockup
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              children: [
                // Background image
                AspectRatio(
                  aspectRatio: 0.85,
                  child: Image.asset(
                    _heroAssetForNow(),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: context.isDark
                              ? const [
                                  Color(0xFF3A2E24),
                                  Color(0xFF2A241E),
                                ]
                              : const [
                                  Color(0xFFFFE8D6),
                                  Color(0xFFF5E6D8),
                                  Color(0xFFE8F0E6),
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                // Soft gradient overlay for text readability
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.05),
                          Colors.black.withValues(alpha: 0.15),
                          Colors.black.withValues(alpha: 0.45),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                // Content
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 28, 22, 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          _homeGreeting(context),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withValues(alpha: 0.85),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _homeHeadline(context),
                          style: const TextStyle(
                            fontSize: 30,
                            height: 1.22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Glass quote card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.22),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ),
                          child: _loading
                              ? const SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white70,
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).todaysNote,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withValues(alpha: 0.75),
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _greeting?.greetingText ??
                                          S.of(context).greetingFallback,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.45,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Icon(
                                      Icons.favorite_rounded,
                                      size: 14,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          if (_todayCheckIn != null) ...[
            Text(
              S.of(context).checkInToday,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.appInk,
              ),
            ),
            const SizedBox(height: 10),
            _TodayCheckInCard(checkIn: _todayCheckIn!, onEdit: _openCheckIn),
          ] else
            _PillCta(
              label: S.of(context).checkInCta,
              onTap: _openCheckIn,
            ),
          const SizedBox(height: 20),
          const AdView(),
        ],
      ),
    );
  }
}

class _PillCta extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PillCta({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Ink(
          height: 56,
          decoration: BoxDecoration(
            gradient: context.appCtaGradient,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: context.appBrand.withValues(alpha: 0.32),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_rounded,
                  color: Colors.white, size: 20),
            ],
          ),
        ),
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
    final accent = checkIn.status.accentColor;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.appSurf,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: accent.withValues(alpha: 0.35)),
            boxShadow: context.appCardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(checkIn.status.emoji,
                      style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      checkIn.status.label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: context.appInk,
                      ),
                    ),
                    if (checkIn.note != null && checkIn.note!.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        checkIn.note!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: context.appMuted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.edit_outlined, size: 18, color: context.appMuted),
            ],
          ),
        ),
      ),
    );
  }
}


class _BottomNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final List<String> labels;

  const _BottomNav({
    required this.index,
    required this.onChanged,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final icons = const [
      (Icons.home_outlined, Icons.home_rounded),
      (Icons.spa_outlined, Icons.spa_rounded),
      (Icons.menu_book_outlined, Icons.menu_book_rounded),
      (Icons.bar_chart_outlined, Icons.bar_chart_rounded),
    ];

    return Container(
      decoration: BoxDecoration(
        color: context.appSurf.withValues(alpha: 0.96),
        border: Border(
          top: BorderSide(color: context.appBorder.withValues(alpha: 0.75)),
        ),
        boxShadow: [
          BoxShadow(
            color: context.appInk.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Row(
            children: List.generate(4, (i) {
              final selected = index == i;
              return Expanded(
                child: StillPressable(
                  onTap: () => onChanged(i),
                  scale: 0.94,
                  child: AnimatedContainer(
                    duration: AppDimensions.fast,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? context.appBrand.withValues(alpha: 0.14)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          selected ? icons[i].$2 : icons[i].$1,
                          size: 22,
                          color: selected
                              ? context.appBrandDeep
                              : context.appMuted,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          labels[i],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                selected ? FontWeight.w700 : FontWeight.w500,
                            color: selected
                                ? context.appBrandDeep
                                : context.appMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
