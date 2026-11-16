import 'package:flutter/material.dart';
import 'package:still_here/common/app_theme_colors.dart';
import 'package:still_here/features/achievements/data/achievements.dart';
import 'package:still_here/features/care/data/self_care_content.dart';
import 'package:still_here/features/checkin/data/checkin_service.dart';
import 'package:still_here/features/inspiration/data/quotes.dart';
import 'package:still_here/shared/models/check_in.dart';
import 'package:still_here/generated/l10n.dart';

/// Self-care toolkit + achievements + inspiration — distinct content types.
class CarePage extends StatefulWidget {
  const CarePage({super.key});

  @override
  State<CarePage> createState() => CarePageState();
}

class CarePageState extends State<CarePage> {
  CheckInStatus? _todayStatus;
  List<Achievement> _achievements = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    setState(() => _loading = true);
    final today = await CheckInService.instance.getToday();
    final ach = await AchievementService.instance.evaluate();
    if (!mounted) return;
    setState(() {
      _todayStatus = today?.status;
      _achievements = ach;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final s = S.of(context);
    final ideas = SelfCareContent.forStatus(_todayStatus);
    final quote = InspirationQuotes.forStatus(
      _todayStatus,
      seed: DateTime.now().day,
    );
    final unlocked = _achievements.where((a) => a.unlocked).length;

    return Scaffold(
      backgroundColor: context.appBg,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: reload,
              color: context.appBrand,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                children: [
                  Text(
                    s.careTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: context.appInk,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    s.careSubtitle,
                    style: TextStyle(fontSize: 14, color: context.appMuted),
                  ),
                  const SizedBox(height: 20),

                  // Daily quote card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.appBrand.withOpacity(0.18),
                          context.appBrand.withOpacity(0.06),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: context.appBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.format_quote_rounded,
                                color: context.appBrand, size: 22),
                            const SizedBox(width: 8),
                            Text(
                              s.careTodaysNote,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: context.appBrandDeep,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          quote.text(lang),
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.45,
                            fontStyle: FontStyle.italic,
                            color: context.appInk,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Breathing & grounding section
                  _SectionTitle(
                    title: s.breathingGroundingTitle,
                    subtitle: s.breathingGroundingSubtitle,
                  ),
                  const SizedBox(height: 10),
                  ...SelfCareContent.breathing.map(
                    (e) => _IdeaCard(idea: e, lang: lang, accent: context.appBrand),
                  ),
                  ...SelfCareContent.grounding.map(
                    (e) => _IdeaCard(idea: e, lang: lang, accent: context.appBrand),
                  ),
                  const SizedBox(height: 20),

                  // Suggested for today
                  _SectionTitle(
                    title: s.suggestionsForTodayTitle,
                    subtitle: s.suggestionsForTodaySubtitle,
                  ),
                  const SizedBox(height: 10),
                  ...ideas.take(5).map(
                    (e) => _IdeaCard(idea: e, lang: lang, accent: context.appBrand),
                  ),
                  const SizedBox(height: 24),

                  // Achievements
                  _SectionTitle(
                    title: s.milestonesTitle,
                    subtitle: s.milestonesUnlocked(unlocked, _achievements.length),
                  ),
                  const SizedBox(height: 10),
                  ..._achievements.map((a) => _AchievementTile(a: a, lang: lang)),
                ],
              ),
            ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: context.appInk,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(fontSize: 13, color: context.appMuted),
        ),
      ],
    );
  }
}

class _IdeaCard extends StatelessWidget {
  final SelfCareIdea idea;
  final String lang;
  final Color accent;

  const _IdeaCard({
    required this.idea,
    required this.lang,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.appSurf,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(idea.emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        idea.title(lang),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: context.appInk,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: accent.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        S.of(context).minutesLabel(idea.minutes),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  idea.body(lang),
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: context.appMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  final Achievement a;
  final String lang;
  const _AchievementTile({required this.a, required this.lang});

  @override
  Widget build(BuildContext context) {
    final ratio = a.target == 0 ? 0.0 : (a.progress / a.target).clamp(0.0, 1.0);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.appSurf,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: a.unlocked
              ? context.appBrand.withOpacity(0.45)
              : context.appBorder,
        ),
      ),
      child: Row(
        children: [
          Opacity(
            opacity: a.unlocked ? 1 : 0.45,
            child: Text(a.emoji, style: const TextStyle(fontSize: 28)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a.title(lang),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: context.appInk,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  a.desc(lang),
                  style: TextStyle(fontSize: 12, color: context.appMuted),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: ratio,
                    minHeight: 6,
                    backgroundColor: context.appBorder,
                    color: a.unlocked ? context.appBrand : context.appMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${a.progress}/${a.target}',
                  style: TextStyle(fontSize: 11, color: context.appMuted),
                ),
              ],
            ),
          ),
          if (a.unlocked)
            Icon(Icons.check_circle_rounded, color: context.appBrand, size: 22),
        ],
      ),
    );
  }
}
