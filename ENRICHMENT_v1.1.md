# Still Here — Enrichment for AppGallery Rule 4.1 (v1.1.0)

Huawei rejected the app for offering “only one type of content”. This release adds **multiple distinct content types** beyond a single mood check-in flow.

## New content types & features

### 1. Self-care toolkit (tab **Care / Chăm sóc**)
- Breathing exercises (4-7-8, Box breathing)
- Grounding exercises (5-4-3-2-1, feel your feet)
- Gentle self-care ideas (water, gratitude, walk, mute notifications, music…)
- Mood-aware suggestions (different lists for OK / SHARE / SELF_CARE)
- Interactive cards with duration estimates

### 2. Inspiration quotes
- Local quote library (VI + EN)
- Daily quote + mood-based quotes on the Care tab
- Differentiated reflective content, not only user-generated notes

### 3. Activity tags on check-in
- Optional tags: Work, Family, Friends, Health, Rest, Hobby, Study, Outdoor, Food, Other
- Stored with each check-in (`activities` field) for richer history/stats later
- Makes each check-in multi-dimensional (mood + context)

### 4. Achievements / milestones
- First check-in, streaks (3 / 7 / 14 / 30), total days (10 / 30 / 100)
- Note writer, self-care friend
- Progress bars + unlock state on Care tab

### 5. “On this day” support in data layer
- `CheckInService.getOnThisDay()` for same month-day memories
- Ready to surface on Home / History

### 6. Navigation
- Bottom tabs: **Home | Care | Journal | Stats**
- Settings opened from the profile avatar (full-screen)

## Model changes
- `CheckIn` now has `List<String> activities` (backward compatible: missing field → `[]`)
- `CheckInService.save(..., activities:)` 

## Files added
- `lib/shared/models/activity_tag.dart`
- `lib/features/care/data/self_care_content.dart`
- `lib/features/care/presentation/care_page.dart`
- `lib/features/inspiration/data/quotes.dart`
- `lib/features/achievements/data/achievements.dart`

## Resubmit checklist (AppGallery)
1. Bump version already set to **1.1.0+2**
2. New screenshots showing: Home, Care toolkit, Check-in with activity tags, Stats, Achievements
3. Update store description / What’s New to list the new content types explicitly
4. In the reply to review, mention: self-care exercises, inspiration quotes, activity context tags, milestones, stats & journal

## Build notes
Private `fluttering*` git dependencies are unchanged. Run `flutter pub get` with SSH access to those repos, then:

```bash
flutter build appbundle --release
```
