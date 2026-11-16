import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/common/constants.dart';
import 'package:still_here/features/care/data/self_care_content.dart';
import 'package:still_here/widgets/still/still_button.dart';

/// Timed, step-by-step self-care session (unique interactive content for 4.1).
class CareSessionPage extends StatefulWidget {
  final SelfCareIdea idea;
  final String lang;

  const CareSessionPage({
    super.key,
    required this.idea,
    required this.lang,
  });

  @override
  State<CareSessionPage> createState() => _CareSessionPageState();
}

class _CareSessionPageState extends State<CareSessionPage> {
  int _stepIndex = 0;
  int _remaining = 0;
  bool _running = false;
  bool _finished = false;
  Timer? _timer;

  List<CareStep> get _steps => widget.idea.steps;

  @override
  void initState() {
    super.initState();
    if (_steps.isNotEmpty) {
      _remaining = _steps.first.seconds;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _start() {
    if (_steps.isEmpty) return;
    setState(() {
      _running = true;
      _finished = false;
    });
    HapticFeedback.lightImpact();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_remaining <= 1) {
        _advance();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  void _pause() {
    _timer?.cancel();
    setState(() => _running = false);
  }

  void _advance() {
    if (_stepIndex >= _steps.length - 1) {
      _timer?.cancel();
      HapticFeedback.mediumImpact();
      setState(() {
        _running = false;
        _finished = true;
        _remaining = 0;
      });
      return;
    }
    HapticFeedback.selectionClick();
    setState(() {
      _stepIndex++;
      _remaining = _steps[_stepIndex].seconds;
    });
  }

  void _skipStep() {
    if (_finished) return;
    _advance();
  }

  void _restart() {
    _timer?.cancel();
    setState(() {
      _stepIndex = 0;
      _remaining = _steps.isEmpty ? 0 : _steps.first.seconds;
      _running = false;
      _finished = false;
    });
  }

  String _ui(String en, String vi, [String? th, String? zh]) {
    switch (widget.lang) {
      case 'vi':
        return vi;
      case 'th':
        return th ?? en;
      case 'zh':
        return zh ?? en;
      default:
        return en;
    }
  }

  @override
  Widget build(BuildContext context) {
    final idea = widget.idea;
    final progress = _steps.isEmpty
        ? 0.0
        : (_stepIndex + (_finished ? 1 : 0)) / _steps.length;

    return Scaffold(
      backgroundColor: context.appBg,
      appBar: AppBar(
        backgroundColor: context.appBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, color: context.appInk),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          idea.title(widget.lang),
          style: TextStyle(
            color: context.appInk,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
          child: Column(
            children: [
              // Progress
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress.clamp(0.0, 1.0),
                  minHeight: 6,
                  backgroundColor: context.appBorder,
                  color: context.appBrand,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _finished
                      ? _ui('Complete', 'Hoàn thành', 'เสร็จแล้ว', '已完成')
                      : _ui(
                          'Step ${_stepIndex + 1} of ${_steps.length}',
                          'Bước ${_stepIndex + 1} / ${_steps.length}',
                          'ขั้นตอน ${_stepIndex + 1} / ${_steps.length}',
                          '第 ${_stepIndex + 1} / ${_steps.length} 步',
                        ),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: context.appMuted,
                  ),
                ),
              ),
              const Spacer(),
              Text(idea.emoji, style: const TextStyle(fontSize: 56)),
              const SizedBox(height: 20),
              if (_finished) ...[
                Text(
                  _ui(
                    'Well done',
                    'Bạn đã làm rất tốt',
                    'เก่งมาก',
                    '做得很好',
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: context.appInk,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _ui(
                    'A few quiet minutes can still count as care.',
                    'Vài phút yên lặng vẫn là sự chăm sóc.',
                    'ไม่กี่นาทีเงียบ ๆ ก็คือการดูแล',
                    '安静的几分钟，也是一种照顾。',
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: context.appMuted,
                  ),
                ),
              ] else ...[
                Text(
                  _steps[_stepIndex].label(widget.lang),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                    color: context.appInk,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  '$_remaining',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    color: context.appBrandDeep,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  _ui('seconds', 'giây', 'วินาที', '秒'),
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appMuted,
                  ),
                ),
              ],
              const Spacer(),
              if (_finished) ...[
                StillButton(
                  label: _ui('Done', 'Xong', 'เสร็จ', '完成'),
                  onPressed: () => Navigator.pop(context, true),
                  icon: Icons.check_rounded,
                ),
                const SizedBox(height: 10),
                StillButton(
                  label: _ui('Practice again', 'Làm lại', 'ทำอีกครั้ง', '再练一次'),
                  onPressed: _restart,
                  variant: StillButtonVariant.secondary,
                ),
              ] else ...[
                StillButton(
                  label: _running
                      ? _ui('Pause', 'Tạm dừng', 'หยุดชั่วคราว', '暂停')
                      : _ui('Start', 'Bắt đầu', 'เริ่ม', '开始'),
                  onPressed: _running ? _pause : _start,
                  icon: _running ? Icons.pause_rounded : Icons.play_arrow_rounded,
                ),
                const SizedBox(height: 10),
                StillButton(
                  label: _ui('Next step', 'Bước tiếp', 'ขั้นตอนถัดไป', '下一步'),
                  onPressed: _skipStep,
                  variant: StillButtonVariant.ghost,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
