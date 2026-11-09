import 'package:still_here/shared/models/greeting.dart';

/// Pool lời chào tĩnh theo time bucket + ngôn ngữ (fallback khi AI off / offline / lỗi).
class StaticGreetings {
  StaticGreetings._();

  static final Map<String, Map<TimeBucket, List<String>>> _pool = {
    'vi': {
      TimeBucket.morning: [
        'Chào buổi sáng nhé! Mong bạn có một khởi đầu nhẹ nhàng.',
        'Buổi sáng mới, một lời hỏi thăm nhỏ gửi đến bạn.',
        'Chào buổi sáng. Bạn đã sẵn sàng cho ngày hôm nay chưa?',
        'Một buổi sáng yên ả. Chúc bạn bắt đầu ngày thật êm đềm.',
        'Chào buổi sáng. Hôm nay bạn muốn bắt đầu thế nào?',
      ],
      TimeBucket.afternoon: [
        'Chào buổi chiều. Giữa ngày, bạn đang cảm thấy thế nào?',
        'Buổi chiều rồi. Nhớ dành một khoảng nghỉ nhỏ cho mình nhé.',
        'Chào bạn. Chiều nay mọi thứ có ổn không?',
        'Một lời hỏi thăm giữa ngày. Bạn ổn chứ?',
        'Chào buổi chiều. Cảm giác của bạn lúc này thế nào?',
      ],
      TimeBucket.evening: [
        'Chào buổi tối. Một ngày đã qua, bạn cảm thấy thế nào?',
        'Buổi tối rồi. Mong bạn được nghỉ ngơi thật thoải mái.',
        'Chào buổi tối. Hôm nay có điều gì đáng nhớ không?',
        'Một lời hỏi thăm nhẹ nhàng trước khi ngày kết thúc.',
        'Chào bạn. Đêm nay mong bạn ngủ ngon và bình yên.',
      ],
    },
    'en': {
      TimeBucket.morning: [
        'Good morning. Wishing you a gentle start to the day.',
        'A quiet hello this morning. How are you beginning today?',
        'Good morning. Hope the day opens kindly for you.',
        'Morning. May today feel manageable and kind.',
        'Hello this morning. Taking things one step at a time is enough.',
      ],
      TimeBucket.afternoon: [
        'Good afternoon. How are you feeling in the middle of the day?',
        'A small check-in this afternoon. Hope you are doing okay.',
        'Afternoon hello. Taking a moment for yourself?',
        'Midday pause. How is your energy right now?',
        'Good afternoon. Remember you can slow down when you need to.',
      ],
      TimeBucket.evening: [
        'Good evening. How did the day feel for you?',
        'Evening is here. Wishing you a peaceful wind-down.',
        'A quiet hello tonight. Rest well when you can.',
        'Good evening. Whatever today held, you made it through.',
        'Night is settling in. Be gentle with yourself.',
      ],
    },
    'th': {
      TimeBucket.morning: [
        'อรุณสวัสดิ์ ขอให้เช้านี้เริ่มต้นอย่างนุ่มนวลนะ',
        'สวัสดีตอนเช้า มีคำทักทายเล็ก ๆ ส่งถึงคุณ',
        'อรุณสวัสดิ์ วันนี้คุณพร้อมเริ่มต้นแล้วหรือยัง?',
        'เช้าอันสงบ ขอให้วันของคุณนุ่มนวล',
        'สวัสดีตอนเช้า วันนี้คุณอยากเริ่มอย่างไร?',
      ],
      TimeBucket.afternoon: [
        'สวัสดีตอนบ่าย กลางวันคุณรู้สึกอย่างไร?',
        'บ่ายแล้ว อย่าลืมพักผ่อนสักนิดนะ',
        'สวัสดี ช่วงบ่ายทุกอย่างโอเคไหม?',
        'คำทักทายกลางวัน คุณสบายดีไหม?',
        'สวัสดีตอนบ่าย ตอนนี้คุณรู้สึกอย่างไร?',
      ],
      TimeBucket.evening: [
        'สวัสดีตอนเย็น วันนี้ผ่านไปคุณรู้สึกอย่างไร?',
        'เย็นแล้ว ขอให้ได้พักผ่อนอย่างสบาย',
        'สวัสดีตอนเย็น วันนี้มีอะไรน่าจดจำไหม?',
        'คำทักทายอ่อนโยนก่อนจบวัน',
        'สวัสดี ขอให้คืนนี้นอนหลับฝันดี',
      ],
    },
    'zh': {
      TimeBucket.morning: [
        '早上好。愿你有一个轻柔的开始。',
        '清晨一句问候，送给你。',
        '早上好。今天准备好开始了吗？',
        '安静的早晨。祝你这一天平和。',
        '早上好。今天想怎样开始呢？',
      ],
      TimeBucket.afternoon: [
        '下午好。一天过半，你感觉如何？',
        '下午了，记得给自己一点休息。',
        '你好。今天下午还好吗？',
        '午间一句问候。你还好吗？',
        '下午好。此刻的心情如何？',
      ],
      TimeBucket.evening: [
        '晚上好。今天过得怎么样？',
        '夜晚到了，愿你好好休息。',
        '晚上好。今天有什么值得记住的吗？',
        '临睡前一句轻柔的问候。',
        '你好。愿你今夜安睡。',
      ],
    },
  };

  static String get({
    required TimeBucket bucket,
    required String language,
    int seed = 0,
  }) {
    final lang = _pool.containsKey(language) ? language : 'en';
    final list = _pool[lang]![bucket] ?? _pool['en']![bucket]!;
    final index = seed.abs() % list.length;
    return list[index];
  }
}
