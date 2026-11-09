# Still Here

Một lời hỏi thăm nhỏ, để mỗi ngày bạn biết rằng cảm xúc của mình luôn đáng được quan tâm.

Local-first Flutter app (Android + iOS): daily greeting (static + optional AI), mood check-in, history, local reminder, settings. Không bắt buộc tài khoản / cloud sync trong MVP.

## Docs

- `StillHere_Full_Project_PRD.pdf` — PRD + SRS + architecture
- `PRODUCTION_CHECKLIST.md` — checklist trước khi upload store

## Setup

```bash
# Cấu trúc
#   still_here/          ← repo app
#   packages/fluttering* ← internal modules (path deps)

cd still_here
flutter pub get
flutter run
```

### Release Android

1. Tạo keystore và `android/key.properties` (xem `android/key.properties.example`).
2. `flutter build appbundle --release`
3. Upload AAB lên Play Console.

### Release iOS

1. Cấu hình signing trong Xcode (bundle `com.snapeditify.stillhere`).
2. `flutter build ipa --release`
3. Upload qua Transporter / Xcode.

## Privacy (MVP)

- Check-in & note: chỉ lưu trên thiết bị.
- AI greeting: chỉ gửi language, time bucket, prompt version, recent public greetings.
- Reminder: local notification, opt-in.

## Package

- Application ID / Bundle ID: `com.snapeditify.stillhere`
- Display name: Still Here
