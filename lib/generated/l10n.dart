// GENERATED for StillHere — valid Dart string maps (escaped \n)
import 'package:flutter/material.dart';

class S {
  S(this.localeName);
  final String localeName;
  static S? _current;
  static S get current {
    assert(_current != null);
    return _current!;
  }

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
      'aboutAiNote': 'AI greetings are optional. When AI is configured and enabled, a limited prompt is sent to generate a greeting; check-in notes and mood entries are never included. If AI is unavailable or not configured, the app uses local static greetings.',
      'aboutTitle': 'About & Privacy',
      'adFreeExperience': 'Ad-free experience',
      'afternoon': 'Afternoon',
      'allowAiGreeting': 'Allow AI greetings',
      'appTagline': 'A little space for you',
      'backHome': 'Back to home',
      'benefitAiPriority': 'Priority AI greetings',
      'benefitNoAds': 'No more banners & interstitials',
      'benefitSupportDev': 'Support the development team',
      'cancel': 'Cancel',
      'checkInCta': 'Check in today',
      'checkInDeleted': 'Check-in deleted.',
      'checkInTitle': 'Check-in',
      'checkInToday': 'Today\'s check-in',
      'chooseClosest': 'Pick what feels closest to you.',
      'continueAction': 'Continue',
      'dailyReminder': 'Daily reminder',
      'dataDeleted': 'All data has been deleted.',
      'dataStaysOnDevice': 'Still Here • Data is stored locally',
      'daysCheckedInPeriod': 'days checked in\nthis period',
      'delete': 'Delete',
      'deleteAllData': 'Delete all data',
      'deleteAllDataConfirm': 'Delete all data on this device? This cannot be undone.',
      'deleteCheckIn': 'Delete check-in',
      'deleteCheckInConfirm': 'Delete this day\'s check-in? This cannot be undone.',
      'doingGreat': 'You\'re doing great 💚',
      'downloadNow': 'Download now',
      'edit': 'Edit',
      'enableCheckInReminder': 'Enable check-in reminder',
      'enoughQuote': '"This is already enough."',
      'evening': 'Evening',
      'exportData': 'Export data',
      'exportDataSubtitle': 'Share a JSON copy of your local check-ins',
      'exportFailed': 'Could not export data.',
      'failedToOpenBrowserPleaseTryAgain': 'Failed to open browser. Please try again.',
      'getStarted': 'Get started',
      'goBack': 'Back',
      'greetingFallback': 'Hello. Hope everything is going okay for you.',
      'headlineAfternoon': 'The afternoon\nunfolds ✨',
      'headlineEvening': 'Evening is here.\nYou are enough ✨',
      'headlineMorning': 'A new morning\nis beginning ✨',
      'headlineNoon': 'The middle of\nthe day ✨',
      'helloAfternoon': 'Good afternoon,',
      'helloEvening': 'Good evening,',
      'helloMorning': 'Good morning,',
      'historyEmpty': 'No entries this month yet.\nYou can start whenever you\'re ready.',
      'historyTitle': 'Journal',
      'howAreYouFeeling': 'How are you feeling today?',
      'howAreYouFeelingTitle': 'How are you\nfeeling today?',
      'howAreYouFeelingToday': 'How are you feeling today?',
      'iapUnavailable': 'In-app purchases are temporarily unavailable.',
      'journalSubtitle': 'Your days, your real feelings.',
      'labelDays': 'Days',
      'labelOk': 'Okay',
      'labelSelfCare': 'Self-care',
      'labelShare': 'Share',
      'language': 'Language',
      'later': 'Later',
      'legalLinks': 'Legal',
      'loadingPlans': 'Loading plans…',
      'lookBackJourney': 'Look back on your journey',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'Looks like your connection is interrupted. Check your network connection and try again.',
      'monthLabel': 'Month {month}, {year}',
      'moodDistribution': 'Mood distribution',
      'morning': 'Morning',
      'navHistory': 'Journal',
      'navHome': 'Home',
      'navJournal': 'Journal',
      'navSettings': 'Settings',
      'navStats': 'Insights',
      'needNotificationPermission': 'Notification permission is needed for reminders. You can enable it in system Settings.',
      'noRightOrWrong': 'There is no right or wrong answer.\nChoose what feels closest to you.',
      'noteHint': 'Anything you\'d like to note today?',
      'noteHintPersonal': 'A few lines for yourself…',
      'noteOptional': 'Note (optional)',
      'noteTooLong': 'Note is too long (max 500 characters).',
      'onboard1Body': 'You don\'t always have to be fine. You can share in your own way.',
      'onboard1Title': 'A small pause each day',
      'onboard2Body': 'A gentle hello and a place to note how you feel — just for you.',
      'onboard2Title': 'Private greeting & check-in',
      'onboard3Body': 'No account, no required cloud. You\'re fully in control.',
      'onboard3Title': 'Your data stays on your device',
      'openBrowser': 'Open in browser',
      'openSettings': 'Open Settings',
      'premium': 'Premium',
      'premiumActive': 'Active',
      'premiumActiveOnDevice': 'Premium is active on this device.',
      'premiumSupportDesc': 'Remove all ads and support StillHere development.',
      'premiumThanks': 'Thanks for supporting StillHere. Ads have been removed.',
      'presenceRate': 'Presence rate',
      'privacy': 'Privacy',
      'privacyBody': 'Check-ins and notes are stored locally in the app. Still Here does not require an account. We do not send your notes or mood status to analytics. Depending on your operating-system backup settings, app data may be included in device backups. You can export or delete data in Settings.',
      'purchaseFailed': 'Could not purchase: {error}',
      'purchaseIncomplete': 'Purchase not completed. Try again or restore purchases.',
      'purchaseSuccess': 'Premium unlocked. Thank you!',
      'recentEntries': 'Recent entries',
      'reminderAt': 'Remind at {time} every day',
      'reminderOff': 'Off',
      'reminderTime': 'Reminder time',
      'removeAdsPremium': 'Remove ads / Premium',
      'restoreEmpty': 'No previous purchases found.',
      'restoreFailed': 'Restore failed: {error}',
      'restorePurchases': 'Restore purchases',
      'restoreSuccess': 'Premium restored successfully.',
      'retry': 'Retry',
      'save': 'Save',
      'saveFailed': 'Couldn\'t save. Please try again.',
      'saveForMyself': 'Save for myself',
      'sectionAbout': 'About',
      'sectionData': 'Data',
      'sectionGreeting': 'Greeting',
      'sectionPremium': 'Premium',
      'sectionReminder': 'Reminders',
      'segmentMonth': 'Month',
      'segmentWeek': 'Week',
      'segmentYear': 'Year',
      'selfCareMessage': 'You are taking care of yourself beautifully',
      'settingsSubtitle': 'A little corner of your own.',
      'settingsTitle': 'Settings',
      'skip': 'Skip',
      'splashTagline': 'A little space for you',
      'statusOk': 'Okay',
      'statusOkSubtitle': 'And that is enough.',
      'statusOkTitle': 'I\'m okay.',
      'statusSelfCare': 'Need self-care',
      'statusSelfCareSubtitle': 'Gentle space for yourself.',
      'statusSelfCareTitle': 'I need a bit more care today.',
      'statusShare': 'Want to share',
      'statusShareSubtitle': 'Something to say to yourself.',
      'statusShareTitle': 'I want to share a little.',
      'thankYouCheckIn': 'Thank you for taking\na moment for yourself.',
      'thankYouForBeingHere': 'Thank you\nfor being here.',
      'thankYouMoment': 'Thank you for taking a moment\nfor yourself.',
      'theme': 'Theme',
      'themeDark': 'Dark',
      'themeLight': 'Light',
      'themeSystem': 'System',
      'today': 'Today',
      'todaysNote': 'Today\'s note',
      'update': 'Update',
      'upgradePremium': 'Upgrade to Premium',
      'upgradeToRemoveAds': 'Upgrade to remove ads',
      'useAiGreeting': 'Use AI greetings',
      'useAiGreetingSubtitle': 'Turn off to always use local greetings',
      'versionLabel': 'Version {version}',
      'viewHistory': 'View your journey',
      'viewJourney': 'View your journey',
      'writeMorePrompt': 'Would you like to write a little more?',
      'youAreCurrentlyOffline': 'You\'re currently offline',
      'youArePremium': 'You\'re on Premium',
      'yourAppIsOutdated': 'Your app is outdated. Please update to continue.',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'Your app version is no longer supported. You\'re missing out on new features and improvements.',
      'yourJournal': 'Your journal',
      'youreEnough': 'You\'re enough ♡',
    },
    'vi': {
      'aboutAiNote': 'Lời chào AI là tùy chọn. Khi AI được cấu hình và bật, ứng dụng chỉ gửi prompt giới hạn để tạo lời chào; ghi chú check-in và trạng thái cảm xúc không được gửi đi. Nếu AI chưa được cấu hình hoặc không khả dụng, ứng dụng sử dụng lời chào tĩnh lưu sẵn.',
      'aboutTitle': 'Giới thiệu & Riêng tư',
      'adFreeExperience': 'Trải nghiệm không quảng cáo',
      'afternoon': 'Buổi chiều',
      'allowAiGreeting': 'Cho phép lời chào AI',
      'appTagline': 'Một khoảng lặng dành cho bạn',
      'backHome': 'Trở về trang chủ',
      'benefitAiPriority': 'Ưu tiên lời chào AI',
      'benefitNoAds': 'Không còn banner & interstitial',
      'benefitSupportDev': 'Hỗ trợ đội ngũ phát triển',
      'cancel': 'Hủy',
      'checkInCta': 'Check-in hôm nay',
      'checkInDeleted': 'Đã xóa check-in.',
      'checkInTitle': 'Check-in',
      'checkInToday': 'Check-in hôm nay',
      'chooseClosest': 'Bạn có thể chọn điều gần với mình nhất.',
      'continueAction': 'Tiếp tục',
      'dailyReminder': 'Nhắc nhở mỗi ngày',
      'dataDeleted': 'Đã xóa toàn bộ dữ liệu.',
      'dataStaysOnDevice': 'Still Here • Dữ liệu được lưu cục bộ',
      'daysCheckedInPeriod': 'ngày đã check-in\ntrong kỳ này',
      'delete': 'Xóa',
      'deleteAllData': 'Xóa toàn bộ dữ liệu',
      'deleteAllDataConfirm': 'Xóa toàn bộ dữ liệu trên thiết bị này? Thao tác này không thể hoàn tác.',
      'deleteCheckIn': 'Xóa check-in',
      'deleteCheckInConfirm': 'Xóa check-in ngày này? Không thể hoàn tác.',
      'doingGreat': 'Bạn đã làm rất tốt 💚',
      'downloadNow': 'Tải ngay',
      'edit': 'Sửa',
      'enableCheckInReminder': 'Bật nhắc check-in',
      'enoughQuote': '“Như vậy cũng đã đủ rồi.”',
      'evening': 'Buổi tối',
      'exportData': 'Xuất dữ liệu',
      'exportDataSubtitle': 'Chia sẻ bản JSON các check-in trên máy',
      'exportFailed': 'Không xuất được dữ liệu.',
      'failedToOpenBrowserPleaseTryAgain': 'Không mở được trình duyệt. Vui lòng thử lại.',
      'getStarted': 'Bắt đầu',
      'goBack': 'Quay lại',
      'greetingFallback': 'Chào bạn. Mong mọi thứ ổn với bạn.',
      'headlineAfternoon': 'Buổi chiều\nvẫn còn dư âm ✨',
      'headlineEvening': 'Buổi tối\nêm đềm ✨',
      'headlineMorning': 'Một buổi sáng\nmới bắt đầu ✨',
      'headlineNoon': 'Giữa ngày\nnhẹ nhàng ✨',
      'helloAfternoon': 'Chào buổi chiều,',
      'helloEvening': 'Chào buổi tối,',
      'helloMorning': 'Chào buổi sáng,',
      'historyEmpty': 'Chưa có ghi nhận trong tháng này.\nBạn có thể bắt đầu bất cứ khi nào.',
      'historyTitle': 'Nhật ký',
      'howAreYouFeeling': 'Hôm nay bạn cảm thấy thế nào?',
      'howAreYouFeelingTitle': 'Hôm nay,\nbạn cảm thấy thế nào?',
      'howAreYouFeelingToday': 'Hôm nay bạn cảm thấy thế nào?',
      'iapUnavailable': 'Mua hàng trong ứng dụng tạm thời chưa khả dụng.',
      'journalSubtitle': 'Những ngày của bạn, những cảm xúc thật.',
      'labelDays': 'Ngày',
      'labelOk': 'Ổn',
      'labelSelfCare': 'Tự chăm',
      'labelShare': 'Chia sẻ',
      'language': 'Ngôn ngữ',
      'later': 'Để sau',
      'legalLinks': 'Pháp lý',
      'loadingPlans': 'Đang tải gói đăng ký…',
      'lookBackJourney': 'Nhìn lại hành trình',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'Có vẻ kết nối của bạn bị gián đoạn. Kiểm tra mạng và thử lại.',
      'monthLabel': 'Tháng {month}, {year}',
      'moodDistribution': 'Phân bố cảm xúc',
      'morning': 'Buổi sáng',
      'navHistory': 'Nhật ký',
      'navHome': 'Trang chủ',
      'navJournal': 'Nhật ký',
      'navSettings': 'Cài đặt',
      'navStats': 'Thống kê',
      'needNotificationPermission': 'Cần quyền thông báo để nhắc bạn. Bạn có thể bật trong Cài đặt hệ thống.',
      'noRightOrWrong': 'Không có câu trả lời đúng hay sai.\nHãy chọn điều gần với bạn nhất nhé.',
      'noteHint': 'Bạn muốn ghi lại điều gì hôm nay?',
      'noteHintPersonal': 'Viết vài dòng cho chính mình…',
      'noteOptional': 'Ghi chú (không bắt buộc)',
      'noteTooLong': 'Ghi chú quá dài (tối đa 500 ký tự).',
      'onboard1Body': 'Không cần phải luôn ổn. Bạn có thể chia sẻ theo cách của mình.',
      'onboard1Title': 'Một khoảng dừng nhỏ mỗi ngày',
      'onboard2Body': 'Một lời hỏi thăm nhẹ nhàng và chỗ ghi nhận cảm xúc chỉ dành cho bạn.',
      'onboard2Title': 'Lời chào & check-in riêng tư',
      'onboard3Body': 'Không tài khoản, không đám mây bắt buộc. Bạn kiểm soát hoàn toàn.',
      'onboard3Title': 'Dữ liệu ở trên thiết bị của bạn',
      'openBrowser': 'Mở trình duyệt',
      'openSettings': 'Mở Cài đặt',
      'premium': 'Premium',
      'premiumActive': 'Đang hoạt động',
      'premiumActiveOnDevice': 'Premium đang hoạt động trên thiết bị này.',
      'premiumSupportDesc': 'Gỡ toàn bộ quảng cáo và hỗ trợ phát triển StillHere.',
      'premiumThanks': 'Cảm ơn bạn đã hỗ trợ StillHere. Quảng cáo đã được gỡ.',
      'presenceRate': 'Tỷ lệ hiện diện',
      'privacy': 'Quyền riêng tư',
      'privacyBody': 'Check-in và ghi chú được lưu cục bộ trong ứng dụng. Still Here không yêu cầu tài khoản. Chúng tôi không gửi ghi chú hoặc trạng thái cảm xúc đến hệ thống phân tích. Tùy cài đặt sao lưu của hệ điều hành, dữ liệu ứng dụng có thể được đưa vào bản sao lưu thiết bị. Bạn có thể xuất hoặc xóa dữ liệu trong Cài đặt.',
      'purchaseFailed': 'Không thể mua: {error}',
      'purchaseIncomplete': 'Giao dịch chưa hoàn tất. Thử lại hoặc khôi phục mua hàng.',
      'purchaseSuccess': 'Đã nâng cấp Premium. Cảm ơn bạn!',
      'recentEntries': 'Ghi nhận gần đây',
      'reminderAt': 'Nhắc vào {time} mỗi ngày',
      'reminderOff': 'Tắt',
      'reminderTime': 'Giờ nhắc',
      'removeAdsPremium': 'Gỡ quảng cáo / Premium',
      'restoreEmpty': 'Không tìm thấy giao dịch trước đó.',
      'restoreFailed': 'Khôi phục thất bại: {error}',
      'restorePurchases': 'Khôi phục mua hàng',
      'restoreSuccess': 'Đã khôi phục Premium thành công.',
      'retry': 'Thử lại',
      'save': 'Lưu',
      'saveFailed': 'Không lưu được. Bạn thử lại nhé.',
      'saveForMyself': 'Lưu lại cho mình',
      'sectionAbout': 'Giới thiệu',
      'sectionData': 'Dữ liệu',
      'sectionGreeting': 'Lời chào',
      'sectionPremium': 'Premium',
      'sectionReminder': 'Nhắc nhở',
      'segmentMonth': 'Tháng',
      'segmentWeek': 'Tuần',
      'segmentYear': 'Năm',
      'selfCareMessage': 'Bạn đang chăm sóc bản thân thật tuyệt vời',
      'settingsSubtitle': 'Một góc nhỏ của riêng bạn.',
      'settingsTitle': 'Cài đặt',
      'skip': 'Bỏ qua',
      'splashTagline': 'Một khoảng lặng dành cho bạn',
      'statusOk': 'Ổn',
      'statusOkSubtitle': 'Và mình trân trọng điều đó.',
      'statusOkTitle': 'Tôi vẫn ổn.',
      'statusSelfCare': 'Cần tự chăm sóc',
      'statusSelfCareSubtitle': 'Dành không gian nhẹ nhàng cho mình.',
      'statusSelfCareTitle': 'Hôm nay tôi cần quan tâm đến bản thân hơn.',
      'statusShare': 'Muốn chia sẻ',
      'statusShareSubtitle': 'Có điều muốn nói với chính mình.',
      'statusShareTitle': 'Tôi muốn chia sẻ một chút.',
      'thankYouCheckIn': 'Cảm ơn bạn đã dành\nmột chút thời gian cho mình.',
      'thankYouForBeingHere': 'Cảm ơn bạn\nđã ở đây.',
      'thankYouMoment': 'Cảm ơn bạn đã dành một chút\nthời gian cho mình.',
      'theme': 'Giao diện',
      'themeDark': 'Tối',
      'themeLight': 'Sáng',
      'themeSystem': 'Hệ thống',
      'today': 'Hôm nay',
      'todaysNote': 'Lời nhắn hôm nay',
      'update': 'Cập nhật',
      'upgradePremium': 'Nâng cấp Premium',
      'upgradeToRemoveAds': 'Nâng cấp để bỏ quảng cáo',
      'useAiGreeting': 'Dùng lời chào AI',
      'useAiGreetingSubtitle': 'Tắt để luôn dùng lời chào có sẵn',
      'versionLabel': 'Phiên bản {version}',
      'viewHistory': 'Xem lại hành trình',
      'viewJourney': 'Xem lại hành trình',
      'writeMorePrompt': 'Bạn muốn viết thêm điều gì không?',
      'youAreCurrentlyOffline': 'Bạn đang ngoại tuyến',
      'youArePremium': 'Bạn đang dùng Premium',
      'yourAppIsOutdated': 'Ứng dụng đã cũ. Vui lòng cập nhật để tiếp tục.',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'Phiên bản ứng dụng không còn được hỗ trợ. Bạn đang bỏ lỡ các tính năng và cải tiến mới.',
      'yourJournal': 'Nhật ký của bạn',
      'youreEnough': 'You\'re enough ♡',
    },
    'th': {
      'aboutAiNote': 'คำทักทาย AI เป็นตัวเลือกเสริม เมื่อมีการกำหนดค่าและเปิดใช้ AI แอปจะส่งเฉพาะพรอมต์ที่จำกัดเพื่อสร้างคำทักทาย โดยไม่รวมบันทึกการเช็กอินหรือสถานะอารมณ์ หาก AI ยังไม่ได้กำหนดค่าหรือไม่พร้อมใช้งาน แอปจะใช้คำทักทายแบบคงที่ที่จัดเก็บไว้ในเครื่อง',
      'aboutTitle': 'เกี่ยวกับ & ความเป็นส่วนตัว',
      'adFreeExperience': 'ประสบการณ์ไม่มีโฆษณา',
      'afternoon': 'ช่วงบ่าย',
      'allowAiGreeting': 'อนุญาตคำทักทาย AI',
      'appTagline': 'พื้นที่เล็กๆ สำหรับคุณ',
      'backHome': 'กลับหน้าหลัก',
      'benefitAiPriority': 'คำทักทาย AI ลำดับแรก',
      'benefitNoAds': 'ไม่มีแบนเนอร์และโฆษณาคั่น',
      'benefitSupportDev': 'สนับสนุนทีมพัฒนา',
      'cancel': 'ยกเลิก',
      'checkInCta': 'เช็คอินวันนี้',
      'checkInDeleted': 'ลบเช็คอินแล้ว',
      'checkInTitle': 'เช็คอิน',
      'checkInToday': 'เช็คอินวันนี้',
      'chooseClosest': 'เลือกสิ่งที่ใกล้เคียงกับคุณที่สุด',
      'continueAction': 'ต่อไป',
      'dailyReminder': 'การแจ้งเตือนรายวัน',
      'dataDeleted': 'ลบข้อมูลทั้งหมดแล้ว',
      'dataStaysOnDevice': 'Still Here • จัดเก็บข้อมูลไว้ในแอป',
      'daysCheckedInPeriod': 'วันที่มีเช็คอิน\nในช่วงนี้',
      'delete': 'ลบ',
      'deleteAllData': 'ลบข้อมูลทั้งหมด',
      'deleteAllDataConfirm': 'ลบข้อมูลทั้งหมดบนอุปกรณ์นี้? ไม่สามารถย้อนกลับได้',
      'deleteCheckIn': 'ลบเช็คอิน',
      'deleteCheckInConfirm': 'ลบเช็คอินของวันนี้? ไม่สามารถย้อนกลับได้',
      'doingGreat': 'คุณทำได้ดีมาก 💚',
      'downloadNow': 'ดาวน์โหลดเลย',
      'edit': 'แก้ไข',
      'enableCheckInReminder': 'เปิดการเตือนเช็คอิน',
      'enoughQuote': '"แค่นี้ก็เพียงพอแล้ว"',
      'evening': 'ช่วงเย็น',
      'exportData': 'ส่งออกข้อมูล',
      'exportDataSubtitle': 'แชร์ไฟล์ JSON ของเช็คอินในเครื่อง',
      'exportFailed': 'ส่งออกข้อมูลไม่สำเร็จ',
      'failedToOpenBrowserPleaseTryAgain': 'เปิดเบราว์เซอร์ไม่สำเร็จ กรุณาลองอีกครั้ง',
      'getStarted': 'เริ่มต้น',
      'goBack': 'กลับ',
      'greetingFallback': 'สวัสดี ขอให้ทุกอย่างราบรื่นนะ',
      'headlineAfternoon': 'ช่วงบ่าย\nค่อยๆ ผ่านไป ✨',
      'headlineEvening': 'เย็นแล้ว\nคุณก็พอเพียง ✨',
      'headlineMorning': 'เช้าวันใหม่\nกำลังเริ่มต้น ✨',
      'headlineNoon': 'กลางวัน\nเบาๆ ✨',
      'helloAfternoon': 'สวัสดีตอนบ่าย,',
      'helloEvening': 'สวัสดีตอนเย็น,',
      'helloMorning': 'สวัสดีตอนเช้า,',
      'historyEmpty': 'ยังไม่มีบันทึกในเดือนนี้\nเริ่มเมื่อไหร่ก็ได้',
      'historyTitle': 'บันทึก',
      'howAreYouFeeling': 'วันนี้คุณรู้สึกอย่างไร?',
      'howAreYouFeelingTitle': 'วันนี้\nคุณรู้สึกอย่างไร?',
      'howAreYouFeelingToday': 'วันนี้คุณรู้สึกอย่างไร?',
      'iapUnavailable': 'การซื้อในแอปยังไม่พร้อมใช้งานชั่วคราว',
      'journalSubtitle': 'วันของคุณ ความรู้สึกจริงๆ ของคุณ',
      'labelDays': 'วัน',
      'labelOk': 'โอเค',
      'labelSelfCare': 'ดูแลตัวเอง',
      'labelShare': 'แบ่งปัน',
      'language': 'ภาษา',
      'later': 'ไว้ทีหลัง',
      'legalLinks': 'กฎหมาย',
      'loadingPlans': 'กำลังโหลดแพ็กเกจ…',
      'lookBackJourney': 'ย้อนดูเส้นทาง',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': 'ดูเหมือนการเชื่อมต่อถูกขัดจังหวะ ตรวจสอบเครือข่ายแล้วลองอีกครั้ง',
      'monthLabel': 'เดือน {month}, {year}',
      'moodDistribution': 'การกระจายอารมณ์',
      'morning': 'ช่วงเช้า',
      'navHistory': 'บันทึก',
      'navHome': 'หน้าหลัก',
      'navJournal': 'บันทึก',
      'navSettings': 'ตั้งค่า',
      'navStats': 'สถิติ',
      'needNotificationPermission': 'ต้องอนุญาตการแจ้งเตือน คุณเปิดได้ในการตั้งค่าระบบ',
      'noRightOrWrong': 'ไม่มีคำตอบถูกหรือผิด\nเลือกสิ่งที่ใกล้เคียงกับคุณที่สุด',
      'noteHint': 'อยากจดอะไรไว้วันนี้ไหม?',
      'noteHintPersonal': 'เขียนสองสามบรรทัดให้ตัวเอง…',
      'noteOptional': 'บันทึก (ไม่บังคับ)',
      'noteTooLong': 'บันทึกยาวเกินไป (สูงสุด 500 ตัวอักษร)',
      'onboard1Body': 'ไม่จำเป็นต้องโอเคเสมอ คุณแชร์ได้ในแบบของคุณ',
      'onboard1Title': 'หยุดพักเล็ก ๆ ในทุกวัน',
      'onboard2Body': 'คำทักทายอ่อนโยนและที่จดความรู้สึก เฉพาะคุณ',
      'onboard2Title': 'คำทักทายและเช็คอินส่วนตัว',
      'onboard3Body': 'ไม่มีบัญชี ไม่บังคับคลาวด์ คุณควบคุมทั้งหมด',
      'onboard3Title': 'ข้อมูลอยู่บนอุปกรณ์ของคุณ',
      'openBrowser': 'เปิดในเบราว์เซอร์',
      'openSettings': 'เปิดการตั้งค่า',
      'premium': 'พรีเมียม',
      'premiumActive': 'ใช้งานอยู่',
      'premiumActiveOnDevice': 'พรีเมียมเปิดใช้งานบนอุปกรณ์นี้',
      'premiumSupportDesc': 'ลบโฆษณาทั้งหมดและสนับสนุนการพัฒนา StillHere',
      'premiumThanks': 'ขอบคุณที่สนับสนุน StillHere โฆษณาถูกลบแล้ว',
      'presenceRate': 'อัตราการปรากฏตัว',
      'privacy': 'ความเป็นส่วนตัว',
      'privacyBody': 'การเช็กอินและบันทึกจะถูกจัดเก็บไว้ภายในแอป Still Here ไม่จำเป็นต้องมีบัญชี เราจะไม่ส่งบันทึกหรือสถานะอารมณ์ของคุณไปยังระบบวิเคราะห์ ทั้งนี้ข้อมูลแอปอาจถูกรวมไว้ในการสำรองข้อมูลของอุปกรณ์ ขึ้นอยู่กับการตั้งค่าการสำรองข้อมูลของระบบปฏิบัติการ คุณสามารถส่งออกหรือลบข้อมูลได้ในการตั้งค่า',
      'purchaseFailed': 'ซื้อไม่สำเร็จ: {error}',
      'purchaseIncomplete': 'การซื้อยังไม่เสร็จ ลองใหม่หรือกู้คืนการซื้อ',
      'purchaseSuccess': 'อัปเกรดพรีเมียมแล้ว ขอบคุณ!',
      'recentEntries': 'รายการล่าสุด',
      'reminderAt': 'เตือนเวลา {time} ทุกวัน',
      'reminderOff': 'ปิด',
      'reminderTime': 'เวลาเตือน',
      'removeAdsPremium': 'ปิดโฆษณา / พรีเมียม',
      'restoreEmpty': 'ไม่พบการซื้อก่อนหน้า',
      'restoreFailed': 'กู้คืนล้มเหลว: {error}',
      'restorePurchases': 'กู้คืนการซื้อ',
      'restoreSuccess': 'กู้คืนพรีเมียมสำเร็จ',
      'retry': 'ลองอีกครั้ง',
      'save': 'บันทึก',
      'saveFailed': 'บันทึกไม่ได้ ลองอีกครั้งนะ',
      'saveForMyself': 'บันทึกไว้ให้ตัวเอง',
      'sectionAbout': 'เกี่ยวกับ',
      'sectionData': 'ข้อมูล',
      'sectionGreeting': 'คำทักทาย',
      'sectionPremium': 'พรีเมียม',
      'sectionReminder': 'การแจ้งเตือน',
      'segmentMonth': 'เดือน',
      'segmentWeek': 'สัปดาห์',
      'segmentYear': 'ปี',
      'selfCareMessage': 'คุณกำลังดูแลตัวเองได้ดีมาก',
      'settingsSubtitle': 'มุมเล็กๆ ของคุณเอง',
      'settingsTitle': 'ตั้งค่า',
      'skip': 'ข้าม',
      'splashTagline': 'พื้นที่เล็กๆ สำหรับคุณ',
      'statusOk': 'โอเค',
      'statusOkSubtitle': 'และแค่นั้นก็พอ',
      'statusOkTitle': 'ฉันโอเค',
      'statusSelfCare': 'ต้องการดูแลตัวเอง',
      'statusSelfCareSubtitle': 'พื้นที่อ่อนโยนสำหรับตัวเอง',
      'statusSelfCareTitle': 'วันนี้ต้องการดูแลตัวเองมากขึ้น',
      'statusShare': 'อยากแบ่งปัน',
      'statusShareSubtitle': 'มีอะไรอยากบอกกับตัวเอง',
      'statusShareTitle': 'อยากแบ่งปันนิดหน่อย',
      'thankYouCheckIn': 'ขอบคุณที่ให้เวลา\nกับตัวเองสักนิด',
      'thankYouForBeingHere': 'ขอบคุณที่\nอยู่ตรงนี้',
      'thankYouMoment': 'ขอบคุณที่สละเวลา\nให้ตัวเองสักนิด',
      'theme': 'ธีม',
      'themeDark': 'มืด',
      'themeLight': 'สว่าง',
      'themeSystem': 'ระบบ',
      'today': 'วันนี้',
      'todaysNote': 'ข้อความวันนี้',
      'update': 'อัปเดต',
      'upgradePremium': 'อัปเกรดพรีเมียม',
      'upgradeToRemoveAds': 'อัปเกรดเพื่อปิดโฆษณา',
      'useAiGreeting': 'ใช้คำทักทาย AI',
      'useAiGreetingSubtitle': 'ปิดเพื่อใช้คำทักทายในเครื่องเสมอ',
      'versionLabel': 'เวอร์ชัน {version}',
      'viewHistory': 'ดูเส้นทางของคุณ',
      'viewJourney': 'ดูเส้นทางของคุณ',
      'writeMorePrompt': 'อยากเขียนเพิ่มอีกหน่อยไหม?',
      'youAreCurrentlyOffline': 'คุณออฟไลน์อยู่',
      'youArePremium': 'คุณใช้พรีเมียมอยู่',
      'yourAppIsOutdated': 'แอปเวอร์ชันเก่า กรุณาอัปเดตเพื่อใช้งานต่อ',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': 'เวอร์ชันแอปไม่รองรับอีกต่อไป คุณกำลังพลาดฟีเจอร์และการปรับปรุงใหม่ ๆ',
      'yourJournal': 'บันทึกของคุณ',
      'youreEnough': 'You\'re enough ♡',
    },
    'zh': {
      'aboutAiNote': 'AI 问候为可选功能。配置并启用 AI 后，应用只会发送有限的提示内容来生成问候，不会包含签到备注或情绪状态。如果 AI 尚未配置或不可用，应用会使用本地静态问候语。',
      'aboutTitle': '关于与隐私',
      'adFreeExperience': '无广告体验',
      'afternoon': '下午',
      'allowAiGreeting': '允许 AI 问候',
      'appTagline': '为你留出的一小片空间',
      'backHome': '返回首页',
      'benefitAiPriority': '优先 AI 问候',
      'benefitNoAds': '不再显示横幅与插屏广告',
      'benefitSupportDev': '支持开发团队',
      'cancel': '取消',
      'checkInCta': '今日打卡',
      'checkInDeleted': '已删除打卡。',
      'checkInTitle': '打卡',
      'checkInToday': '今日打卡',
      'chooseClosest': '选择最接近你此刻的状态。',
      'continueAction': '继续',
      'dailyReminder': '每日提醒',
      'dataDeleted': '已删除全部数据。',
      'dataStaysOnDevice': 'Still Here • 数据在应用内本地保存',
      'daysCheckedInPeriod': '本周期已打卡\n天数',
      'delete': '删除',
      'deleteAllData': '删除全部数据',
      'deleteAllDataConfirm': '删除此设备上的全部数据？此操作无法撤销。',
      'deleteCheckIn': '删除打卡',
      'deleteCheckInConfirm': '删除这一天的打卡？此操作无法撤销。',
      'doingGreat': '你做得很好 💚',
      'downloadNow': '立即下载',
      'edit': '编辑',
      'enableCheckInReminder': '开启打卡提醒',
      'enoughQuote': '“这样就够了。”',
      'evening': '晚上',
      'exportData': '导出数据',
      'exportDataSubtitle': '分享本地打卡记录的 JSON 副本',
      'exportFailed': '无法导出数据。',
      'failedToOpenBrowserPleaseTryAgain': '无法打开浏览器，请重试。',
      'getStarted': '开始',
      'goBack': '返回',
      'greetingFallback': '你好。希望你一切都好。',
      'headlineAfternoon': '傍晚将至\n放慢脚步 ✨',
      'headlineEvening': '夜晚安静\n你在这里 ✨',
      'headlineMorning': '新的早晨\n正在开始 ✨',
      'headlineNoon': '午后时光\n慢慢来 ✨',
      'helloAfternoon': '下午好，',
      'helloEvening': '晚上好，',
      'helloMorning': '早上好，',
      'historyEmpty': '本月还没有记录。\n随时可以开始。',
      'historyTitle': '日记',
      'howAreYouFeeling': '今天感觉怎么样？',
      'howAreYouFeelingTitle': '今天，\n你感觉如何？',
      'howAreYouFeelingToday': '今天感觉怎么样？',
      'iapUnavailable': '应用内购买暂时不可用。',
      'journalSubtitle': '你的日子，真实的感受。',
      'labelDays': '天数',
      'labelOk': '还好',
      'labelSelfCare': '自我关照',
      'labelShare': '分享',
      'language': '语言',
      'later': '稍后再说',
      'legalLinks': '法律信息',
      'loadingPlans': '正在加载套餐…',
      'lookBackJourney': '回顾旅程',
      'looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd': '看起来您的网络连接已中断。请检查网络后重试。',
      'monthLabel': '{year}年{month}月',
      'moodDistribution': '情绪分布',
      'morning': '早上',
      'navHistory': '日记',
      'navHome': '首页',
      'navJournal': '日记',
      'navSettings': '设置',
      'navStats': '统计',
      'needNotificationPermission': '需要通知权限才能提醒你。可在系统设置中开启。',
      'noRightOrWrong': '没有对错之分。\n选择最贴近你的那一个。',
      'noteHint': '今天想记下什么吗？',
      'noteHintPersonal': '给自己写几句话…',
      'noteOptional': '备注（可选）',
      'noteTooLong': '备注过长（最多 500 字）。',
      'onboard1Body': '不必总是很好。你可以按自己的方式分享。',
      'onboard1Title': '每天一个小小停顿',
      'onboard2Body': '一句温柔的问候，和一个只属于你的情绪记录处。',
      'onboard2Title': '私密问候与打卡',
      'onboard3Body': '无需账号，无需强制云端。完全由你掌控。',
      'onboard3Title': '数据保存在你的设备上',
      'openBrowser': '在浏览器中打开',
      'openSettings': '打开设置',
      'premium': '高级版',
      'premiumActive': '已开通',
      'premiumActiveOnDevice': '本设备已开通高级版。',
      'premiumSupportDesc': '去除全部广告并支持 StillHere 开发。',
      'premiumThanks': '感谢支持 StillHere。广告已去除。',
      'presenceRate': '到场率',
      'privacy': '隐私',
      'privacyBody': '签到和备注保存在应用本地。Still Here 无需账户。我们不会将你的备注或情绪状态发送到分析系统。根据操作系统的备份设置，应用数据可能会包含在设备备份中。你可以在设置中导出或删除数据。',
      'purchaseFailed': '无法购买：{error}',
      'purchaseIncomplete': '购买未完成。请重试或恢复购买。',
      'purchaseSuccess': '已升级高级版。谢谢你！',
      'recentEntries': '最近记录',
      'reminderAt': '每天 {time} 提醒',
      'reminderOff': '关闭',
      'reminderTime': '提醒时间',
      'removeAdsPremium': '去除广告 / 高级版',
      'restoreEmpty': '未找到之前的购买记录。',
      'restoreFailed': '恢复失败：{error}',
      'restorePurchases': '恢复购买',
      'restoreSuccess': '已成功恢复高级版。',
      'retry': '重试',
      'save': '保存',
      'saveFailed': '保存失败，请再试一次。',
      'saveForMyself': '为自己保存',
      'sectionAbout': '关于',
      'sectionData': '数据',
      'sectionGreeting': '问候',
      'sectionPremium': '高级版',
      'sectionReminder': '提醒',
      'segmentMonth': '月',
      'segmentWeek': '周',
      'segmentYear': '年',
      'selfCareMessage': '你在好好照顾自己',
      'settingsSubtitle': '属于你的小小角落。',
      'settingsTitle': '设置',
      'skip': '跳过',
      'splashTagline': '为你留出的一小片空间',
      'statusOk': '还好',
      'statusOkSubtitle': '这样就够了。',
      'statusOkTitle': '我还好。',
      'statusSelfCare': '需要自我关照',
      'statusSelfCareSubtitle': '给自己一点温柔空间。',
      'statusSelfCareTitle': '今天更需要照顾自己。',
      'statusShare': '想分享',
      'statusShareSubtitle': '有话想对自己说。',
      'statusShareTitle': '想稍微分享一下。',
      'thankYouCheckIn': '谢谢你为自己\n留出一点时间。',
      'thankYouForBeingHere': '谢谢你\n在这里。',
      'thankYouMoment': '谢谢你为自己\n留出一点时间。',
      'theme': '主题',
      'themeDark': '深色',
      'themeLight': '浅色',
      'themeSystem': '跟随系统',
      'today': '今天',
      'todaysNote': '今日寄语',
      'update': '更新',
      'upgradePremium': '升级高级版',
      'upgradeToRemoveAds': '升级以去除广告',
      'useAiGreeting': '使用 AI 问候',
      'useAiGreetingSubtitle': '关闭后始终使用本地问候',
      'versionLabel': '版本 {version}',
      'viewHistory': '查看你的旅程',
      'viewJourney': '查看你的旅程',
      'writeMorePrompt': '还想再写一点吗？',
      'youAreCurrentlyOffline': '您当前处于离线状态',
      'youArePremium': '你正在使用高级版',
      'yourAppIsOutdated': '应用版本过旧，请更新后继续使用。',
      'yourAppVersionIsNoLongerSupportedYoureMissingOut': '您的应用版本已不再受支持。您正在错过新功能和改进。',
      'yourJournal': '你的日记',
      'youreEnough': 'You\'re enough ♡',
    },
  };

  String _t(String key) {
    final map = _maps[localeName] ?? _maps['en']!;
    return map[key] ?? _maps['en']![key] ?? key;
  }

  String _tp(String key, Map<String, String> params) {
    var s = _t(key);
    params.forEach((k, v) {
      s = s.replaceAll('{$k}', v);
    });
    return s;
  }

  String get aboutAiNote => _t('aboutAiNote');
  String get aboutTitle => _t('aboutTitle');
  String get adFreeExperience => _t('adFreeExperience');
  String get afternoon => _t('afternoon');
  String get allowAiGreeting => _t('allowAiGreeting');
  String get appTagline => _t('appTagline');
  String get backHome => _t('backHome');
  String get benefitAiPriority => _t('benefitAiPriority');
  String get benefitNoAds => _t('benefitNoAds');
  String get benefitSupportDev => _t('benefitSupportDev');
  String get cancel => _t('cancel');
  String get checkInCta => _t('checkInCta');
  String get checkInDeleted => _t('checkInDeleted');
  String get checkInTitle => _t('checkInTitle');
  String get checkInToday => _t('checkInToday');
  String get chooseClosest => _t('chooseClosest');
  String get continueAction => _t('continueAction');
  String get dailyReminder => _t('dailyReminder');
  String get dataDeleted => _t('dataDeleted');
  String get dataStaysOnDevice => _t('dataStaysOnDevice');
  String get daysCheckedInPeriod => _t('daysCheckedInPeriod');
  String get delete => _t('delete');
  String get deleteAllData => _t('deleteAllData');
  String get deleteAllDataConfirm => _t('deleteAllDataConfirm');
  String get deleteCheckIn => _t('deleteCheckIn');
  String get deleteCheckInConfirm => _t('deleteCheckInConfirm');
  String get doingGreat => _t('doingGreat');
  String get downloadNow => _t('downloadNow');
  String get edit => _t('edit');
  String get enableCheckInReminder => _t('enableCheckInReminder');
  String get enoughQuote => _t('enoughQuote');
  String get evening => _t('evening');
  String get exportData => _t('exportData');
  String get exportDataSubtitle => _t('exportDataSubtitle');
  String get exportFailed => _t('exportFailed');
  String get failedToOpenBrowserPleaseTryAgain => _t('failedToOpenBrowserPleaseTryAgain');
  String get getStarted => _t('getStarted');
  String get goBack => _t('goBack');
  String get greetingFallback => _t('greetingFallback');
  String get headlineAfternoon => _t('headlineAfternoon');
  String get headlineEvening => _t('headlineEvening');
  String get headlineMorning => _t('headlineMorning');
  String get headlineNoon => _t('headlineNoon');
  String get helloAfternoon => _t('helloAfternoon');
  String get helloEvening => _t('helloEvening');
  String get helloMorning => _t('helloMorning');
  String get historyEmpty => _t('historyEmpty');
  String get historyTitle => _t('historyTitle');
  String get howAreYouFeeling => _t('howAreYouFeeling');
  String get howAreYouFeelingTitle => _t('howAreYouFeelingTitle');
  String get howAreYouFeelingToday => _t('howAreYouFeelingToday');
  String get iapUnavailable => _t('iapUnavailable');
  String get journalSubtitle => _t('journalSubtitle');
  String get labelDays => _t('labelDays');
  String get labelOk => _t('labelOk');
  String get labelSelfCare => _t('labelSelfCare');
  String get labelShare => _t('labelShare');
  String get language => _t('language');
  String get later => _t('later');
  String get legalLinks => _t('legalLinks');
  String get loadingPlans => _t('loadingPlans');
  String get lookBackJourney => _t('lookBackJourney');
  String get looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd => _t('looksLikeYourComnnectionIsInterruptedCheckNetworkConnectionAnd');
  String get moodDistribution => _t('moodDistribution');
  String get morning => _t('morning');
  String get navHistory => _t('navHistory');
  String get navHome => _t('navHome');
  String get navJournal => _t('navJournal');
  String get navSettings => _t('navSettings');
  String get navStats => _t('navStats');
  String get needNotificationPermission => _t('needNotificationPermission');
  String get noRightOrWrong => _t('noRightOrWrong');
  String get noteHint => _t('noteHint');
  String get noteHintPersonal => _t('noteHintPersonal');
  String get noteOptional => _t('noteOptional');
  String get noteTooLong => _t('noteTooLong');
  String get onboard1Body => _t('onboard1Body');
  String get onboard1Title => _t('onboard1Title');
  String get onboard2Body => _t('onboard2Body');
  String get onboard2Title => _t('onboard2Title');
  String get onboard3Body => _t('onboard3Body');
  String get onboard3Title => _t('onboard3Title');
  String get openBrowser => _t('openBrowser');
  String get openSettings => _t('openSettings');
  String get premium => _t('premium');
  String get premiumActive => _t('premiumActive');
  String get premiumActiveOnDevice => _t('premiumActiveOnDevice');
  String get premiumSupportDesc => _t('premiumSupportDesc');
  String get premiumThanks => _t('premiumThanks');
  String get presenceRate => _t('presenceRate');
  String get privacy => _t('privacy');
  String get privacyBody => _t('privacyBody');
  String get purchaseIncomplete => _t('purchaseIncomplete');
  String get purchaseSuccess => _t('purchaseSuccess');
  String get recentEntries => _t('recentEntries');
  String get reminderOff => _t('reminderOff');
  String get reminderTime => _t('reminderTime');
  String get removeAdsPremium => _t('removeAdsPremium');
  String get restoreEmpty => _t('restoreEmpty');
  String get restorePurchases => _t('restorePurchases');
  String get restoreSuccess => _t('restoreSuccess');
  String get retry => _t('retry');
  String get save => _t('save');
  String get saveFailed => _t('saveFailed');
  String get saveForMyself => _t('saveForMyself');
  String get sectionAbout => _t('sectionAbout');
  String get sectionData => _t('sectionData');
  String get sectionGreeting => _t('sectionGreeting');
  String get sectionPremium => _t('sectionPremium');
  String get sectionReminder => _t('sectionReminder');
  String get segmentMonth => _t('segmentMonth');
  String get segmentWeek => _t('segmentWeek');
  String get segmentYear => _t('segmentYear');
  String get selfCareMessage => _t('selfCareMessage');
  String get settingsSubtitle => _t('settingsSubtitle');
  String get settingsTitle => _t('settingsTitle');
  String get skip => _t('skip');
  String get splashTagline => _t('splashTagline');
  String get statusOk => _t('statusOk');
  String get statusOkSubtitle => _t('statusOkSubtitle');
  String get statusOkTitle => _t('statusOkTitle');
  String get statusSelfCare => _t('statusSelfCare');
  String get statusSelfCareSubtitle => _t('statusSelfCareSubtitle');
  String get statusSelfCareTitle => _t('statusSelfCareTitle');
  String get statusShare => _t('statusShare');
  String get statusShareSubtitle => _t('statusShareSubtitle');
  String get statusShareTitle => _t('statusShareTitle');
  String get thankYouCheckIn => _t('thankYouCheckIn');
  String get thankYouForBeingHere => _t('thankYouForBeingHere');
  String get thankYouMoment => _t('thankYouMoment');
  String get theme => _t('theme');
  String get themeDark => _t('themeDark');
  String get themeLight => _t('themeLight');
  String get themeSystem => _t('themeSystem');
  String get today => _t('today');
  String get todaysNote => _t('todaysNote');
  String get update => _t('update');
  String get upgradePremium => _t('upgradePremium');
  String get upgradeToRemoveAds => _t('upgradeToRemoveAds');
  String get useAiGreeting => _t('useAiGreeting');
  String get useAiGreetingSubtitle => _t('useAiGreetingSubtitle');
  String get viewHistory => _t('viewHistory');
  String get viewJourney => _t('viewJourney');
  String get writeMorePrompt => _t('writeMorePrompt');
  String get youAreCurrentlyOffline => _t('youAreCurrentlyOffline');
  String get youArePremium => _t('youArePremium');
  String get yourAppIsOutdated => _t('yourAppIsOutdated');
  String get yourAppVersionIsNoLongerSupportedYoureMissingOut => _t('yourAppVersionIsNoLongerSupportedYoureMissingOut');
  String get yourJournal => _t('yourJournal');
  String get youreEnough => _t('youreEnough');

  String reminderAt(String time) => _tp('reminderAt', {'time': time});
  String purchaseFailed(String error) => _tp('purchaseFailed', {'error': error});
  String restoreFailed(String error) => _tp('restoreFailed', {'error': error});
  String monthLabel(int month, int year) =>
      _tp('monthLabel', {'month': '$month', 'year': '$year'});
  String versionLabel(String version) =>
      _tp('versionLabel', {'version': version});
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) =>
      ['en', 'vi', 'th', 'zh'].contains(locale.languageCode);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
  List<Locale> get supportedLocales => const [
    Locale('en'), Locale('vi'), Locale('th'), Locale('zh'),
  ];
}
