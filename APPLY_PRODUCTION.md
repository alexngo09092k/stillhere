# Still Here — Production-ready pack

Merged from: original codebase + UI redesign v3 + intl fix + circular logo icons + Antigravity docs.

## What you get
- Full app source with redesigned UI/UX (design system, 4 tabs, time-of-day hero)
- Complete l10n (en default, vi/th/zh) — valid escaped strings
- Circular app icons (Android mipmaps + iOS AppIcon)
- Stats feature + overflow-safe bars
- Antigravity layout docs: `AGENTS.md`, `docs/`, `specs/`
- Unit tests: TimeBucket, CheckInStatus

## Business logic
**Unchanged:** check-in statuses, storage schema, greeting service, premium, ads hooks, reminder, export.

## Apply onto your machine copy
If you already have a working clone, prefer **overlay** rather than replacing `android/` signing:

```bash
# From this pack root:
rsync -a lib/ assets/ test/ docs/ specs/ AGENTS.md <your-project>/
# Icons
rsync -a android/app/src/main/res/mipmap-* <your-project>/android/app/src/main/res/
rsync -a ios/Runner/Assets.xcassets/AppIcon.appiconset/ \
  <your-project>/ios/Runner/Assets.xcassets/AppIcon.appiconset/
# Merge pubspec assets if needed (see pack pubspec.yaml assets list)

cd <your-project>
flutter pub get
flutter analyze
flutter test
flutter run
```

Or open this pack as the project root if path deps to `packages/fluttering*` are adjusted in `pubspec.yaml`.

## Production gates (must do yourself)
1. `android/key.properties` + upload keystore
2. Privacy Policy / Terms live URLs
3. Firebase App Check + AI quota
4. Store listings, screenshots, data safety forms
5. See `PRODUCTION_CHECKLIST.md`

## Verify flows
1. Splash → Onboarding (first run) → Home
2. Check-in → Success → History shows day
3. Stats week/month/year no yellow/black overflow stripes
4. Settings language EN/VI, theme, reminder toggle contrast
5. Hero changes across morning/noon/afternoon/evening (change device time to test)
