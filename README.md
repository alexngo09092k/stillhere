# Still Here

Một lời hỏi thăm nhỏ, để mỗi ngày bạn biết rằng cảm xúc của mình luôn đáng được quan tâm.

Local-first Flutter app (Android + iOS): static daily greeting, mood check-in, history, local reminder, settings. Không bắt buộc tài khoản / cloud sync trong MVP. AI greeting là phần chưa tích hợp; hiện tại ứng dụng dùng lời chào tĩnh.

## Docs

- `StillHere_Full_Project_PRD.pdf` — PRD + SRS + architecture
- `PRODUCTION_CHECKLIST.md` — checklist trước khi upload store

## Setup

```bash
# Các package fluttering được tham chiếu từ Git (SSH).
# Cần quyền truy cập các repository nội bộ trước khi chạy pub get.
flutter pub get
flutter run
```

### Release Android

1. Tạo upload keystore và copy `android/key.properties.example` thành `android/key.properties`.
   Release task sẽ dừng nếu chưa có upload signing hợp lệ; không dùng debug key để upload store.
2. `flutter build appbundle --release`
3. Upload AAB lên Play Console.

### Release iOS

1. Cấu hình signing trong Xcode (bundle `com.snapeditify.stillhere`).
2. `flutter build ipa --release`
3. Upload qua Transporter / Xcode.

## Privacy (MVP)

- Check-in & note: lưu cục bộ trong app storage; Android/iOS system backup có thể bao gồm dữ liệu tùy cài đặt thiết bị.
- Analytics: chỉ ghi nhận sự kiện hành động; không gửi mood category hoặc note.
- AI greeting: chưa được tích hợp; hiện dùng static greeting fallback.
- Reminder: local notification, opt-in.

## Package

- Application ID / Bundle ID: `com.snapeditify.stillhere`
- Display name: Still Here
