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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: context.appInk),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          S.of(context).checkInTitle,
          style: TextStyle(color: context.appInk, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            S.of(context).howAreYouFeelingToday,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            S.of(context).chooseClosest,
            style: TextStyle(
              fontSize: 15,
              color: context.appInk.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 28),
          ...CheckInStatus.values.map(
            (s) => _StatusOption(
              status: s,
              selected: _status == s,
              onTap: () => setState(() => _status = s),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).noteOptional,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: context.appInk,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _noteController,
            maxLength: 500,
            maxLines: 4,
            style: TextStyle(fontSize: 16, color: context.appInk),
            decoration: InputDecoration(
              hintText: S.of(context).noteHint,
              hintStyle: TextStyle(color: context.appInk.withOpacity(0.4)),
              filled: true,
              fillColor: context.appSurf,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: context.appBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: context.appBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: context.appBrand, width: 1.5),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appBrand,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 0,
                disabledBackgroundColor: context.appBrand.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _status == null || _saving ? null : _save,
              child: _saving
                  ? SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.appSurf,
                      ),
                    )
                  : Text(
                      S.of(context).save,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
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
  final bool selected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: selected ? context.appBrand.withOpacity(0.12) : context.appSurf,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? context.appBrand : context.appBorder,
                width: selected ? 1.8 : 1,
              ),
            ),
            child: Row(
              children: [
                Text(status.emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    status.label,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      color: context.appInk,
                    ),
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check_circle_rounded,
                    color: context.appBrand,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
