import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_success_page.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/shared/models/activity_tag.dart';
import 'package:still_here/features/checkin/data/journal_prompts.dart';

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
    if (_noteController.text.trim().length > 500) {
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
      note: _noteController.text,
      activities: _selectedActivities.toList(),
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (result != null) {
      // Track only the action; never send the user's mood category or note.
      AwesomeAnalytics.instance.sendEvent('checkin_save', {});
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


  String _prompt(BuildContext context) {
    final seed = DateTime.now().day + (_status?.index ?? 0);
    return JournalPrompts.forStatus(_status, seed: seed, s: S.of(context));
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


  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              size: 20, color: context.appInk),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).goBack,
          style: TextStyle(
            color: context.appInk,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 36),
        children: [
          Text(
            S.of(context).howAreYouFeelingTitle,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: context.appInk,
              height: 1.25,
              letterSpacing: -0.3,
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
          const SizedBox(height: 28),
          ...CheckInStatus.values.map(
            (s) => _StatusOption(
              status: s,
              title: _titleFor(s),
              subtitle: _subtitleFor(s),
              selected: _status == s,
              onTap: () => setState(() => _status = s),
            ),
          ),
          const SizedBox(height: 28),
          // Reflection prompt — unique content per mood (AppGallery 4.1)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: context.appBrand.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.appBrand.withOpacity(0.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, size: 18, color: context.appBrand),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _prompt(context),
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: context.appInk.withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Activity tags — richer context for each check-in
          Text(
            S.of(context).activityTagsPrompt,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ActivityTag.values.map((tag) {
              final selected = _selectedActivities.contains(tag.id);
              final lang = Localizations.localeOf(context).languageCode;
              return FilterChip(
                selected: selected,
                label: Text('${tag.emoji} ${tag.label(lang)}'),
                onSelected: (v) {
                  setState(() {
                    if (v) {
                      _selectedActivities.add(tag.id);
                    } else {
                      _selectedActivities.remove(tag.id);
                    }
                  });
                },
                selectedColor: context.appBrand.withOpacity(0.18),
                checkmarkColor: context.appBrandDeep,
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? context.appBrandDeep : context.appInk,
                ),
                side: BorderSide(
                  color: selected
                      ? context.appBrand.withOpacity(0.5)
                      : context.appBorder,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: context.appSurf,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).writeMorePrompt,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _noteController,
            maxLength: 500,
            maxLines: 4,
            style: TextStyle(fontSize: 16, color: context.appInk),
            decoration: InputDecoration(
              hintText: S.of(context).noteHintPersonal,
              hintStyle: TextStyle(color: context.appMuted.withOpacity(0.7)),
              filled: true,
              fillColor: context.appSurf,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: context.appBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: context.appBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: context.appBrand, width: 1.5),
              ),
              contentPadding: const EdgeInsets.all(16),
              counterStyle: TextStyle(color: context.appMuted, fontSize: 12),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: _status == null
                    ? null
                    : context.appCtaGradient,
                color: _status == null
                    ? context.appBrand.withOpacity(0.35)
                    : null,
                borderRadius: BorderRadius.circular(18),
                boxShadow: _status == null
                    ? null
                    : [
                        BoxShadow(
                          color: context.appBrand.withOpacity(0.28),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: _status == null || _saving ? null : _save,
                child: _saving
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        S.of(context).saveForMyself,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
  final bool selected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = status.accentColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: selected
                  ? accent.withOpacity(context.isDark ? 0.18 : 0.14)
                  : context.appSurf,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? accent : context.appBorder,
                width: selected ? 1.6 : 1,
              ),
              boxShadow: selected ? context.appCardShadow : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.22),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(status.emoji, style: const TextStyle(fontSize: 24)),
                  ),
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
                          fontWeight:
                              selected ? FontWeight.w700 : FontWeight.w600,
                          color: context.appInk,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: context.appMuted,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                if (selected)
                  Icon(Icons.check_circle_rounded, color: accent, size: 24)
                else
                  Icon(Icons.chevron_right_rounded,
                      color: context.appMuted.withOpacity(0.6), size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
