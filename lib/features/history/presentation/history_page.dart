import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_page.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  late int _year;
  late int _month;
  List<CheckIn> _items = [];
  Map<String, int> _summary = {};
  bool _loading = true;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = now.year;
    _month = now.month;
    _selectedDay = now;
    _load();
  }

  Future<void> reload() => _load();

  Future<void> _load() async {
    setState(() => _loading = true);
    final list = await CheckInService.instance.getByMonth(_year, _month);
    final summary = await CheckInService.instance.summaryForMonth(
      _year,
      _month,
    );
    if (!mounted) return;
    setState(() {
      _items = list..sort((a, b) => b.localDate.compareTo(a.localDate));
      _summary = summary;
      _loading = false;
    });
  }

  void _shiftMonth(int delta) {
    setState(() {
      _month += delta;
      if (_month > 12) {
        _month = 1;
        _year++;
      } else if (_month < 1) {
        _month = 12;
        _year--;
      }
      _selectedDay = null;
    });
    _load();
  }

  Future<void> _openEdit(CheckIn item) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CheckInPage(existing: item)),
    );
    if (mounted) _load();
  }

  Future<void> _confirmDelete(CheckIn item) async {
    final s = S.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.deleteCheckIn),
        content: Text(s.deleteCheckInConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(s.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(s.delete),
          ),
        ],
      ),
    );
    if (ok == true) {
      await CheckInService.instance.delete(item.localDate);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(s.checkInDeleted),
            behavior: SnackBarBehavior.floating,
          ),
        );
        _load();
      }
    }
  }

  String _localeTag(BuildContext context) {
    final code = Localizations.localeOf(context).languageCode;
    if (code == 'zh') return 'zh_CN';
    return code;
  }

  Map<int, CheckIn> get _byDay {
    final map = <int, CheckIn>{};
    for (final c in _items) {
      final d = DateTime.tryParse(c.localDate);
      if (d != null) map[d.day] = c;
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final locale = _localeTag(context);
    final lang = Localizations.localeOf(context).languageCode;
    final monthLabel = DateFormat('MMMM yyyy', locale).format(
      DateTime(_year, _month),
    );
    final byDay = _byDay;
    final daysInMonth = DateTime(_year, _month + 1, 0).day;
    // Monday-based week
    final firstWeekday = DateTime(_year, _month, 1).weekday; // 1=Mon..7=Sun

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _load,
          color: context.appBrand,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang == 'vi' ? 'Nhật ký của bạn' : s.historyTitle,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: context.appInk,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lang == 'vi'
                              ? 'Những ngày của bạn, những cảm xúc thật.'
                              : s.historyEmpty,
                          style: TextStyle(
                            fontSize: 13,
                            color: context.appMuted,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Month navigator + calendar card
              Container(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 16),
                decoration: BoxDecoration(
                  color: context.appSurf,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: context.appCardShadow,
                  border: Border.all(color: context.appBorder.withOpacity(0.6)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _shiftMonth(-1),
                          icon: Icon(Icons.chevron_left_rounded,
                              color: context.appInk),
                        ),
                        Expanded(
                          child: Text(
                            lang == 'vi'
                                ? 'Tháng $_month, $_year'
                                : monthLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: context.appInk,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _shiftMonth(1),
                          icon: Icon(Icons.chevron_right_rounded,
                              color: context.appInk),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Weekday headers
                    Row(
                      children: (lang == 'vi'
                              ? ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
                              : ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'])
                          .map(
                            (d) => Expanded(
                              child: Center(
                                child: Text(
                                  d,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.appMuted,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    if (_loading)
                      const Padding(
                        padding: EdgeInsets.all(24),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      _buildCalendarGrid(
                        context,
                        daysInMonth: daysInMonth,
                        firstWeekday: firstWeekday,
                        byDay: byDay,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              Text(
                lang == 'vi' ? 'Ghi nhận gần đây' : s.checkInToday,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: context.appInk,
                ),
              ),
              const SizedBox(height: 12),

              if (!_loading && _items.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.appSurf,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: context.appBorder),
                  ),
                  child: Text(
                    s.historyEmpty,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: context.appMuted,
                    ),
                  ),
                )
              else
                ..._items.take(8).map((c) {
                  final date = DateTime.tryParse(c.localDate);
                  final dateLabel = date != null
                      ? DateFormat('EEE, d MMM', locale).format(date)
                      : c.localDate;
                  final accent = c.status.accentColor;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () => _openEdit(c),
                        onLongPress: () => _confirmDelete(c),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: context.appSurf,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: context.appBorder.withOpacity(0.8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: accent.withOpacity(0.18),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    c.status.emoji,
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dateLabel,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: context.appMuted,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      c.status.label,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: context.appInk,
                                      ),
                                    ),
                                    if (c.note != null &&
                                        c.note!.trim().isNotEmpty) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        c.note!,
                                        maxLines: 1,
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
                              Icon(Icons.chevron_right_rounded,
                                  color: context.appMuted),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(
    BuildContext context, {
    required int daysInMonth,
    required int firstWeekday,
    required Map<int, CheckIn> byDay,
  }) {
    final cells = <Widget>[];
    // Empty leading cells (Mon=1)
    for (var i = 1; i < firstWeekday; i++) {
      cells.add(const SizedBox());
    }
    final today = DateTime.now();
    for (var day = 1; day <= daysInMonth; day++) {
      final checkIn = byDay[day];
      final isToday =
          today.year == _year && today.month == _month && today.day == day;
      final isSelected = _selectedDay != null &&
          _selectedDay!.year == _year &&
          _selectedDay!.month == _month &&
          _selectedDay!.day == day;

      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = DateTime(_year, _month, day);
            });
            if (checkIn != null) _openEdit(checkIn);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? context.appBrand.withOpacity(0.2)
                  : (isToday
                      ? context.appBrand.withOpacity(0.1)
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(12),
              border: isToday
                  ? Border.all(color: context.appBrand.withOpacity(0.5))
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$day',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight:
                        isToday || isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: context.appInk,
                  ),
                ),
                const SizedBox(height: 2),
                if (checkIn != null)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: checkIn.status.accentColor,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 1,
      children: cells,
    );
  }
}
