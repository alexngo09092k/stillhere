import 'package:still_here/shared/models/check_in.dart';

class Quote {
  final Map<String, String> texts;
  final String author;

  const Quote({required this.texts, this.author = ''});

  factory Quote.bi({
    required String textVi,
    required String textEn,
    String? textTh,
    String? textZh,
    String author = '',
  }) {
    return Quote(
      author: author,
      texts: {
        'vi': textVi,
        'en': textEn,
        if (textTh != null) 'th': textTh,
        if (textZh != null) 'zh': textZh,
      },
    );
  }

  String text(String lang) => texts[lang] ?? texts['en'] ?? texts.values.first;
}

/// Local inspiration library — original copy for AppGallery 4.1 depth.
class InspirationQuotes {
  InspirationQuotes._();

  static final List<Quote> general = [
    Quote.bi(
      textVi: 'Bạn không cần phải ổn mọi lúc. Chỉ cần vẫn ở đây là đủ.',
      textEn: 'You do not have to be okay all the time. Being here is enough.',
      textTh: 'คุณไม่ต้องโอเคตลอดเวลา แค่ยังอยู่ตรงนี้ก็พอ',
      textZh: '你不必每时每刻都很好。还在这里，就够了。',
    ),
    Quote.bi(
      textVi: 'Những bước nhỏ mỗi ngày vẫn là bước tiến.',
      textEn: 'Small steps every day are still progress.',
      textTh: 'ก้าวเล็ก ๆ ทุกวันก็ยังคือความก้าวหน้า',
      textZh: '每天的小步，仍然是前进。',
    ),
    Quote.bi(
      textVi: 'Cảm xúc đến rồi đi. Bạn vẫn ở lại.',
      textEn: 'Feelings come and go. You remain.',
      textTh: 'อารมณ์มาแล้วไป แต่คุณยังอยู่',
      textZh: '情绪来了又走。你还在。',
    ),
    Quote.bi(
      textVi: 'Hôm nay bạn đã cố gắng. Điều đó đáng được ghi nhận.',
      textEn: 'You showed up today. That counts.',
      textTh: 'วันนี้คุณมาแล้ว นั่นมีค่า',
      textZh: '你今天出现了。这很重要。',
    ),
    Quote.bi(
      textVi: 'Không có cảm xúc nào là sai. Chúng chỉ đang nói chuyện với bạn.',
      textEn: 'No feeling is wrong. They are simply speaking to you.',
      textTh: 'ไม่มีอารมณ์ไหนผิด มันแค่กำลังพูดกับคุณ',
      textZh: '没有一种情绪是错的。它们只是在和你说话。',
    ),
    Quote.bi(
      textVi: 'Nghỉ ngơi cũng là một dạng chăm sóc bản thân.',
      textEn: 'Rest is also a form of self-care.',
      textTh: 'การพักก็คือการดูแลตัวเองรูปแบบหนึ่ง',
      textZh: '休息也是一种自我照顾。',
    ),
    Quote.bi(
      textVi: 'Bạn xứng đáng được đối xử dịu dàng — kể cả bởi chính mình.',
      textEn: 'You deserve to be treated gently — especially by yourself.',
      textTh: 'คุณคู่ควรกับการถูกปฏิบัติอย่างนุ่มนวล — โดยเฉพาะจากตัวเอง',
      textZh: '你值得被温柔对待——尤其是被自己。',
    ),
    Quote.bi(
      textVi: 'Một ngày bình thường vẫn có thể là một ngày tốt.',
      textEn: 'An ordinary day can still be a good day.',
      textTh: 'วันธรรมดาก็ยังเป็นวันที่ดีได้',
      textZh: '平凡的一天，也可以是好的一天。',
    ),
    Quote.bi(
      textVi: 'Bạn đang học cách ở bên cạnh chính mình.',
      textEn: 'You are learning how to stay with yourself.',
      textTh: 'คุณกำลังเรียนรู้ที่จะอยู่กับตัวเอง',
      textZh: '你在学习如何陪伴自己。',
    ),
    Quote.bi(
      textVi: 'Thở sâu một cái. Bạn đang ở đây, ngay bây giờ.',
      textEn: 'Take one deep breath. You are here, right now.',
      textTh: 'หายใจลึกหนึ่งครั้ง คุณอยู่ที่นี่ ตอนนี้',
      textZh: '深呼吸一次。你就在这里，就在此刻。',
    ),
    Quote.bi(
      textVi: 'Không cần hoàn hảo để được nghỉ.',
      textEn: 'You do not need to be perfect to rest.',
      textTh: 'ไม่ต้องสมบูรณ์แบบถึงจะพักได้',
      textZh: '不必完美才有资格休息。',
    ),
    Quote.bi(
      textVi: 'Hôm nay đủ là hôm nay đủ.',
      textEn: 'Enough for today is enough.',
      textTh: 'พอสำหรับวันนี้ก็พอแล้ว',
      textZh: '今天够了，就是够了。',
    ),
  ];

  static final List<Quote> ok = [
    Quote.bi(
      textVi: 'Khi mọi thứ ổn, hãy lưu lại cảm giác này.',
      textEn: 'When things feel okay, save this feeling.',
      textTh: 'เมื่อทุกอย่างโอเค เก็บความรู้สึกนี้ไว้',
      textZh: '当事情还好时，把这种感觉收好。',
    ),
    Quote.bi(
      textVi: 'Niềm vui nhỏ cũng đáng được nâng niu.',
      textEn: 'Small joys deserve to be held carefully.',
      textTh: 'ความสุขเล็ก ๆ ก็คู่ควรแก่การทะนุถนอม',
      textZh: '小小的快乐，也值得被好好捧着。',
    ),
    Quote.bi(
      textVi: 'Hôm nay ánh sáng dịu. Cảm ơn bạn đã nhận ra.',
      textEn: 'The light is soft today. Thank you for noticing.',
      textTh: 'วันนี้แสงนุ่ม ขอบคุณที่คุณสังเกต',
      textZh: '今天的光很柔。谢谢你注意到了。',
    ),
    Quote.bi(
      textVi: 'Ổn cũng là một cảm xúc đáng ghi lại.',
      textEn: 'Okay is also a feeling worth recording.',
      textTh: '“โอเค” ก็เป็นความรู้สึกที่ควรบันทึก',
      textZh: '“还好”也是值得记录的心情。',
    ),
  ];

  static final List<Quote> share = [
    Quote.bi(
      textVi: 'Chia sẻ không làm bạn yếu đi. Nó làm bạn thật hơn.',
      textEn: 'Sharing does not make you weaker. It makes you more real.',
      textTh: 'การแบ่งปันไม่ได้ทำให้คุณอ่อนแอ มันทำให้คุณจริงขึ้น',
      textZh: '倾诉不会让你变弱。它让你更真实。',
    ),
    Quote.bi(
      textVi: 'Bạn không phải giải quyết mọi thứ một mình.',
      textEn: 'You do not have to figure everything out alone.',
      textTh: 'คุณไม่ต้องจัดการทุกอย่างคนเดียว',
      textZh: '你不必独自想通所有事。',
    ),
    Quote.bi(
      textVi: 'Nói ra một chút đã là dũng cảm.',
      textEn: 'Saying even a little is already brave.',
      textTh: 'พูดออกมาแม้เล็กน้อยก็กล้าหาญแล้ว',
      textZh: '哪怕只说一点点，也已经勇敢。',
    ),
    Quote.bi(
      textVi: 'Được lắng nghe là một nhu cầu, không phải sự xin xỏ.',
      textEn: 'Being heard is a need, not a favor.',
      textTh: 'การได้ถูกฟังคือความต้องการ ไม่ใช่การขอร้อง',
      textZh: '被听见是一种需要，不是求来的恩惠。',
    ),
  ];

  static final List<Quote> selfCare = [
    Quote.bi(
      textVi: 'Chăm sóc bản thân không phải xa xỉ. Đó là cần thiết.',
      textEn: 'Self-care is not a luxury. It is a necessity.',
      textTh: 'การดูแลตัวเองไม่ใช่ความฟุ่มเฟือย มันจำเป็น',
      textZh: '自我照顾不是奢侈，而是必需。',
    ),
    Quote.bi(
      textVi: 'Hôm nay hãy chọn điều dịu dàng với chính mình.',
      textEn: 'Today, choose something gentle for yourself.',
      textTh: 'วันนี้เลือกสิ่งที่นุ่มนวลกับตัวเอง',
      textZh: '今天，为自己选一件温柔的事。',
    ),
    Quote.bi(
      textVi: 'Bạn đang làm việc tốt khi lắng nghe cơ thể và tâm trí.',
      textEn: 'You are doing well by listening to your body and mind.',
      textTh: 'คุณกำลังทำได้ดีเมื่อฟังร่างกายและจิตใจ',
      textZh: '倾听身体和内心，你已经做得很好。',
    ),
    Quote.bi(
      textVi: 'Năm phút chăm sóc vẫn đáng giá.',
      textEn: 'Five minutes of care still matter.',
      textTh: 'ห้านาทีแห่งการดูแลก็ยังสำคัญ',
      textZh: '五分钟的照顾，仍然有意义。',
    ),
  ];

  static Quote daily({int? dayOfYear, String lang = 'vi'}) {
    final d =
        dayOfYear ??
        DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
    return general[d.abs() % general.length];
  }

  static Quote forStatus(CheckInStatus? status, {int seed = 0}) {
    final list = switch (status) {
      CheckInStatus.ok => ok,
      CheckInStatus.share => share,
      CheckInStatus.selfCare => selfCare,
      null => general,
    };
    final pool = [...list, ...general];
    return pool[seed.abs() % pool.length];
  }
}
