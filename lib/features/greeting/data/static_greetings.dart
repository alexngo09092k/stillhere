import 'package:still_here/shared/models/greeting.dart';

/// Static greeting pool by time bucket + language (fallback when AI is off / offline / error).
/// Expanded for AppGallery 4.1 content depth.
class StaticGreetings {
  StaticGreetings._();

  static const Map<String, Map<TimeBucket, List<String>>> _pool = {
    'en': {
      TimeBucket.morning: [
        'Good morning. May today begin gently.',
        'A quiet hello this morning.',
        'Good morning. Ready to start when you are.',
        'Soft morning light. Wishing you ease today.',
        'Good morning. How would you like to begin?',
        'Hello this morning. One step at a time is enough.',
        'Morning is here. You do not have to rush.',
        'A small greeting for a new day.',
        'Good morning. Your pace is allowed to be slow.',
        'Sunrise thoughts: be kind to yourself today.',
      ],
      TimeBucket.afternoon: [
        'Good afternoon. How are you feeling mid-day?',
        'A small check-in this afternoon.',
        'Afternoon hello. Taking a moment for yourself?',
        'Midday pause. How is your energy?',
        'Good afternoon. You can slow down when you need to.',
        'Hello from the middle of the day.',
        'Afternoon is unfolding. You are allowed a break.',
        'A gentle midday hello.',
        'How is the day treating you so far?',
        'Afternoon note: rest counts as progress too.',
      ],
      TimeBucket.evening: [
        'Good evening. How did the day feel?',
        'Evening is here. Wishing you a peaceful wind-down.',
        'A quiet hello tonight.',
        'Good evening. You made it through today.',
        'Night is settling in. Be gentle with yourself.',
        'Evening check-in. Whatever today held is enough.',
        'Soft evening light. Time to soften the edges.',
        'Hello tonight. Rest when you can.',
        'The day is closing. You can set it down.',
        'Good evening. Tomorrow does not need to be solved tonight.',
      ],
    },
    'vi': {
      TimeBucket.morning: [
        'Chào buổi sáng. Chúc bạn một khởi đầu dịu dàng.',
        'Một lời chào nhỏ buổi sáng gửi đến bạn.',
        'Chào buổi sáng. Hôm nay bạn sẵn sàng bắt đầu chưa?',
        'Sáng yên tĩnh. Chúc ngày của bạn nhẹ nhàng.',
        'Chào buổi sáng. Bạn muốn bắt đầu thế nào?',
        'Buổi sáng rồi. Không cần phải vội.',
        'Một lời chào cho ngày mới.',
        'Chào buổi sáng. Nhịp của bạn được phép chậm.',
        'Ánh sáng sớm: hãy dịu dàng với chính mình.',
        'Xin chào buổi sáng. Từng bước một là đủ.',
      ],
      TimeBucket.afternoon: [
        'Chào buổi chiều. Giữa ngày bạn cảm thấy thế nào?',
        'Một lời hỏi thăm nhỏ buổi chiều.',
        'Xin chào. Chiều nay mọi thứ ổn chứ?',
        'Khoảng lặng giữa ngày. Năng lượng của bạn ra sao?',
        'Chào buổi chiều. Bạn có thể chậm lại khi cần.',
        'Giữa ngày gửi bạn một lời chào.',
        'Buổi chiều đang trôi. Nghỉ một chút cũng được.',
        'Một lời chào dịu dàng giữa ngày.',
        'Ngày hôm nay với bạn thế nào rồi?',
        'Ghi chú chiều: nghỉ ngơi cũng là tiến bộ.',
      ],
      TimeBucket.evening: [
        'Chào buổi tối. Hôm nay với bạn ra sao?',
        'Đêm đang về. Chúc bạn được nghỉ ngơi.',
        'Một lời chào nhẹ trước khi ngày khép lại.',
        'Chào buổi tối. Bạn đã đi hết ngày hôm nay.',
        'Đêm dần yên. Hãy dịu dàng với mình.',
        'Check-in tối. Những gì hôm nay mang đến là đủ.',
        'Ánh đèn dịu. Đến lúc làm mềm lại nhịp sống.',
        'Xin chào tối nay. Nghỉ ngơi khi bạn có thể.',
        'Ngày đang khép. Bạn có thể đặt nó xuống.',
        'Chào buổi tối. Ngày mai không cần giải quyết ngay tối nay.',
      ],
    },
    'th': {
      TimeBucket.morning: [
        'อรุณสวัสดิ์ ขอให้เช้านี้เริ่มต้นอย่างนุ่มนวลนะ',
        'สวัสดีตอนเช้า มีคำทักทายเล็ก ๆ ส่งถึงคุณ',
        'อรุณสวัสดิ์ วันนี้คุณพร้อมเริ่มต้นแล้วหรือยัง?',
        'เช้าอันสงบ ขอให้วันของคุณนุ่มนวล',
        'สวัสดีตอนเช้า วันนี้คุณอยากเริ่มอย่างไร?',
        'เช้าแล้ว ไม่ต้องรีบก็ได้',
        'คำทักทายเล็ก ๆ สำหรับวันใหม่',
        'อรุณสวัสดิ์ จังหวะของคุณช้าได้',
        'แสงเช้า: ใจดีกับตัวเองนะ',
        'สวัสดีตอนเช้า ก้าวเดียวก็พอ',
      ],
      TimeBucket.afternoon: [
        'สวัสดีตอนบ่าย กลางวันคุณรู้สึกอย่างไร?',
        'บ่ายแล้ว อย่าลืมพักผ่อนสักนิดนะ',
        'สวัสดี ช่วงบ่ายทุกอย่างโอเคไหม?',
        'คำทักทายกลางวัน คุณสบายดีไหม?',
        'สวัสดีตอนบ่าย ตอนนี้คุณรู้สึกอย่างไร?',
        'ทักทายจากกลางวัน',
        'บ่ายกำลังผ่าน หยุดพักได้เสมอ',
        'สวัสดีช่วงบ่ายอย่างนุ่มนวล',
        'วันนี้เป็นอย่างไรบ้างจนถึงตอนนี้?',
        'บันทึกบ่าย: การพักก็คือความก้าวหน้า',
      ],
      TimeBucket.evening: [
        'สวัสดีตอนเย็น วันนี้ผ่านไปคุณรู้สึกอย่างไร?',
        'เย็นแล้ว ขอให้ได้พักผ่อนอย่างสบาย',
        'สวัสดีตอนเย็น วันนี้มีอะไรน่าจดจำไหม?',
        'คำทักทายอ่อนโยนก่อนจบวัน',
        'สวัสดี ขอให้คืนนี้นอนหลับฝันดี',
        'เช็คอินเย็น วันนี้พอแล้วจริง ๆ',
        'แสงเย็นนุ่มนวล ถึงเวลาผ่อนลง',
        'ราตรีสวัสดิ์ พักได้เมื่อไหร่ก็พัก',
        'วันกำลังปิด คุณวางมันลงได้',
        'สวัสดีตอนเย็น พรุ่งนี้ไม่ต้องแก้คืนนี้',
      ],
    },
    'zh': {
      TimeBucket.morning: [
        '早上好。愿你有一个轻柔的开始。',
        '清晨一句问候，送给你。',
        '早上好。今天准备好开始了吗？',
        '安静的早晨。祝你这一天平和。',
        '早上好。今天想怎样开始呢？',
        '早晨到了。不必着急。',
        '给新一天的一句问候。',
        '早上好。你可以按自己的节奏走。',
        '晨光里：对自己温柔一点。',
        '早上好。一步一步就够了。',
      ],
      TimeBucket.afternoon: [
        '下午好。一天过半，你感觉如何？',
        '下午了，记得给自己一点休息。',
        '你好。今天下午还好吗？',
        '午间一句问候。你还好吗？',
        '下午好。此刻的心情如何？',
        '来自午后的一声你好。',
        '下午在继续。你可以停一下。',
        '午后轻声问候。',
        '今天到现在，还好吗？',
        '午后小记：休息也算前进。',
      ],
      TimeBucket.evening: [
        '晚上好。今天过得怎么样？',
        '夜晚到了，愿你好好休息。',
        '晚上好。今天有什么值得记住的吗？',
        '临睡前一句轻柔的问候。',
        '你好。愿你今夜安睡。',
        '晚间打卡。今天已经够了。',
        '夜色柔和。是时候放慢一点。',
        '今晚好。能休息就休息。',
        '这一天在收尾。你可以放下了。',
        '晚上好。明天的事不必今晚解决。',
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
