# Still Here — Deploy readiness (updated)

## What was completed in this pass

### 1. AI greeting (free)
- Implemented **Google Gemini free tier** (`gemini-2.0-flash`) via REST.
- File: `lib/core/ai/gemini_greeting_client.dart`
- Wired in `lib/features/greeting/data/greeting_service.dart`
- Safety: never sends check-in notes / mood; daily gate (1 success/day); 5–6s timeout; static fallback offline / error / empty key.
- Configure key (do **not** commit real key):
  ```bash
  flutter run --dart-define=GEMINI_API_KEY=your_key_here
  ```
  Or set `"apiKey"` under `"ai"` in `lib/enviroment.dart` for local only.
  Get free key: https://aistudio.google.com/apikey

### 2. Ads (full multi-provider)
- `enviroment.dart` → `"providers": ["google", "huawei"]`
- AdMob test unit IDs included for banner / interstitial / reward / app-open / native.
- Huawei units kept.
- `AdView` + `AdRevenueManager` already hide ads when premium.
- **Before store:** replace test AdMob unit IDs + App IDs with production in:
  - `lib/enviroment.dart` advertisement block
  - `android/.../res/values/strings.xml` (`admob_api`)
  - `ios/Runner/Info.plist` (`GADApplicationIdentifier`)

### 3. IAP (full multi-store)
- Providers: `google`, `huawei`
- Products:
  - `still_here_premium_month` / `still_here_premium_year` (Google + Apple)
  - `com.snapeditify.stillhere.amonth` / `.oneyear` (Huawei)
- `PremiumService` already syncs entitlement + restore via `in_app_purchase`.
- **Before store:** create matching subscription products on Play Console + App Store Connect + Huawei.

### 4. Analytics / Remote Config
- Providers expanded to include Google alongside Huawei.

### 5. Dependency
- Added `http: ^1.2.2` for Gemini client.

---

## Remaining manual steps (cannot automate)

1. **Signing**
   - Create upload keystore + `android/key.properties`
   - iOS signing in Xcode (`com.snapeditify.stillhere`)

2. **Gemini key**
   - Create free API key in AI Studio
   - Prefer remote-config injection in production; keep daily quota monitoring

3. **AdMob / IAP production IDs**
   - Create AdMob app + ad units
   - Create subscription products on each store

4. **Legal**
   - Publish Privacy Policy + Terms at URLs in `enviroment.dart`
   - Fill Play Data safety + App Store privacy labels

5. **Build**
   ```bash
   flutter pub get
   flutter analyze
   flutter test
   flutter build appbundle --release
   flutter build ipa --release   # macOS
   ```

6. **fluttering_* packages**
   - Currently git (SSH). For offline/CI: switch to `path: ../packages/fluttering_*` after placing packages next to the app.

---

## Free AI choice rationale
| Option | Free tier | Fit |
|--------|-----------|-----|
| **Gemini 2.0 Flash** (chosen) | Generous free RPM/RPD via AI Studio | Same Google stack as Firebase/AdMob; low latency; good multilingual |
| Groq | Free | Extra vendor |
| OpenRouter free models | Limited | Extra dependency |
| On-device SLM | Zero cost | Quality/latency risk on mid devices |

Gemini free is the best balance for Still Here’s short multilingual greeting use-case.
