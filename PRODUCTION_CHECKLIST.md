# StillHere — Production Store Readiness Checklist

**Pack:** production merge (UI v3 + intl + circular icons + Antigravity docs)  
**App:** Still Here (`com.snapeditify.stillhere`)  
**Platforms:** Google Play + App Store  

### UI / i18n gates (this pack)
- [x] Design system (peach/cream) light + dark
- [x] 4-tab shell: Home, Journal, Insights, Settings
- [x] Time-of-day hero assets
- [x] l10n en/vi/th/zh; default English
- [x] Stats overflow fix
- [x] Circular logo launcher icons
- [x] AGENTS.md + docs/ + specs/

---

**App:** Still Here (`com.snapeditify.stillhere`)  
**Platforms:** Google Play + App Store (+ AppGallery optional)  
**Baseline:** PRD v1.0 (05/11/2026)

---

## 1. Đã hoàn thiện trong repo (code)

| Item | Status |
|------|--------|
| AndroidManifest: POST_NOTIFICATIONS, BOOT_COMPLETED, VIBRATE, WAKE_LOCK | ✅ |
| Notification boot receivers (flutter_local_notifications) | ✅ |
| backup_rules + data_extraction_rules | ✅ |
| App label / strings → "Still Here" | ✅ |
| Release signingConfig đọc `android/key.properties` | ✅ |
| ProGuard rules (Flutter, Firebase, HMS, notifications) | ✅ |
| Core library desugaring (cho timezone / notifications) | ✅ |
| iOS NSUserNotificationsUsageDescription + tracking string | ✅ |
| pubspec path deps tới `packages/fluttering*` (build offline) | ✅ |
| `.gitignore` loại trừ keystore / key.properties | ✅ |
| MVP features: greeting (AI+static), check-in, history, reminder, settings, about, offline | ✅ (code sẵn) |

---

## 2. Bắt buộc bạn phải làm trước khi upload (không thể tự động)

### 2.1 Signing & identity
- [ ] Tạo upload keystore:  
  `keytool -genkey -v -keystore stillhere-upload.jks -keyalg RSA -keysize 2048 -validity 10000 -alias stillhere`
- [ ] Copy `android/key.properties.example` → `android/key.properties` và điền path/password thật
- [ ] **Không** commit `key.properties` / `.jks`
- [ ] Play Console: tạo app với package `com.snapeditify.stillhere` (hoặc đổi applicationId nếu muốn brand riêng)
- [ ] iOS: Apple Developer App ID + certificates + provisioning (bundle `com.snapeditify.stillhere`)

### 2.2 Store compliance / legal (OQ-14 PRD)
- [ ] Publish **Privacy Policy** thật tại URL trong `enviroment.dart` (`snapeditify.netlify.app/privacy-policy/`)
- [ ] Publish **Terms of Service**
- [ ] Nội dung policy phải nêu rõ:
  - Dữ liệu check-in/note **chỉ lưu local** trên máy
  - AI greeting chỉ gửi: language, time bucket, prompt version, recent public greetings (không gửi note/check-in)
  - Ads / analytics nếu bật (AdMob, Firebase, Huawei)
  - Quyền thông báo chỉ khi user bật reminder
- [ ] Data safety form (Play) + App Privacy labels (App Store)

### 2.3 Firebase / AI
- [ ] Xác nhận project Firebase (`snapeditify-67a19`) là production đúng app
- [ ] Bật **App Check** production attestation (Play Integrity / DeviceCheck) nếu expose thêm backend
- [x] AI greeting dùng **Gemini free tier** (`gemini-2.0-flash`) — `lib/core/ai/gemini_greeting_client.dart`
- [ ] Set `GEMINI_API_KEY` (dart-define hoặc remote config); không commit key thật
- [ ] Test fallback: airplane mode → static greeting; AI 429/timeout → static
- [ ] Monitor free quota tại https://aistudio.google.com/

### 2.4 Ads & IAP
- [x] Multi-provider ads: Google AdMob + Huawei (test unit IDs in `enviroment.dart`)
- [x] Multi-store IAP: Google + Apple + Huawei product IDs configured
- [ ] Thay AdMob App ID / unit IDs test → **production** trong:
  - `android/.../strings.xml` (`admob_api`)
  - `ios/Runner/Info.plist` (`GADApplicationIdentifier`)
  - `lib/enviroment.dart` advertisement block
- [ ] Tạo subscription products trên Play Console & App Store Connect & Huawei (IDs khớp env)
- [ ] Test purchase + restore trên internal testing track
- [ ] Verify ads hidden when PremiumService.isPremium == true

### 2.5 Store listing assets
- [ ] Icon 512×512 (Play) / 1024×1024 (App Store)
- [ ] Feature graphic 1024×500 (Play)
- [ ] Screenshots phone + tablet (tối thiểu theo guideline từng store)
- [ ] Short description + full description (VI + EN khuyến nghị)
- [ ] Content rating questionnaire (IARC)
- [ ] Target age / category: Health & Fitness hoặc Lifestyle (chốt với PO)

### 2.6 Version & build
```bash
# Từ thư mục still_here (cạnh packages/)
flutter pub get
flutter analyze
flutter test

# Android App Bundle
flutter build appbundle --release

# iOS (trên macOS)
flutter build ipa --release
```
- [ ] Bump `version:` trong `pubspec.yaml` mỗi lần ship (semver+build), ví dụ `1.0.0+2`
- [ ] Align `enviroment.dart` → `business.version` với versionName

### 2.7 QA acceptance (PRD AC)
- [ ] Cold start ≤ 3s thiết bị tầm trung
- [ ] Offline: Home / check-in / history / settings / reminder không cần mạng
- [ ] Reminder: bật → xin permission → nhận noti đúng giờ (best-effort)
- [ ] Xóa 1 ngày / xóa tất cả có confirm
- [ ] Accessibility: text scale 200% không cắt chữ nghiêm trọng
- [ ] Không log note / mood ra console production

---

## 3. Open Questions còn cần Product Owner

| ID | Câu hỏi | Đề xuất mặc định trong code |
|----|---------|-----------------------------|
| OQ-06 | Reminder mặc định ON/OFF? | OFF (opt-in) |
| OQ-13 | Exclude data khỏi OS backup? | Hiện **allow backup** |
| OQ-14 | Legal entity trên policy? | Cần điền trước submit |
| — | Giữ Huawei AppGallery + HMS? | Đang giữ AGConnect; nếu chỉ Play thì có thể gỡ sau |

---

## 4. Cấu trúc thư mục sau khi unpack

```
artifacts/
  still_here/          # app
  packages/
    fluttering/
    fluttering_ads/
    fluttering_iap/
    fluttering_remote_config/
    fluttering_analytics/
```

`pubspec.yaml` dùng `path: ../packages/...`. Nếu team build từ git remote, đổi lại block git như trước.

---

## 5. Lệnh build release nhanh

```bash
cd still_here
cp android/key.properties.example android/key.properties
# chỉnh key.properties

flutter clean && flutter pub get
flutter build appbundle --release -v
# output: build/app/outputs/bundle/release/app-release.aab
```

Upload AAB lên Play Console → Internal testing → Closed → Production.



---

## 5. Audit bổ sung ngày 09/11/2026

### Đã chỉnh trong source
- [x] Đồng bộ lại palette thương hiệu theo icon mới (violet / twilight) cho light và dark theme.
- [x] Sửa nền TextField và các lựa chọn check-in đang hardcode trắng trong dark mode.
- [x] Sửa màu note ở lịch sử để lấy từ theme hiện hành.
- [x] AppCard dùng outline và shadow theo theme.
- [x] Không chèn interstitial ngay khi mở check-in, chuyển tab hoặc lưu cảm xúc; banner vẫn có thể hiển thị theo cấu hình.
- [x] Analytics không còn nhận mood category; event check-in chỉ ghi nhận hành động, không kèm trạng thái hoặc note.
- [x] Cập nhật bản dịch Privacy/About để nói rõ dữ liệu lưu cục bộ có thể nằm trong backup hệ điều hành tùy thiết lập thiết bị.
- [x] Tắt cross-promotion các game không liên quan trong fallback quảng cáo.
- [x] Thêm logo vào Flutter assets, Splash và About.
- [x] Thay launcher icon Android và toàn bộ AppIcon iOS bằng bộ nhận diện mới.
- [x] Thay widget test counter mặc định bằng regression checks cho palette Light/Dark.
- [x] Cấu hình release signing theo `android/key.properties`; release packaging fail-fast nếu thiếu upload keystore.

### Blocker chưa thể xác nhận / cần xử lý trước production
- [ ] Chạy `flutter pub get`, `flutter analyze`, `flutter test`, Android AAB và iOS IPA trên máy có Flutter/Xcode; môi trường audit hiện tại không có Flutter SDK.
- [ ] Xác minh quyền truy cập các Git dependencies nội bộ: `fluttering`, `fluttering_ads`, `fluttering_iap`, `fluttering_remote_config`, `fluttering_analytics` (SSH URLs).
- [ ] `GreetingService._requestAiGreeting()` hiện là placeholder trả `null`; AI greeting thực tế chưa được tích hợp dù PRD FR-003 yêu cầu Firebase AI Logic + App Check.
- [ ] `LocalStorage` hiện serialize check-in thành JSON trong `AsyncStorage` (key-value), chưa phải SQLite như kiến trúc PRD mô tả; cần quyết định/migration có backup và test dữ liệu trước khi phát hành.
- [ ] `ReminderHelper._localTimezoneName()` hardcode `Asia/Ho_Chi_Minh`; cần lấy IANA timezone từ thiết bị và test đổi timezone/DST theo PRD.
- [ ] Ads / IAP / Analytics trong `enviroment.dart` đang bật provider Huawei; chưa có cấu hình sản phẩm Google Play Billing và Apple In-App Purchase. Xác nhận chiến lược store trước khi bật monetization.
- [ ] Xác minh AdMob App IDs trong Android/iOS và ad unit IDs thực tế, consent/ATT, privacy disclosure; không suy ra rằng ID hiện tại là production chỉ từ giá trị cấu hình. `enviroment.dart` đang khai báo AdMob app IDs rỗng và provider Huawei, trong khi native plist/strings có AdMob IDs; cần thống nhất cấu hình theo từng store.
- [ ] Cập nhật `shareApp` và `updateApp`: hiện URL Android/iOS/Huawei đều trỏ AppGallery; không đúng cho Google Play / App Store. Chỉ thay bằng URL listing sau khi có app ID thật.
- [ ] Rà soát IAP config: hiện chỉ có provider Huawei; product annual đang có tên/description “A Month” và giá/currency cần xác nhận. Tạo và kiểm tra product ID riêng cho Google Play Billing và Apple StoreKit nếu phát hành hai store này.
- [ ] QA hành vi quảng cáo app-resume, bảo đảm không che màn hình check-in hoặc gây gián đoạn luồng người dùng; chỉ bật ad formats phù hợp chính sách store và bản chất wellbeing.
- [ ] Privacy Policy / Terms URL, legal entity, Data Safety và App Privacy labels phải được chủ sở hữu xác nhận và publish thật.
- [ ] Android upload keystore và Apple signing/provisioning phải được cấu hình bởi chủ tài khoản; không có credential trong source archive.
- [ ] Kiểm thử thiết bị thật: permission, reboot, notification, offline, AI fallback, text scale 200%, tablet, VoiceOver/TalkBack, purchase/restore và data deletion.

**Release decision: NOT READY TO UPLOAD** cho tới khi các blocker trên được xử lý và có bằng chứng build/test. Không deploy hoặc publish tự động.
