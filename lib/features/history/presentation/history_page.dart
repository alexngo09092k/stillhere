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

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = now.year;
    _month = now.month;
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
      _items = list;
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
    });
    _load();
  }

  Future<void> _openEdit(CheckIn item) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => CheckInPage(existing: item)));
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

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final locale = _localeTag(context);
    final monthLabel = DateFormat(
      'MMMM yyyy',
      locale,
    ).format(DateTime(_year, _month));

    return Scaffold(
      backgroundColor: context.appBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _shiftMonth(-1),
                    icon: Icon(Icons.chevron_left),
                  ),
                  Expanded(
                    child: Text(
                      monthLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: context.appInk,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _shiftMonth(1),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: _SummaryItem(
                      label: s.labelDays,
                      value: '${_summary['total'] ?? 0}',
                    ),
                  ),
                  Expanded(
                    child: _SummaryItem(
                      label: s.labelOk,
                      value: '${_summary['OK'] ?? 0}',
                    ),
                  ),
                  Expanded(
                    child: _SummaryItem(
                      label: s.labelShare,
                      value: '${_summary['SHARE'] ?? 0}',
                    ),
                  ),
                  Expanded(
                    child: _SummaryItem(
                      label: s.labelSelfCare,
                      value: '${_summary['SELF_CARE'] ?? 0}',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(color: context.appBrand),
                    )
                  : _items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          s.historyEmpty,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: context.appInk.withOpacity(0.55),
                          ),
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _load,
                      color: context.appBrand,
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, i) {
                          final c = _items[i];
                          final date = DateTime.tryParse(c.localDate);
                          final dateLabel = date != null
                              ? DateFormat('EEE, d MMM', locale).format(date)
                              : c.localDate;
                          return Material(
                            color: context.appSurf,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () => _openEdit(c),
                              onLongPress: () => _confirmDelete(c),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: context.appBorder),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      c.status.emoji,
                                      style: const TextStyle(fontSize: 26),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dateLabel,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: context.appInk,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            c.status.label,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: context.appInk.withOpacity(
                                                0.6,
                                              ),
                                            ),
                                          ),
                                          if (c.note != null &&
                                              c.note!.trim().isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 4,
                                              ),
                                              child: Text(
                                                c.note!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: const Color(
                                                    0xFF263238,
                                                  ).withOpacity(0.75),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuButton<String>(
                                      onSelected: (v) {
                                        if (v == 'edit') _openEdit(c);
                                        if (v == 'delete') {
                                          _confirmDelete(c);
                                        }
                                      },
                                      itemBuilder: (_) => [
                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Text(s.edit),
                                        ),
                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Text(s.delete),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: context.appInk,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: context.appInk.withOpacity(0.55),
          ),
        ),
      ],
    );
  }
}
