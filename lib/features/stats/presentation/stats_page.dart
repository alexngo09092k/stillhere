import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:intl/intl.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage> {
  int _segment = 1; // 0 week, 1 month, 2 year
  bool _loading = true;
  List<CheckIn> _items = [];
  Map<String, int> _summary = {};
  int _streak = 0;
  int _longest = 0;
  int _totalDays = 0;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    setState(() => _loading = true);
    final now = DateTime.now();
    List<CheckIn> list;
    if (_segment == 0) {
      // week
      final start = now.subtract(Duration(days: now.weekday - 1));
      final all = await CheckInService.instance.getAll();
      list = all.where((c) {
        final d = DateTime.tryParse(c.localDate);
        if (d == null) return false;
        return !d.isBefore(DateTime(start.year, start.month, start.day)) &&
            !d.isAfter(now);
      }).toList();
    } else if (_segment == 1) {
      list = await CheckInService.instance.getByMonth(now.year, now.month);
    } else {
      final all = await CheckInService.instance.getAll();
      list = all.where((c) => c.localDate.startsWith('${now.year}')).toList();
    }

    final summary = <String, int>{
      'total': list.length,
      'OK': 0,
      'SHARE': 0,
      'SELF_CARE': 0,
    };
    for (final c in list) {
      summary[c.status.value] = (summary[c.status.value] ?? 0) + 1;
    }

    final streak = await CheckInService.instance.getCurrentStreak();
    final longest = await CheckInService.instance.getLongestStreak();
    final totalDays = await CheckInService.instance.getTotalDays();

    if (!mounted) return;
    setState(() {
      _items = list;
      _summary = summary;
      _streak = streak;
      _longest = longest;
      _totalDays = totalDays;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final total = _summary['total'] ?? 0;
    final now = DateTime.now();
    final daysInPeriod = _segment == 0
        ? 7
        : (_segment == 1
            ? DateTime(now.year, now.month + 1, 0).day
            : (DateTime(now.year + 1, 1, 0)
                .difference(DateTime(now.year, 1, 1))
                .inDays +
                1));
    final progress = daysInPeriod == 0 ? 0.0 : (total / daysInPeriod).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: reload,
          color: context.appBrand,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: [
              Text(
                S.of(context).lookBackJourney,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: context.appInk,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                S.of(context).doingGreat,
                style: TextStyle(
                  fontSize: 14,
                  color: context.appMuted,
                ),
              ),
              const SizedBox(height: 18),

              // Segment control
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.appSurf,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: context.appBorder),
                ),
                child: Row(
                  children: [
                    _SegChip(
                      label: S.of(context).segmentWeek,
                      selected: _segment == 0,
                      onTap: () {
                        setState(() => _segment = 0);
                        reload();
                      },
                    ),
                    _SegChip(
                      label: S.of(context).segmentMonth,
                      selected: _segment == 1,
                      onTap: () {
                        setState(() => _segment = 1);
                        reload();
                      },
                    ),
                    _SegChip(
                      label: S.of(context).segmentYear,
                      selected: _segment == 2,
                      onTap: () {
                        setState(() => _segment = 2);
                        reload();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Streak insights
              if (!_loading)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      _StatChip(
                        icon: Icons.local_fire_department_rounded,
                        label: '$_streak day streak',
                      ),
                      const SizedBox(width: 8),
                      _StatChip(
                        icon: Icons.emoji_events_outlined,
                        label: 'Best $_longest',
                      ),
                      const SizedBox(width: 8),
                      _StatChip(
                        icon: Icons.calendar_month_rounded,
                        label: '$_totalDays total',
                      ),
                    ],
                  ),
                ),

              if (_loading)
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                )
              else ...[
                // Chart card
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                  decoration: BoxDecoration(
                    color: context.appSurf,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: context.appCardShadow,
                    border: Border.all(color: context.appBorder.withOpacity(0.6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).moodDistribution,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: context.appMuted,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 140,
                        child: _MoodBars(
                          ok: _summary['OK'] ?? 0,
                          share: _summary['SHARE'] ?? 0,
                          selfCare: _summary['SELF_CARE'] ?? 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Legend(
                            emoji: '☀️',
                            label: S.of(context).labelOk,
                            color: const Color(0xFFF0C27A),
                          ),
                          _Legend(
                            emoji: '☁️',
                            label: S.of(context).labelShare,
                            color: const Color(0xFFA8C5D4),
                          ),
                          _Legend(
                            emoji: '🌱',
                            label: S.of(context).labelSelfCare,
                            color: const Color(0xFF8BA888),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Progress + count
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: context.appSurf,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: context.appBorder.withOpacity(0.6)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '🌱',
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$total',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: context.appInk,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              S.of(context).daysCheckedInPeriod,
                              style: TextStyle(
                                fontSize: 13,
                                color: context.appMuted,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: context.appSurf,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: context.appBorder.withOpacity(0.6)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 72,
                              height: 72,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: CircularProgressIndicator(
                                      value: progress,
                                      strokeWidth: 7,
                                      backgroundColor: context.appBorder,
                                      color: context.appAccent,
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                  Text(
                                    '${(progress * 100).round()}%',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: context.appInk,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              S.of(context).presenceRate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: context.appMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: context.isDark
                          ? [
                              const Color(0xFF2E3A2C),
                              const Color(0xFF25201B),
                            ]
                          : [
                              const Color(0xFFE8F0E6),
                              const Color(0xFFF5EDE3),
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Text('💚', style: TextStyle(fontSize: 22)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          S.of(context).selfCareMessage,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: context.appInk,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SegChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SegChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? context.appBrand.withOpacity(0.18) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? context.appBrandDeep : context.appMuted,
            ),
          ),
        ),
      ),
    );
  }
}

class _MoodBars extends StatelessWidget {
  final int ok;
  final int share;
  final int selfCare;

  const _MoodBars({
    required this.ok,
    required this.share,
    required this.selfCare,
  });

  @override
  Widget build(BuildContext context) {
    final maxVal = [ok, share, selfCare, 1].reduce((a, b) => a > b ? a : b);
    final values = [ok, share, selfCare];
    final colors = [
      const Color(0xFFF0C27A),
      const Color(0xFFA8C5D4),
      const Color(0xFF8BA888),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Reserve space for value label + gap so bars never overflow the 140px box.
        const labelBlock = 22.0;
        final maxBar = (constraints.maxHeight - labelBlock).clamp(24.0, 200.0);
        final minBar = 16.0;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(3, (i) {
            final t = values[i] / maxVal;
            final h = minBar + t * (maxBar - minBar);
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${values[i]}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.appMuted,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colors[i].withOpacity(0.85),
                              colors[i].withOpacity(0.45),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _Legend extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;

  const _Legend({
    required this.emoji,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          '$emoji $label',
          style: TextStyle(fontSize: 12, color: context.appMuted),
        ),
      ],
    );
  }
}


class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: context.appSurf,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: context.appBorder),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: context.appBrand),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: context.appInk,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
