import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_success_page.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/shared/models/activity_tag.dart';
import 'package:still_here/features/checkin/data/journal_prompts.dart';
import 'package:still_here/widgets/still/still_widgets.dart';

class CheckInPage extends StatefulWidget {
  final CheckIn? existing;
  const CheckInPage({super.key, this.existing});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  CheckInStatus? _status;
  final _noteController = TextEditingController();
  final Set<String> _selectedActivities = {};
  bool _saving = false;

  static const int _noteMax = 500;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _status = widget.existing!.status;
      _noteController.text = widget.existing!.note ?? '';
      _selectedActivities.addAll(widget.existing!.activities);
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_status == null) return;
    final note = _noteController.text.trim();
    if (note.length > _noteMax) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noteTooLong),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() => _saving = true);
    final result = await CheckInService.instance.save(
      status: _status!,
      note: note,
      activities: _selectedActivities.toList(),
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (result != null) {
      AwesomeAnalytics.instance.sendEvent('checkin_save', {});
      HapticFeedback.mediumImpact();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => CheckInSuccessPage(checkIn: result)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).saveFailed),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  String _subtitleFor(CheckInStatus status) {
    final s = S.of(context);
    switch (status) {
      case CheckInStatus.ok:
        return s.statusOkSubtitle;
      case CheckInStatus.share:
        return s.statusShareSubtitle;
      case CheckInStatus.selfCare:
        return s.statusSelfCareSubtitle;
    }
  }

  String _titleFor(CheckInStatus status) {
    final s = S.of(context);
    switch (status) {
      case CheckInStatus.ok:
        return s.statusOkTitle;
      case CheckInStatus.share:
        return s.statusShareTitle;
      case CheckInStatus.selfCare:
        return s.statusSelfCareTitle;
    }
  }

  IconData _iconFor(CheckInStatus status) {
    switch (status) {
      case CheckInStatus.ok:
        return Icons.wb_sunny_rounded;
      case CheckInStatus.share:
        return Icons.cloud_outlined;
      case CheckInStatus.selfCare:
        return Icons.spa_rounded;
    }
  }

  Color _colorFor(CheckInStatus status) {
    switch (status) {
      case CheckInStatus.ok:
        return AppColors.moodOk;
      case CheckInStatus.share:
        return AppColors.moodShare;
      case CheckInStatus.selfCare:
        return AppColors.moodSelfCare;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final noteLen = _noteController.text.characters.length;
    final prompt = _status == null
        ? null
        : JournalPrompts.forStatus(_status!, s: S.of(context));

    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, size: 22, color: context.appInk),
          onPressed: () => Navigator.pop(context),
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
        ),
        title: Text(
          S.of(context).howAreYouFeelingToday,
          style: TextStyle(
            color: context.appInk,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              children: [
                Text(
                  S.of(context).howAreYouFeelingTitle,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: context.appInk,
                    height: 1.22,
                    letterSpacing: -0.35,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).noRightOrWrong,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: context.appMuted,
                  ),
                ),
                const SizedBox(height: 24),
                ...CheckInStatus.values.map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _StatusOption(
                      status: s,
                      title: _titleFor(s),
                      subtitle: _subtitleFor(s),
                      icon: _iconFor(s),
                      accent: _colorFor(s),
                      selected: _status == s,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        setState(() => _status = s);
                      },
                    ),
                  ),
                ),
                if (prompt != null) ...[
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: AppDimensions.normal,
                    child: Container(
                      key: ValueKey(prompt),
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: context.appBrand.withValues(alpha: 0.08),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusMd),
                        border: Border.all(
                          color: context.appBrand.withValues(alpha: 0.18),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 18,
                            color: context.appBrandDeep,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              prompt,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.45,
                                color: context.appInk.withValues(alpha: 0.9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 28),
                Text(
                  S.of(context).activityTagsPrompt,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: context.appInk,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ActivityTag.values.map((tag) {
                    final selected = _selectedActivities.contains(tag.id);
                    return StillChip(
                      label: tag.label(lang),
                      selected: selected,
                      onTap: () {
                        setState(() {
                          if (selected) {
                            _selectedActivities.remove(tag.id);
                          } else {
                            _selectedActivities.add(tag.id);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).noteOptional,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: context.appInk,
                        ),
                      ),
                    ),
                    Text(
                      '$noteLen/$_noteMax',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: noteLen > _noteMax
                            ? Theme.of(context).colorScheme.error
                            : context.appMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _noteController,
                  maxLines: 5,
                  minLines: 3,
                  maxLength: _noteMax,
                  buildCounter: (_, {required currentLength, required isFocused, maxLength}) =>
                      const SizedBox.shrink(),
                  onChanged: (_) => setState(() {}),
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: context.appInk,
                  ),
                  decoration: InputDecoration(
                    hintText: S.of(context).noteHint,
                    hintStyle: TextStyle(color: context.appMuted),
                    filled: true,
                    fillColor: context.appSurf,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusMd),
                      borderSide: BorderSide(color: context.appBorder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusMd),
                      borderSide: BorderSide(color: context.appBorder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radiusMd),
                      borderSide: BorderSide(
                        color: context.appBrand.withValues(alpha: 0.75),
                        width: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // Sticky safe CTA
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
              decoration: BoxDecoration(
                color: context.appBg,
                border: Border(
                  top: BorderSide(color: context.appBorder.withValues(alpha: 0.7)),
                ),
              ),
              child: StillButton(
                label: S.of(context).saveForMyself,
                loading: _saving,
                onPressed: _status == null ? null : _save,
                icon: Icons.favorite_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusOption extends StatelessWidget {
  final CheckInStatus status;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final bool selected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return StillPressable(
      onTap: onTap,
      scale: 0.985,
      child: AnimatedContainer(
        duration: AppDimensions.fast,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? accent.withValues(alpha: context.isDark ? 0.18 : 0.14)
              : context.appSurf,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          border: Border.all(
            color: selected ? accent.withValues(alpha: 0.7) : context.appBorder,
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.18),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: AppDimensions.fast,
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: selected ? 0.35 : 0.18),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: accent.withValues(alpha: 0.95), size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: context.appInk,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: context.appMuted,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: selected ? 1 : 0,
              duration: AppDimensions.fast,
              child: Icon(
                Icons.check_circle_rounded,
                color: accent,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
