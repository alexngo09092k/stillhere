// GENERATED for StillHere — full intl
import 'package:flutter/material.dart';

class S {
  S(this.localeName);
  final String localeName;
  static S? _current;
  static S get current { assert(_current != null); return _current!; }
  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
  static Future<S> load(Locale locale) async {
    final instance = S(locale.languageCode);
    S._current = instance;
    return instance;
  }
  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null);
    return instance!;
  }
  static S? maybeOf(BuildContext context) => Localizations.of<S>(context, S);
  static const Map<String, Map<String, String>> _maps = {
    'en': {
      'appTagline': 'A small check-in each day',
      'skip': 'Skip',
      'continueAction': 'Continue',
      'getStarted': 'Get started',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'save': 'Save',
      'later': 'Later',
      'update': 'Update',
      'openSettings': 'Open Settings',
      'openBrowser': 'Open in browser',
      'yourAppIsOutdated': 'Your app is outdated. Please update to continue.',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'Your app version is no longer supported. You\'re missing out on new features and improvements.',
      'navHome': 'Home',
      'navHistory': 'History',
      'navSettings': 'Settings',
      'today': 'Today',
      'greetingFallback': 'Hello. Hope everything is going okay for you.',
      'checkInToday': 'Today\'s check-in',
      'howAreYouFeeling': 'How are you feeling today?',
      'checkInCta': 'Check in today',
      'onboard1Title': 'A small pause each day',
      'onboard1Body': 'You don\'t always have to be fine. You can share in your own way.',
      'onboard2Title': 'Private greeting & check-in',
      'onboard2Body': 'A gentle hello and a place to note how you feel — just for you.',
      'onboard3Title': 'Your data stays on your device',
      'onboard3Body': 'No account, no required cloud. You\'re fully in control.',
      'checkInTitle': 'Check-in',
      'howAreYouFeelingToday': 'How are you feeling today?',
      'chooseClosest': 'Pick what feels closest to you.',
      'noteOptional': 'Note (optional)',
      'noteHint': 'Anything you\'d like to note today?',
      'saveFailed': 'Couldn\'t save. Please try again.',
      'statusOk': 'Okay',
      'statusShare': 'Want to share',
      'statusSelfCare': 'Need self-care',
      'thankYouCheckIn': 'Thank you for taking\na moment for yourself.',
      'backHome': 'Back to home',
      'viewHistory': 'View history',
      'historyTitle': 'History',
      'labelDays': 'Days',
      'labelOk': 'Okay',
      'labelShare': 'Share',
      'labelSelfCare': 'Self-care',
      'historyEmpty': 'No entries this month yet.\nYou can start whenever you\'re ready.',
      'settingsTitle': 'Settings',
      'sectionReminder': 'Reminders',
      'sectionGreeting': 'Greeting',
      'sectionPremium': 'Premium',
      'sectionData': 'Data',
      'enableCheckInReminder': 'Enable check-in reminder',
      'reminderAt': 'Remind at {time} every day',
      'reminderOff': 'Off',
      'reminderTime': 'Reminder time',
      'useAiGreeting': 'Use AI greetings',
      'useAiGreetingSubtitle': 'Turn off to always use local greetings',
      'removeAdsPremium': 'Remove ads / Premium',
      'premiumActive': 'Active',
      'upgradeToRemoveAds': 'Upgrade to remove ads',
      'deleteAllData': 'Delete all data',
      'deleteAllDataConfirm': 'Delete all data on this device? This cannot be undone.',
      'dataDeleted': 'All data has been deleted.',
      'needNotificationPermission': 'Notification permission is needed for reminders. You can enable it in system Settings.',
      'dataStaysOnDevice': "Still Here • Data is stored locally",
      'premium': 'Premium',
      'youArePremium': 'You\'re on Premium',
      'adFreeExperience': 'Ad-free experience',
      'premiumThanks': 'Thanks for supporting StillHere. Ads have been removed.',
      'premiumSupportDesc': 'Remove all ads and support StillHere development.',
      'benefitNoAds': 'No more banners & interstitials',
      'benefitAiPriority': 'Priority AI greetings',
      'benefitSupportDev': 'Support the development team',
      'premiumActiveOnDevice': 'Premium is active on this device.',
      'iapUnavailable': 'In-app purchases are temporarily unavailable.',
      'loadingPlans': 'Loading plans…',
      'upgradePremium': 'Upgrade to Premium',
      'restorePurchases': 'Restore purchases',
      'purchaseSuccess': 'Premium unlocked. Thank you!',
      'purchaseIncomplete': 'Purchase not completed. Try again or restore purchases.',
      'purchaseFailed': 'Could not purchase: {error}',
      'restoreSuccess': 'Premium restored successfully.',
      'restoreEmpty': 'No previous purchases found.',
      'restoreFailed': 'Restore failed: {error}',
      'morning': 'Morning',
      'afternoon': 'Afternoon',
      'evening': 'Evening',
      'language': 'Language',
      'theme': 'Theme',
      'themeLight': 'Light',
      'themeDark': 'Dark',
      'themeSystem': 'System',
      'aboutTitle': 'About & Privacy',
      'privacyBody': "Check-ins and notes are stored locally in the app. Still Here does not require an account. We do not send your notes or mood status to analytics. Depending on your operating-system backup settings, app data may be included in device backups. You can export or delete data in Settings.",
      'aboutAiNote': "AI greetings are optional. When AI is configured and enabled, a limited prompt is sent to generate a greeting; check-in notes and mood entries are never included. If AI is unavailable or not configured, the app uses local static greetings.",
      'legalLinks': 'Legal',
      'sectionAbout': 'About',
      'exportData': 'Export data',
      'exportDataSubtitle': 'Share a JSON copy of your local check-ins',
      'exportFailed': 'Could not export data.',
      'edit': 'Edit',
      'deleteCheckIn': 'Delete check-in',
      'deleteCheckInConfirm': 'Delete this day\'s check-in? This cannot be undone.',
      'checkInDeleted': 'Check-in deleted.',
      'noteTooLong': 'Note is too long (max 500 characters).',
      'retry': 'Retry',
      'youAreCurrentlyOffline': 'You\'re currently offline',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'Looks like your connection is interrupted. Check your network connection and try again.',
      'failedToOpenBrowserPleaseTryAgain': 'Failed to open browser. Please try again.',
      'downloadNow': 'Download now',
    },
    'vi': {
      'appTagline': 'Một lời hỏi thăm nhỏ mỗi ngày',
      'skip': 'Bỏ qua',
      'continueAction': 'Tiếp tục',
      'getStarted': 'Bắt đầu',
      'cancel': 'Hủy',
      'delete': 'Xóa',
      'save': 'Lưu',
      'later': 'Để sau',
      'update': 'Cập nhật',
      'openSettings': 'Mở Cài đặt',
      'openBrowser': 'Mở trình duyệt',
      'yourAppIsOutdated': 'Ứng dụng đã cũ. Vui lòng cập nhật để tiếp tục.',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'Phiên bản ứng dụng không còn được hỗ trợ. Bạn đang bỏ lỡ các tính năng và cải tiến mới.',
      'navHome': 'Trang chủ',
      'navHistory': 'Lịch sử',
      'navSettings': 'Cài đặt',
      'today': 'Hôm nay',
      'greetingFallback': 'Chào bạn. Mong mọi thứ ổn với bạn.',
      'checkInToday': 'Check-in hôm nay',
      'howAreYouFeeling': 'Hôm nay bạn cảm thấy thế nào?',
      'checkInCta': 'Check-in hôm nay',
      'onboard1Title': 'Một khoảng dừng nhỏ mỗi ngày',
      'onboard1Body': 'Không cần phải luôn ổn. Bạn có thể chia sẻ theo cách của mình.',
      'onboard2Title': 'Lời chào & check-in riêng tư',
      'onboard2Body': 'Một lời hỏi thăm nhẹ nhàng và chỗ ghi nhận cảm xúc chỉ dành cho bạn.',
      'onboard3Title': 'Dữ liệu ở trên thiết bị của bạn',
      'onboard3Body': 'Không tài khoản, không đám mây bắt buộc. Bạn kiểm soát hoàn toàn.',
      'checkInTitle': 'Check-in',
      'howAreYouFeelingToday': 'Hôm nay bạn cảm thấy thế nào?',
      'chooseClosest': 'Bạn có thể chọn điều gần với mình nhất.',
      'noteOptional': 'Ghi chú (không bắt buộc)',
      'noteHint': 'Bạn muốn ghi lại điều gì hôm nay?',
      'saveFailed': 'Không lưu được. Bạn thử lại nhé.',
      'statusOk': 'Ổn',
      'statusShare': 'Muốn chia sẻ',
      'statusSelfCare': 'Cần tự chăm sóc',
      'thankYouCheckIn': 'Cảm ơn bạn đã dành\nmột chút thời gian cho mình.',
      'backHome': 'Về trang chủ',
      'viewHistory': 'Xem lịch sử',
      'historyTitle': 'Lịch sử',
      'labelDays': 'Ngày',
      'labelOk': 'Ổn',
      'labelShare': 'Chia sẻ',
      'labelSelfCare': 'Tự chăm',
      'historyEmpty': 'Chưa có ghi nhận trong tháng này.\nBạn có thể bắt đầu bất cứ khi nào.',
      'settingsTitle': 'Cài đặt',
      'sectionReminder': 'Nhắc nhở',
      'sectionGreeting': 'Lời chào',
      'sectionPremium': 'Premium',
      'sectionData': 'Dữ liệu',
      'enableCheckInReminder': 'Bật nhắc check-in',
      'reminderAt': 'Nhắc vào {time} mỗi ngày',
      'reminderOff': 'Tắt',
      'reminderTime': 'Giờ nhắc',
      'useAiGreeting': 'Dùng lời chào AI',
      'useAiGreetingSubtitle': 'Tắt để luôn dùng lời chào có sẵn',
      'removeAdsPremium': 'Gỡ quảng cáo / Premium',
      'premiumActive': 'Đang hoạt động',
      'upgradeToRemoveAds': 'Nâng cấp để bỏ quảng cáo',
      'deleteAllData': 'Xóa toàn bộ dữ liệu',
      'deleteAllDataConfirm': 'Xóa toàn bộ dữ liệu trên thiết bị này? Thao tác này không thể hoàn tác.',
      'dataDeleted': 'Đã xóa toàn bộ dữ liệu.',
      'needNotificationPermission': 'Cần quyền thông báo để nhắc bạn. Bạn có thể bật trong Cài đặt hệ thống.',
      'dataStaysOnDevice': "Still Here • Dữ liệu được lưu cục bộ",
      'premium': 'Premium',
      'youArePremium': 'Bạn đang dùng Premium',
      'adFreeExperience': 'Trải nghiệm không quảng cáo',
      'premiumThanks': 'Cảm ơn bạn đã hỗ trợ StillHere. Quảng cáo đã được gỡ.',
      'premiumSupportDesc': 'Gỡ toàn bộ quảng cáo và hỗ trợ phát triển StillHere.',
      'benefitNoAds': 'Không còn banner & interstitial',
      'benefitAiPriority': 'Ưu tiên lời chào AI',
      'benefitSupportDev': 'Hỗ trợ đội ngũ phát triển',
      'premiumActiveOnDevice': 'Premium đang hoạt động trên thiết bị này.',
      'iapUnavailable': 'Mua hàng trong ứng dụng tạm thời chưa khả dụng.',
      'loadingPlans': 'Đang tải gói đăng ký…',
      'upgradePremium': 'Nâng cấp Premium',
      'restorePurchases': 'Khôi phục mua hàng',
      'purchaseSuccess': 'Đã nâng cấp Premium. Cảm ơn bạn!',
      'purchaseIncomplete': 'Giao dịch chưa hoàn tất. Thử lại hoặc khôi phục mua hàng.',
      'purchaseFailed': 'Không thể mua: {error}',
      'restoreSuccess': 'Đã khôi phục Premium thành công.',
      'restoreEmpty': 'Không tìm thấy giao dịch trước đó.',
      'restoreFailed': 'Khôi phục thất bại: {error}',
      'morning': 'Buổi sáng',
      'afternoon': 'Buổi chiều',
      'evening': 'Buổi tối',
      'language': 'Ngôn ngữ',
      'theme': 'Giao diện',
      'themeLight': 'Sáng',
      'themeDark': 'Tối',
      'themeSystem': 'Hệ thống',
      'aboutTitle': 'Giới thiệu & Riêng tư',
      'privacyBody': "Check-in và ghi chú được lưu cục bộ trong ứng dụng. Still Here không yêu cầu tài khoản. Chúng tôi không gửi ghi chú hoặc trạng thái cảm xúc đến hệ thống phân tích. Tùy cài đặt sao lưu của hệ điều hành, dữ liệu ứng dụng có thể được đưa vào bản sao lưu thiết bị. Bạn có thể xuất hoặc xóa dữ liệu trong Cài đặt.",
      'aboutAiNote': "Lời chào AI là tùy chọn. Khi AI được cấu hình và bật, ứng dụng chỉ gửi prompt giới hạn để tạo lời chào; ghi chú check-in và trạng thái cảm xúc không được gửi đi. Nếu AI chưa được cấu hình hoặc không khả dụng, ứng dụng sử dụng lời chào tĩnh lưu sẵn.",
      'legalLinks': 'Pháp lý',
      'sectionAbout': 'Giới thiệu',
      'exportData': 'Xuất dữ liệu',
      'exportDataSubtitle': 'Chia sẻ bản JSON các check-in trên máy',
      'exportFailed': 'Không xuất được dữ liệu.',
      'edit': 'Sửa',
      'deleteCheckIn': 'Xóa check-in',
      'deleteCheckInConfirm': 'Xóa check-in ngày này? Không thể hoàn tác.',
      'checkInDeleted': 'Đã xóa check-in.',
      'noteTooLong': 'Ghi chú quá dài (tối đa 500 ký tự).',
      'retry': 'Thử lại',
      'youAreCurrentlyOffline': 'Bạn đang ngoại tuyến',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'Có vẻ kết nối của bạn bị gián đoạn. Kiểm tra mạng và thử lại.',
      'failedToOpenBrowserPleaseTryAgain': 'Không mở được trình duyệt. Vui lòng thử lại.',
      'downloadNow': 'Tải ngay',
    },
    'th': {
      'appTagline': 'คำทักทายเล็ก ๆ ในทุกวัน',
      'skip': 'ข้าม',
      'continueAction': 'ต่อไป',
      'getStarted': 'เริ่มต้น',
      'cancel': 'ยกเลิก',
      'delete': 'ลบ',
      'save': 'บันทึก',
      'later': 'ไว้ทีหลัง',
      'update': 'อัปเดต',
      'openSettings': 'เปิดการตั้งค่า',
      'openBrowser': 'เปิดในเบราว์เซอร์',
      'yourAppIsOutdated': 'แอปเวอร์ชันเก่า กรุณาอัปเดตเพื่อใช้งานต่อ',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'เวอร์ชันแอปไม่รองรับอีกต่อไป คุณกำลังพลาดฟีเจอร์และการปรับปรุงใหม่ ๆ',
      'navHome': 'หน้าหลัก',
      'navHistory': 'ประวัติ',
      'navSettings': 'ตั้งค่า',
      'today': 'วันนี้',
      'greetingFallback': 'สวัสดี ขอให้ทุกอย่างราบรื่นนะ',
      'checkInToday': 'เช็คอินวันนี้',
      'howAreYouFeeling': 'วันนี้คุณรู้สึกอย่างไร?',
      'checkInCta': 'เช็คอินวันนี้',
      'onboard1Title': 'หยุดพักเล็ก ๆ ในทุกวัน',
      'onboard1Body': 'ไม่จำเป็นต้องโอเคเสมอ คุณแชร์ได้ในแบบของคุณ',
      'onboard2Title': 'คำทักทายและเช็คอินส่วนตัว',
      'onboard2Body': 'คำทักทายอ่อนโยนและที่จดความรู้สึก เฉพาะคุณ',
      'onboard3Title': 'ข้อมูลอยู่บนอุปกรณ์ของคุณ',
      'onboard3Body': 'ไม่มีบัญชี ไม่บังคับคลาวด์ คุณควบคุมทั้งหมด',
      'checkInTitle': 'เช็คอิน',
      'howAreYouFeelingToday': 'วันนี้คุณรู้สึกอย่างไร?',
      'chooseClosest': 'เลือกสิ่งที่ใกล้เคียงกับคุณที่สุด',
      'noteOptional': 'บันทึก (ไม่บังคับ)',
      'noteHint': 'อยากจดอะไรไว้วันนี้ไหม?',
      'saveFailed': 'บันทึกไม่ได้ ลองอีกครั้งนะ',
      'statusOk': 'โอเค',
      'statusShare': 'อยากแบ่งปัน',
      'statusSelfCare': 'ต้องการดูแลตัวเอง',
      'thankYouCheckIn': 'ขอบคุณที่ให้เวลา\nกับตัวเองสักนิด',
      'backHome': 'กลับหน้าหลัก',
      'viewHistory': 'ดูประวัติ',
      'historyTitle': 'ประวัติ',
      'labelDays': 'วัน',
      'labelOk': 'โอเค',
      'labelShare': 'แบ่งปัน',
      'labelSelfCare': 'ดูแลตัวเอง',
      'historyEmpty': 'ยังไม่มีบันทึกในเดือนนี้\nเริ่มเมื่อไหร่ก็ได้',
      'settingsTitle': 'ตั้งค่า',
      'sectionReminder': 'การแจ้งเตือน',
      'sectionGreeting': 'คำทักทาย',
      'sectionPremium': 'พรีเมียม',
      'sectionData': 'ข้อมูล',
      'enableCheckInReminder': 'เปิดการเตือนเช็คอิน',
      'reminderAt': 'เตือนเวลา {time} ทุกวัน',
      'reminderOff': 'ปิด',
      'reminderTime': 'เวลาเตือน',
      'useAiGreeting': 'ใช้คำทักทาย AI',
      'useAiGreetingSubtitle': 'ปิดเพื่อใช้คำทักทายในเครื่องเสมอ',
      'removeAdsPremium': 'ปิดโฆษณา / พรีเมียม',
      'premiumActive': 'ใช้งานอยู่',
      'upgradeToRemoveAds': 'อัปเกรดเพื่อปิดโฆษณา',
      'deleteAllData': 'ลบข้อมูลทั้งหมด',
      'deleteAllDataConfirm': 'ลบข้อมูลทั้งหมดบนอุปกรณ์นี้? ไม่สามารถย้อนกลับได้',
      'dataDeleted': 'ลบข้อมูลทั้งหมดแล้ว',
      'needNotificationPermission': 'ต้องอนุญาตการแจ้งเตือน คุณเปิดได้ในการตั้งค่าระบบ',
      'dataStaysOnDevice': "Still Here • จัดเก็บข้อมูลไว้ในแอป",
      'premium': 'พรีเมียม',
      'youArePremium': 'คุณใช้พรีเมียมอยู่',
      'adFreeExperience': 'ประสบการณ์ไม่มีโฆษณา',
      'premiumThanks': 'ขอบคุณที่สนับสนุน StillHere โฆษณาถูกลบแล้ว',
      'premiumSupportDesc': 'ลบโฆษณาทั้งหมดและสนับสนุนการพัฒนา StillHere',
      'benefitNoAds': 'ไม่มีแบนเนอร์และโฆษณาคั่น',
      'benefitAiPriority': 'คำทักทาย AI ลำดับแรก',
      'benefitSupportDev': 'สนับสนุนทีมพัฒนา',
      'premiumActiveOnDevice': 'พรีเมียมเปิดใช้งานบนอุปกรณ์นี้',
      'iapUnavailable': 'การซื้อในแอปยังไม่พร้อมใช้งานชั่วคราว',
      'loadingPlans': 'กำลังโหลดแพ็กเกจ…',
      'upgradePremium': 'อัปเกรดพรีเมียม',
      'restorePurchases': 'กู้คืนการซื้อ',
      'purchaseSuccess': 'อัปเกรดพรีเมียมแล้ว ขอบคุณ!',
      'purchaseIncomplete': 'การซื้อยังไม่เสร็จ ลองใหม่หรือกู้คืนการซื้อ',
      'purchaseFailed': 'ซื้อไม่สำเร็จ: {error}',
      'restoreSuccess': 'กู้คืนพรีเมียมสำเร็จ',
      'restoreEmpty': 'ไม่พบการซื้อก่อนหน้า',
      'restoreFailed': 'กู้คืนล้มเหลว: {error}',
      'morning': 'ช่วงเช้า',
      'afternoon': 'ช่วงบ่าย',
      'evening': 'ช่วงเย็น',
      'language': 'ภาษา',
      'theme': 'ธีม',
      'themeLight': 'สว่าง',
      'themeDark': 'มืด',
      'themeSystem': 'ระบบ',
      'aboutTitle': 'เกี่ยวกับ & ความเป็นส่วนตัว',
      'privacyBody': "การเช็กอินและบันทึกจะถูกจัดเก็บไว้ภายในแอป Still Here ไม่จำเป็นต้องมีบัญชี เราจะไม่ส่งบันทึกหรือสถานะอารมณ์ของคุณไปยังระบบวิเคราะห์ ทั้งนี้ข้อมูลแอปอาจถูกรวมไว้ในการสำรองข้อมูลของอุปกรณ์ ขึ้นอยู่กับการตั้งค่าการสำรองข้อมูลของระบบปฏิบัติการ คุณสามารถส่งออกหรือลบข้อมูลได้ในการตั้งค่า",
      'aboutAiNote': "คำทักทาย AI เป็นตัวเลือกเสริม เมื่อมีการกำหนดค่าและเปิดใช้ AI แอปจะส่งเฉพาะพรอมต์ที่จำกัดเพื่อสร้างคำทักทาย โดยไม่รวมบันทึกการเช็กอินหรือสถานะอารมณ์ หาก AI ยังไม่ได้กำหนดค่าหรือไม่พร้อมใช้งาน แอปจะใช้คำทักทายแบบคงที่ที่จัดเก็บไว้ในเครื่อง",
      'legalLinks': 'กฎหมาย',
      'sectionAbout': 'เกี่ยวกับ',
      'exportData': 'ส่งออกข้อมูล',
      'exportDataSubtitle': 'แชร์ไฟล์ JSON ของเช็คอินในเครื่อง',
      'exportFailed': 'ส่งออกข้อมูลไม่สำเร็จ',
      'edit': 'แก้ไข',
      'deleteCheckIn': 'ลบเช็คอิน',
      'deleteCheckInConfirm': 'ลบเช็คอินของวันนี้? ไม่สามารถย้อนกลับได้',
      'checkInDeleted': 'ลบเช็คอินแล้ว',
      'noteTooLong': 'บันทึกยาวเกินไป (สูงสุด 500 ตัวอักษร)',
      'retry': 'ลองอีกครั้ง',
      'youAreCurrentlyOffline': 'คุณออฟไลน์อยู่',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'ดูเหมือนการเชื่อมต่อถูกขัดจังหวะ ตรวจสอบเครือข่ายแล้วลองอีกครั้ง',
      'failedToOpenBrowserPleaseTryAgain': 'เปิดเบราว์เซอร์ไม่สำเร็จ กรุณาลองอีกครั้ง',
      'downloadNow': 'ดาวน์โหลดเลย',
    },
    'zh': {
      'appTagline': '每天一句小小的问候',
      'skip': '跳过',
      'continueAction': '继续',
      'getStarted': '开始',
      'cancel': '取消',
      'delete': '删除',
      'save': '保存',
      'later': '稍后再说',
      'update': '更新',
      'openSettings': '打开设置',
      'openBrowser': '在浏览器中打开',
      'yourAppIsOutdated': '应用版本过旧，请更新后继续使用。',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': '您的应用版本已不再受支持。您正在错过新功能和改进。',
      'navHome': '首页',
      'navHistory': '历史',
      'navSettings': '设置',
      'today': '今天',
      'greetingFallback': '你好。希望你一切都好。',
      'checkInToday': '今日打卡',
      'howAreYouFeeling': '今天感觉怎么样？',
      'checkInCta': '今日打卡',
      'onboard1Title': '每天一个小小停顿',
      'onboard1Body': '不必总是很好。你可以按自己的方式分享。',
      'onboard2Title': '私密问候与打卡',
      'onboard2Body': '一句温柔的问候，和一个只属于你的情绪记录处。',
      'onboard3Title': '数据保存在你的设备上',
      'onboard3Body': '无需账号，无需强制云端。完全由你掌控。',
      'checkInTitle': '打卡',
      'howAreYouFeelingToday': '今天感觉怎么样？',
      'chooseClosest': '选择最接近你此刻的状态。',
      'noteOptional': '备注（可选）',
      'noteHint': '今天想记下什么吗？',
      'saveFailed': '保存失败，请再试一次。',
      'statusOk': '还好',
      'statusShare': '想分享',
      'statusSelfCare': '需要自我关照',
      'thankYouCheckIn': '谢谢你为自己\n留出一点时间。',
      'backHome': '返回首页',
      'viewHistory': '查看历史',
      'historyTitle': '历史',
      'labelDays': '天数',
      'labelOk': '还好',
      'labelShare': '分享',
      'labelSelfCare': '自我关照',
      'historyEmpty': '本月还没有记录。\n随时可以开始。',
      'settingsTitle': '设置',
      'sectionReminder': '提醒',
      'sectionGreeting': '问候',
      'sectionPremium': '高级版',
      'sectionData': '数据',
      'enableCheckInReminder': '开启打卡提醒',
      'reminderAt': '每天 {time} 提醒',
      'reminderOff': '关闭',
      'reminderTime': '提醒时间',
      'useAiGreeting': '使用 AI 问候',
      'useAiGreetingSubtitle': '关闭后始终使用本地问候',
      'removeAdsPremium': '去除广告 / 高级版',
      'premiumActive': '已开通',
      'upgradeToRemoveAds': '升级以去除广告',
      'deleteAllData': '删除全部数据',
      'deleteAllDataConfirm': '删除此设备上的全部数据？此操作无法撤销。',
      'dataDeleted': '已删除全部数据。',
      'needNotificationPermission': '需要通知权限才能提醒你。可在系统设置中开启。',
      'dataStaysOnDevice': "Still Here • 数据在应用内本地保存",
      'premium': '高级版',
      'youArePremium': '你正在使用高级版',
      'adFreeExperience': '无广告体验',
      'premiumThanks': '感谢支持 StillHere。广告已去除。',
      'premiumSupportDesc': '去除全部广告并支持 StillHere 开发。',
      'benefitNoAds': '不再显示横幅与插屏广告',
      'benefitAiPriority': '优先 AI 问候',
      'benefitSupportDev': '支持开发团队',
      'premiumActiveOnDevice': '本设备已开通高级版。',
      'iapUnavailable': '应用内购买暂时不可用。',
      'loadingPlans': '正在加载套餐…',
      'upgradePremium': '升级高级版',
      'restorePurchases': '恢复购买',
      'purchaseSuccess': '已升级高级版。谢谢你！',
      'purchaseIncomplete': '购买未完成。请重试或恢复购买。',
      'purchaseFailed': '无法购买：{error}',
      'restoreSuccess': '已成功恢复高级版。',
      'restoreEmpty': '未找到之前的购买记录。',
      'restoreFailed': '恢复失败：{error}',
      'morning': '早上',
      'afternoon': '下午',
      'evening': '晚上',
      'language': '语言',
      'theme': '主题',
      'themeLight': '浅色',
      'themeDark': '深色',
      'themeSystem': '跟随系统',
      'aboutTitle': '关于与隐私',
      'privacyBody': "签到和备注保存在应用本地。Still Here 无需账户。我们不会将你的备注或情绪状态发送到分析系统。根据操作系统的备份设置，应用数据可能会包含在设备备份中。你可以在设置中导出或删除数据。",
      'aboutAiNote': "AI 问候为可选功能。配置并启用 AI 后，应用只会发送有限的提示内容来生成问候，不会包含签到备注或情绪状态。如果 AI 尚未配置或不可用，应用会使用本地静态问候语。",
      'legalLinks': '法律信息',
      'sectionAbout': '关于',
      'exportData': '导出数据',
      'exportDataSubtitle': '分享本地打卡记录的 JSON 副本',
      'exportFailed': '无法导出数据。',
      'edit': '编辑',
      'deleteCheckIn': '删除打卡',
      'deleteCheckInConfirm': '删除这一天的打卡？此操作无法撤销。',
      'checkInDeleted': '已删除打卡。',
      'noteTooLong': '备注过长（最多 500 字）。',
      'retry': '重试',
      'youAreCurrentlyOffline': '您当前处于离线状态',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': '看起来您的网络连接已中断。请检查网络后重试。',
      'failedToOpenBrowserPleaseTryAgain': '无法打开浏览器，请重试。',
      'downloadNow': '立即下载',
    },
  };
  String _t(String key) {
    final map = _maps[localeName] ?? _maps['en']!;
    return map[key] ?? _maps['en']![key] ?? key;
  }
  String _tp(String key, Map<String, String> params) {
    var s = _t(key);
    params.forEach((k, v) => s = s.replaceAll('{$k}', v));
    return s;
  }
  String get appTagline => _t('appTagline');
  String get skip => _t('skip');
  String get continueAction => _t('continueAction');
  String get getStarted => _t('getStarted');
  String get cancel => _t('cancel');
  String get delete => _t('delete');
  String get save => _t('save');
  String get later => _t('later');
  String get update => _t('update');
  String get openSettings => _t('openSettings');
  String get openBrowser => _t('openBrowser');
  String get yourAppIsOutdated => _t('yourAppIsOutdated');
  String get yourAppVersionIsNoLongerSupportedYoureMissingOut => _t('yourAppVersionIsNoLongerSupportedYoureMissingOut');
  String get navHome => _t('navHome');
  String get navHistory => _t('navHistory');
  String get navSettings => _t('navSettings');
  String get today => _t('today');
  String get greetingFallback => _t('greetingFallback');
  String get checkInToday => _t('checkInToday');
  String get howAreYouFeeling => _t('howAreYouFeeling');
  String get checkInCta => _t('checkInCta');
  String get onboard1Title => _t('onboard1Title');
  String get onboard1Body => _t('onboard1Body');
  String get onboard2Title => _t('onboard2Title');
  String get onboard2Body => _t('onboard2Body');
  String get onboard3Title => _t('onboard3Title');
  String get onboard3Body => _t('onboard3Body');
  String get checkInTitle => _t('checkInTitle');
  String get howAreYouFeelingToday => _t('howAreYouFeelingToday');
  String get chooseClosest => _t('chooseClosest');
  String get noteOptional => _t('noteOptional');
  String get noteHint => _t('noteHint');
  String get saveFailed => _t('saveFailed');
  String get statusOk => _t('statusOk');
  String get statusShare => _t('statusShare');
  String get statusSelfCare => _t('statusSelfCare');
  String get thankYouCheckIn => _t('thankYouCheckIn');
  String get backHome => _t('backHome');
  String get viewHistory => _t('viewHistory');
  String get historyTitle => _t('historyTitle');
  String get labelDays => _t('labelDays');
  String get labelOk => _t('labelOk');
  String get labelShare => _t('labelShare');
  String get labelSelfCare => _t('labelSelfCare');
  String get historyEmpty => _t('historyEmpty');
  String get settingsTitle => _t('settingsTitle');
  String get sectionReminder => _t('sectionReminder');
  String get sectionGreeting => _t('sectionGreeting');
  String get sectionPremium => _t('sectionPremium');
  String get sectionData => _t('sectionData');
  String get enableCheckInReminder => _t('enableCheckInReminder');
  String reminderAt(String time) => _tp('reminderAt', {'time': time});
  String get reminderOff => _t('reminderOff');
  String get reminderTime => _t('reminderTime');
  String get useAiGreeting => _t('useAiGreeting');
  String get useAiGreetingSubtitle => _t('useAiGreetingSubtitle');
  String get removeAdsPremium => _t('removeAdsPremium');
  String get premiumActive => _t('premiumActive');
  String get upgradeToRemoveAds => _t('upgradeToRemoveAds');
  String get deleteAllData => _t('deleteAllData');
  String get deleteAllDataConfirm => _t('deleteAllDataConfirm');
  String get dataDeleted => _t('dataDeleted');
  String get needNotificationPermission => _t('needNotificationPermission');
  String get dataStaysOnDevice => _t('dataStaysOnDevice');
  String get premium => _t('premium');
  String get youArePremium => _t('youArePremium');
  String get adFreeExperience => _t('adFreeExperience');
  String get premiumThanks => _t('premiumThanks');
  String get premiumSupportDesc => _t('premiumSupportDesc');
  String get benefitNoAds => _t('benefitNoAds');
  String get benefitAiPriority => _t('benefitAiPriority');
  String get benefitSupportDev => _t('benefitSupportDev');
  String get premiumActiveOnDevice => _t('premiumActiveOnDevice');
  String get iapUnavailable => _t('iapUnavailable');
  String get loadingPlans => _t('loadingPlans');
  String get upgradePremium => _t('upgradePremium');
  String get restorePurchases => _t('restorePurchases');
  String get purchaseSuccess => _t('purchaseSuccess');
  String get purchaseIncomplete => _t('purchaseIncomplete');
  String purchaseFailed(String error) => _tp('purchaseFailed', {'error': error});
  String get restoreSuccess => _t('restoreSuccess');
  String get restoreEmpty => _t('restoreEmpty');
  String restoreFailed(String error) => _tp('restoreFailed', {'error': error});
  String get morning => _t('morning');
  String get afternoon => _t('afternoon');
  String get evening => _t('evening');
  String get language => _t('language');
  String get theme => _t('theme');
  String get themeLight => _t('themeLight');
  String get themeDark => _t('themeDark');
  String get themeSystem => _t('themeSystem');
  String get aboutTitle => _t('aboutTitle');
  String get privacyBody => _t('privacyBody');
  String get aboutAiNote => _t('aboutAiNote');
  String get legalLinks => _t('legalLinks');
  String get sectionAbout => _t('sectionAbout');
  String get exportData => _t('exportData');
  String get exportDataSubtitle => _t('exportDataSubtitle');
  String get exportFailed => _t('exportFailed');
  String get edit => _t('edit');
  String get deleteCheckIn => _t('deleteCheckIn');
  String get deleteCheckInConfirm => _t('deleteCheckInConfirm');
  String get checkInDeleted => _t('checkInDeleted');
  String get noteTooLong => _t('noteTooLong');
  String get retry => _t('retry');
  String get youAreCurrentlyOffline => _t('youAreCurrentlyOffline');
  String get looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd => _t('looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd');
  String get failedToOpenBrowserPleaseTryAgain => _t('failedToOpenBrowserPleaseTryAgain');
  String get downloadNow => _t('downloadNow');
}
class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();
  List<Locale> get supportedLocales => const [Locale('en'), Locale('vi'), Locale('th'), Locale('zh')];
  @override bool isSupported(Locale locale) => ['en','vi','th','zh'].contains(locale.languageCode);
  @override Future<S> load(Locale locale) => S.load(locale);
  @override bool shouldReload(covariant LocalizationsDelegate<S> old) => false;
}
