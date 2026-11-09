import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/generated/l10n.dart';
import 'package:fluttering_analytics/analytics/index.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/checkin/presentation/checkin_success_page.dart';
import 'package:still_here/shared/models/check_in.dart';

class CheckInPage extends StatefulWidget {
  final CheckIn? existing;
  const CheckInPage({super.key, this.existing});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  CheckInStatus? _status;
  final _noteController = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _status = widget.existing!.status;
      _noteController.text = widget.existing!.note ?? '';
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

  String _subtitleFor(CheckInStatus s) {
    final code = Localizations.localeOf(context).languageCode;
    if (code == 'vi') return s.subtitleVi;
    switch (s) {
      case CheckInStatus.ok:
        return 'And that is enough.';
      case CheckInStatus.share:
        return 'Something to say to yourself.';
      case CheckInStatus.selfCare:
        return 'A little extra care today.';
    }
  }

  String _titleFor(CheckInStatus s) {
    final code = Localizations.localeOf(context).languageCode;
    if (code == 'vi') return s.titleVi;
    return s.label;
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
          lang == 'vi' ? 'Quay lại' : S.of(context).checkInTitle,
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
            lang == 'vi'
                ? 'Hôm nay,\nbạn cảm thấy thế nào?'
                : S.of(context).howAreYouFeelingToday,
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
            lang == 'vi'
                ? 'Không có câu trả lời đúng hay sai.\nHãy chọn điều gần với bạn nhất nhé.'
                : S.of(context).chooseClosest,
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
          Text(
            lang == 'vi'
                ? 'Bạn muốn viết thêm điều gì không?'
                : S.of(context).noteOptional,
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
              hintText: lang == 'vi'
                  ? 'Viết vài dòng cho chính mình...'
                  : S.of(context).noteHint,
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
                        lang == 'vi'
                            ? 'Lưu lại cho mình'
                            : S.of(context).save,
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
