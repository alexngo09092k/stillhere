# StillHere — Production Store Readiness Checklist

**App:** Still Here (`com.snapeditify.stillhere`)  
**Platforms:** Google Play + App Store (+ AppGallery optional)  
**Updated:** 2026-11-11 (code completion pass)

---

## 1. Code đã hoàn thiện trong pack này

| Item | Status |
|------|--------|
| AndroidManifest: POST_NOTIFICATIONS, BOOT_COMPLETED, receivers | ✅ |
| Reminder timezone: offset-based IANA mapping (no longer hardcode only Asia/Ho_Chi_Minh) | ✅ |
| Reminder localized title/body (en/vi/th/zh) + reschedule on language change | ✅ |
| Reminder reschedule on app start if previously enabled | ✅ |
| Ads config: multi-provider `google` + `huawei` + test unit IDs + clear TODO | ✅ |
| IAP config: multi-provider `google` + `apple` + `huawei` + product IDs | ✅ |
| Analytics / Remote Config providers expanded | ✅ |
| PremiumService + restore flow | ✅ |
| AI Gemini + static fallback + daily gate + safety filter | ✅ |
| Check-in / History / Stats / Settings / Onboarding / Delete data | ✅ |
| l10n en/vi/th/zh, design system, 4-tab shell | ✅ |
| Circular launcher icons | ✅ |
| ProGuard, desugaring, backup rules | ✅ |
| iOS NSUserNotificationsUsageDescription | ✅ |

---

## 2. Việc **bạn** vẫn phải làm trước khi upload (không thể tự động)

### 2.1 Signing & identity
- [ ] Tạo upload keystore Android và điền `android/key.properties`
- [ ] Không commit keystore / key.properties
- [ ] Play Console: app `com.snapeditify.stillhere` (hoặc đổi applicationId)
- [ ] iOS: App ID + certificates + provisioning (`com.snapeditify.stillhere`)

### 2.2 Store product setup
- [ ] Google Play: tạo subscription `com.snapeditify.stillhere.monthly` và `com.snapeditify.stillhere.yearly`
- [ ] App Store Connect: tạo cùng product IDs (hoặc map lại trong `enviroment.dart`)
- [ ] Huawei IAP: giữ / xác nhận `amonth` / `oneyear`
- [ ] Test purchase + restore trên sandbox từng store

### 2.3 Ads production
- [ ] Thay AdMob **App ID** production vào:
  - `android/.../strings.xml` → `admob_api`
  - `ios/Runner/Info.plist` → `GADApplicationIdentifier`
  - `lib/enviroment.dart` → `adMobAppIdAndroid` / `adMobAppIdIos`
- [ ] Thay **unit IDs** test trong `enviroment.dart` bằng unit production
- [ ] Bật consent / ATT / UMP nếu cần theo thị trường
- [ ] QA: banner không che check-in; interstitial không phá flow wellbeing

### 2.4 Legal & listing
- [ ] Publish **Privacy Policy** thật tại URL trong `enviroment.dart`
- [ ] Publish **Terms of Service**
- [ ] Nội dung policy phải nêu: data local-only, AI payload (language + time bucket), ads, analytics
- [ ] Điền iOS App ID thật vào `shareApp` / `updateApp` (hiện `idXXXXXXXX`)
- [ ] Data Safety (Play) + App Privacy (App Store) labels

### 2.5 AI key
- [ ] Ưu tiên đưa Gemini API key qua remote config hoặc `--dart-define=GEMINI_API_KEY=...`
- [ ] Không để key production commit lâu dài trong repo

### 2.6 Final device QA
- [ ] Reminder: bật → reboot → đổi timezone → đổi ngôn ngữ → nhận đúng giờ & đúng ngôn ngữ
- [ ] Offline: greeting static, check-in, history
- [ ] Premium: mua / restore / ẩn ads
- [ ] Text scale 200%, TalkBack / VoiceOver cơ bản
- [ ] Dark mode contrast

---

## 3. Release decision

**Code pack này đã xử lý các blocker có thể sửa trong source.**

Vẫn **chưa upload được** cho đến khi hoàn thành mục 2 (signing, product console, production ad IDs, privacy live, device QA).

Sau khi xong mục 2 → build AAB + IPA → internal testing → production.

