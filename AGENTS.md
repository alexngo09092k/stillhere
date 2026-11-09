# AGENTS.md — Still Here

Rules for humans and AI agents working on this repository.

## Product
Still Here is a local-first daily mood check-in app (OK / SHARE / SELF_CARE).
No account required. Check-in notes stay on device.

## Non-negotiables
1. **Do not change business logic** unless a signed-off spec says so.
2. Prefer editing within existing `features/<name>/` modules.
3. UI must stay aligned with the peach/cream design system in `lib/common/theme/`.
4. All user-facing strings go through `S.of(context)` / `lib/generated/l10n.dart` (en default).
5. Never commit secrets: `android/key.properties`, `*.jks`, API keys, Firebase private keys.
6. Local data only for check-ins; AI greeting must never send notes or mood payloads.

## Layout (Flutter + Antigravity)
```
lib/
  main.dart, app.dart
  common/           # theme, constants, routes
  core/             # storage, notifications, premium, export
  features/         # feature modules (data + presentation)
  pages/            # shell pages (home shell, splash, premium)
  shared/models/
  generated/        # l10n + intl messages
  providers/
docs/
  product/
  architecture/
  engineering/
specs/
```

## Commands
```bash
flutter pub get
flutter analyze
flutter test
flutter run
flutter build appbundle   # Play
flutter build ipa         # iOS
```

## Before finishing a task
- [ ] `flutter analyze` clean on touched files
- [ ] No hardcoded user strings (use S.*)
- [ ] Business flows still work: greeting → check-in → history → stats → settings
- [ ] Report what changed and residual risk
