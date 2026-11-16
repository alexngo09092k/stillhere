# Still Here — Huawei AppGallery Publish Checklist (v1.1.0)

Cập nhật: 2026-11-17  
Target: **Huawei AppGallery** (HMS-only / GMS-optional)

## A. Code đã xử lý trong pack này

| Item | Status |
|------|--------|
| IAP monthly/yearly type → `subscriptions` (trước là nonConsumables) | ✅ Fixed |
| Version sync pubspec `1.1.0+2` ↔ business config `1.1.0` | ✅ Fixed |
| Release signing qua `android/key.properties` | ✅ Template sẵn |
| ProGuard keep rules HMS / IAP / Ads | ✅ Strengthened |
| AGConnect plugin trong `settings.gradle.kts` | ✅ Added |
| Path deps `fluttering*` (offline / CI) | ✅ Switched |
| `key.properties` / keystore trong `.gitignore` | ✅ Added |
| Maintenance typo, comment EN, icons assets | ✅ Cleaned |

## B. Việc BẠN phải làm trên console & máy build (bắt buộc)

### B1. Signing (AppGallery yêu cầu release sign)

```bash
# Tạo upload keystore nếu chưa có
keytool -genkey -v -keystore keystore/stillhere-upload.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias stillhere

# Copy template
cp android/key.properties.example android/key.properties
# Điền storePassword / keyPassword / storeFile / keyAlias
```

### B2. Huawei AppGallery Connect

1. App ID đã có trong `agconnect-services.json` (`119732529`) — xác nhận package `com.snapeditify.stillhere`.
2. **IAP products** (Subscriptions):
   - `com.snapeditify.stillhere.amonth` — Premium Monthly
   - `com.snapeditify.stillhere.oneyear` — Premium Yearly  
   Tạo đúng loại **Auto-renewable / Subscription** trên console (không tạo non-consumable).
3. **Ads (Petal Ads / Huawei Ads)**: xác nhận unit IDs trong `lib/enviroment.dart` vẫn còn hiệu lực:
   - roll / interstitial / reward / splash / banner
4. **Analytics**: provider `huawei` đã bật.
5. **Remote Config**: provider `huawei` — cần package `huawei_remote_config` (git) khi `pub get`.

### B3. Privacy & listing

- [ ] Privacy Policy live: `https://snapeditify.netlify.app/privacy-policy/`
- [ ] Terms: `https://snapeditify.netlify.app/terms-of-service`
- [ ] Nội dung policy nêu rõ: data local-first, AI (chỉ language + time bucket), ads Huawei, analytics Huawei
- [ ] AppGallery listing: mô tả EN + VI, screenshot phone, icon 512, feature graphic
- [ ] Content rating questionnaire
- [ ] Data safety / privacy labels theo AppGallery

### B4. Build & upload

```bash
cd still_here
flutter pub get
flutter analyze
flutter test
flutter build appbundle --release
# hoặc APK nếu AppGallery yêu cầu:
# flutter build apk --release
```

Upload AAB/APK lên AppGallery Connect → Internal testing → Production.

### B5. Device QA matrix (Huawei device / EMUI / HarmonyOS)

- [ ] Cold start: locale + theme restore đúng (VI/EN/TH/ZH)
- [ ] Onboarding → Home
- [ ] Check-in flow + success + history + stats
- [ ] Reminder: bật → reboot → nhận đúng giờ & đúng ngôn ngữ
- [ ] Offline: greeting static, check-in, history
- [ ] Premium: mua sandbox subscription → ẩn ads → restore
- [ ] Ads: banner không che CTA check-in; interstitial không phá flow wellbeing
- [ ] Dark mode contrast
- [ ] Text scale 200%

## C. Không chặn AppGallery nhưng nên biết

- Firebase vẫn initialize (google-services) — trên máy không GMS sẽ fail soft nếu code handle; app đã ưu tiên Huawei providers cho ads/IAP/analytics/RC.
- Gemini AI key: truyền `--dart-define=GEMINI_API_KEY=...` hoặc remote config; không commit key.
- iOS App Store links vẫn placeholder `idXXXXXXXX` — không ảnh hưởng bản Huawei.

## D. Cấu trúc workspace khuyến nghị

```
workspace/
  still_here/          # app
  fluttering/
  fluttering_ads/
  fluttering_iap/
  fluttering_remote_config/
  fluttering_analytics/
```

`pubspec.yaml` dùng `path: ../fluttering*` — giữ nguyên cấu trúc này khi build.
