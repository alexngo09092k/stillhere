# StillHere — Production Store Readiness Checklist

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
- [ ] Publish **Privacy Policy** thật tại URL trong `enviroment.dart` (`still_here.netlify.app/privacy-policy/`)
- [ ] Publish **Terms of Service**
- [ ] Nội dung policy phải nêu rõ:
  - Dữ liệu check-in/note **chỉ lưu local** trên máy
  - AI greeting chỉ gửi: language, time bucket, prompt version, recent public greetings (không gửi note/check-in)
  - Ads / analytics nếu bật (AdMob, Firebase, Huawei)
  - Quyền thông báo chỉ khi user bật reminder
- [ ] Data safety form (Play) + App Privacy labels (App Store)

### 2.3 Firebase / AI
- [ ] Xác nhận project Firebase (`snapeditify-67a19`) là production đúng app
- [ ] Bật **App Check** production attestation (Play Integrity / DeviceCheck) trước khi expose AI endpoint
- [ ] Cấu hình model AI (Firebase AI Logic / Gemini) + quota + billing alerts
- [ ] Test fallback: airplane mode → static greeting; AI 429/timeout → static

### 2.4 Ads & IAP
- [ ] Thay AdMob App ID test → **production** trong:
  - `android/.../strings.xml` (`admob_api`)
  - `ios/Runner/Info.plist` (`GADApplicationIdentifier`)
- [ ] Ad unit IDs production trong remote config / `enviroment.dart` advertisement block
- [ ] IAP product IDs tạo trên Play Console & App Store Connect; khớp config `fluttering_iap`
- [ ] Test purchase + restore trên internal testing track

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

