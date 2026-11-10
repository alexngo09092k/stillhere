# Still Here — Deploy Ready Notes (2026-11-11)

## Code changes in this pack

1. **Reminder / Notification**
   - Timezone no longer hardcoded only to `Asia/Ho_Chi_Minh`.
   - Offset → IANA mapping for primary markets + safe fallback.
   - Notification title/body localized (en / vi / th / zh).
   - Reschedule when user changes language.
   - `rescheduleIfEnabled()` helper for resume / language flows.

2. **Ads**
   - Providers: `google` + `huawei`.
   - Google test unit IDs included for banner / interstitial / rewarded.
   - Clear TODO comments for production App IDs + unit IDs.
   - Native Android/iOS still have separate AdMob App ID strings — align them before release.

3. **IAP / Premium**
   - Providers: `google` + `apple` + `huawei`.
   - Product IDs ready for console mapping:
     - Google/Apple: `com.snapeditify.stillhere.monthly` / `yearly`
     - Huawei: `com.snapeditify.stillhere.amonth` / `oneyear`

4. **Remote Config / Analytics**
   - Expanded providers to include Google where applicable.

5. **Docs**
   - `PRODUCTION_CHECKLIST.md` updated to match current code state.

## What you still do outside the repo

- Android upload keystore + `key.properties`
- Create IAP products on each store console
- Production AdMob IDs (App + units)
- Live Privacy Policy + Terms
- Replace iOS `idXXXXXXXX` in share/update links
- Device QA matrix (reminder reboot, purchase sandbox, offline, accessibility)

## Build commands (on machine with Flutter)

```bash
flutter pub get
flutter analyze
flutter test
flutter build appbundle --release   # Android
flutter build ipa --release         # iOS
```

## Git dependencies

`fluttering*` packages are still referenced via SSH Git.  
For offline/CI: place packages next to the app and switch `pubspec.yaml` to `path:` deps.
