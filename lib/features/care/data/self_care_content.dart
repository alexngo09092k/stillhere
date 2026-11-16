import 'package:still_here/shared/models/check_in.dart';

/// One timed step inside a guided session.
class CareStep {
  final Map<String, String> text;
  final int seconds;

  const CareStep({required this.text, required this.seconds});

  String label(String lang) => text[lang] ?? text['en'] ?? text.values.first;
}

/// A self-care idea that can be opened as a guided timed session.
class SelfCareIdea {
  final Map<String, String> titles;
  final Map<String, String> bodies;
  final String emoji;
  final int minutes;
  final List<CareStep> steps;

  const SelfCareIdea({
    required this.titles,
    required this.bodies,
    required this.emoji,
    this.minutes = 5,
    this.steps = const [],
  });

  /// Backward-compatible constructors used by existing content.
  factory SelfCareIdea.legacy({
    required String titleVi,
    required String titleEn,
    required String bodyVi,
    required String bodyEn,
    required String emoji,
    int minutes = 5,
    List<CareStep> steps = const [],
  }) {
    return SelfCareIdea(
      titles: {'vi': titleVi, 'en': titleEn},
      bodies: {'vi': bodyVi, 'en': bodyEn},
      emoji: emoji,
      minutes: minutes,
      steps: steps,
    );
  }

  String title(String lang) =>
      titles[lang] ?? titles['en'] ?? titles.values.first;
  String body(String lang) =>
      bodies[lang] ?? bodies['en'] ?? bodies.values.first;

  bool get isGuided => steps.isNotEmpty;
  int get totalSeconds =>
      steps.isEmpty ? minutes * 60 : steps.fold(0, (a, s) => a + s.seconds);
}

/// Self-care toolkit — exercises with optional guided steps (AppGallery 4.1 depth).
class SelfCareContent {
  SelfCareContent._();

  static CareStep step(
    int sec,
    String en,
    String vi, [
    String? th,
    String? zh,
  ]) {
    return CareStep(
      seconds: sec,
      text: {
        'en': en,
        'vi': vi,
        if (th != null) 'th': th,
        if (zh != null) 'zh': zh,
      },
    );
  }

  static SelfCareIdea idea({
    required String emoji,
    required int minutes,
    required String enTitle,
    required String viTitle,
    String? thTitle,
    String? zhTitle,
    required String enBody,
    required String viBody,
    String? thBody,
    String? zhBody,
    required List<CareStep> steps,
  }) {
    return SelfCareIdea(
      emoji: emoji,
      minutes: minutes,
      titles: {
        'en': enTitle,
        'vi': viTitle,
        if (thTitle != null) 'th': thTitle,
        if (zhTitle != null) 'zh': zhTitle,
      },
      bodies: {
        'en': enBody,
        'vi': viBody,
        if (thBody != null) 'th': thBody,
        if (zhBody != null) 'zh': zhBody,
      },
      steps: steps,
    );
  }

  // ---- Guided breathing ----
  static final List<SelfCareIdea> breathing = [
    idea(
      emoji: '🌬️',
      minutes: 3,
      enTitle: '4-7-8 Breathing',
      viTitle: 'Thở 4-7-8',
      thTitle: 'หายใจ 4-7-8',
      zhTitle: '4-7-8 呼吸',
      enBody:
          'Inhale 4 · hold 7 · exhale 8. Four gentle rounds to settle the nervous system.',
      viBody: 'Hít 4 · giữ 7 · thở ra 8. Bốn vòng nhẹ để hệ thần kinh dịu lại.',
      thBody: 'หายใจเข้า 4 · กลั้น 7 · หายใจออก 8 ทำ 4 รอบอย่างนุ่มนวล',
      zhBody: '吸气4 · 屏息7 · 呼气8。四轮轻柔练习，帮助放松。',
      steps: [
        step(
          8,
          'Sit comfortably. Soften your shoulders.',
          'Ngồi thoải mái. Thả lỏng vai.',
          'นั่งสบาย ๆ ผ่อนไหล่',
          '舒适坐好，放松双肩。',
        ),
        step(
          4,
          'Inhale quietly through the nose for 4…',
          'Hít nhẹ qua mũi đếm 4…',
          'หายใจเข้าทางจมูก นับ 4…',
          '用鼻子轻轻吸气，数到4…',
        ),
        step(
          7,
          'Hold the breath gently for 7…',
          'Giữ hơi nhẹ nhàng đếm 7…',
          'กลั้นหายใจเบา ๆ นับ 7…',
          '轻轻屏住呼吸，数到7…',
        ),
        step(
          8,
          'Exhale slowly through the mouth for 8…',
          'Thở ra chậm qua miệng đếm 8…',
          'ค่อย ๆ หายใจออกทางปาก นับ 8…',
          '用嘴缓缓呼气，数到8…',
        ),
        step(
          4,
          'Inhale again for 4…',
          'Hít vào lần nữa đếm 4…',
          'หายใจเข้าอีกครั้ง นับ 4…',
          '再次吸气，数到4…',
        ),
        step(7, 'Hold for 7…', 'Giữ 7…', 'กลั้น 7…', '屏息7…'),
        step(8, 'Exhale for 8…', 'Thở ra 8…', 'หายใจออก 8…', '呼气8…'),
        step(
          10,
          'Notice how your body feels. No need to change anything.',
          'Cảm nhận cơ thể. Không cần thay đổi gì.',
          'สังเกตร่างกาย ไม่ต้องเปลี่ยนอะไร',
          '感受身体，无需改变什么。',
        ),
      ],
    ),
    idea(
      emoji: '📦',
      minutes: 4,
      enTitle: 'Box Breathing',
      viTitle: 'Thở hộp (Box breathing)',
      thTitle: 'หายใจแบบกล่อง',
      zhTitle: '方盒呼吸',
      enBody:
          'Inhale 4 · hold 4 · exhale 4 · hold 4. Steady rhythm when you feel tense.',
      viBody: 'Hít 4 · giữ 4 · thở ra 4 · giữ 4. Nhịp đều khi đang căng.',
      thBody: 'เข้า 4 · กลั้น 4 · ออก 4 · กลั้น 4 เหมาะตอนตึงเครียด',
      zhBody: '吸4 · 屏4 · 呼4 · 屏4。紧张时很有效。',
      steps: [
        step(
          5,
          'Breathe out fully once to reset.',
          'Thở hết một hơi để reset.',
          'หายใจออกให้สุดหนึ่งครั้ง',
          '先完全呼气一次。',
        ),
        step(4, 'Inhale for 4…', 'Hít vào 4…', 'หายใจเข้า 4…', '吸气4…'),
        step(4, 'Hold for 4…', 'Giữ 4…', 'กลั้น 4…', '屏息4…'),
        step(4, 'Exhale for 4…', 'Thở ra 4…', 'หายใจออก 4…', '呼气4…'),
        step(
          4,
          'Hold empty for 4…',
          'Giữ phổi trống 4…',
          'กลั้นว่าง 4…',
          '空肺屏息4…',
        ),
        step(4, 'Inhale 4…', 'Hít 4…', 'เข้า 4…', '吸4…'),
        step(4, 'Hold 4…', 'Giữ 4…', 'กลั้น 4…', '屏4…'),
        step(4, 'Exhale 4…', 'Thở ra 4…', 'ออก 4…', '呼4…'),
        step(4, 'Hold 4…', 'Giữ 4…', 'กลั้น 4…', '屏4…'),
        step(
          8,
          'Return to a natural breath. You did enough.',
          'Trở lại nhịp thở tự nhiên. Bạn đã đủ rồi.',
          'กลับไปหายใจตามธรรมชาติ พอแล้ว',
          '恢复自然呼吸。已经足够了。',
        ),
      ],
    ),
  ];

  // ---- Guided grounding ----
  static final List<SelfCareIdea> grounding = [
    idea(
      emoji: '🌍',
      minutes: 3,
      enTitle: '5-4-3-2-1 Grounding',
      viTitle: '5-4-3-2-1 Grounding',
      thTitle: '5-4-3-2-1 ตั้งสติ',
      zhTitle: '5-4-3-2-1 落地练习',
      enBody:
          'Five senses back to the present: see, touch, hear, smell, taste.',
      viBody: 'Năm giác quan về hiện tại: nhìn, chạm, nghe, ngửi, nếm.',
      thBody: 'ใช้ห้าประสาทกลับสู่ปัจจุบัน: เห็น สัมผัส ฟัง กลิ่น รส',
      zhBody: '用五感回到当下：看、触、听、闻、尝。',
      steps: [
        step(
          12,
          'Name 5 things you can see right now.',
          'Kể 5 thứ bạn đang nhìn thấy.',
          'บอก 5 สิ่งที่เห็นตอนนี้',
          '说出此刻能看到的5样东西。',
        ),
        step(
          12,
          'Notice 4 things you can touch.',
          'Cảm nhận 4 thứ bạn có thể chạm.',
          'สัมผัส 4 สิ่งที่จับได้',
          '感受能触摸到的4样东西。',
        ),
        step(
          12,
          'Listen for 3 sounds around you.',
          'Lắng nghe 3 âm thanh quanh bạn.',
          'ฟัง 3 เสียงรอบตัว',
          '聆听周围的3种声音。',
        ),
        step(
          10,
          'Find 2 scents — even subtle ones.',
          'Tìm 2 mùi — dù rất nhẹ.',
          'หา 2 กลิ่น แม้จาง ๆ',
          '找2种气味，哪怕很淡。',
        ),
        step(
          10,
          'Notice 1 taste, or take a slow sip of water.',
          'Nhận 1 vị, hoặc uống một ngụm nước chậm.',
          'รับรู้ 1 รส หรือจิบน้ำช้า ๆ',
          '感受1种味道，或慢慢喝一口水。',
        ),
        step(
          8,
          'You are here, in this moment.',
          'Bạn đang ở đây, trong khoảnh khắc này.',
          'คุณอยู่ที่นี่ ในขณะนี้',
          '你就在这里，在这一刻。',
        ),
      ],
    ),
    idea(
      emoji: '🦶',
      minutes: 2,
      enTitle: 'Feel your feet',
      viTitle: 'Cảm nhận bàn chân',
      thTitle: 'รู้สึกที่ฝ่าเท้า',
      zhTitle: '感受双脚',
      enBody:
          'Notice where your feet meet the ground. One quiet minute of contact.',
      viBody: 'Cảm nhận điểm tiếp xúc bàn chân với mặt đất. Một phút yên lặng.',
      thBody: 'สัมผัสจุดที่ฝ่าเท้าแตะพื้น หนึ่งนาทีเงียบ ๆ',
      zhBody: '感受脚掌与地面的接触。安静一分钟。',
      steps: [
        step(
          8,
          'Stand or sit with both feet on the floor.',
          'Đứng hoặc ngồi, hai bàn chân chạm sàn.',
          'ยืนหรือนั่ง เท้าทั้งสองแตะพื้น',
          '站或坐，双脚着地。',
        ),
        step(
          15,
          'Press gently into the heels, then the toes.',
          'Nhấn nhẹ gót, rồi mũi chân.',
          'กดส้นเบา ๆ แล้วกดปลายเท้า',
          '轻轻压脚跟，再压脚尖。',
        ),
        step(
          20,
          'Breathe slowly. Stay with the contact points.',
          'Thở chậm. Ở lại với điểm tiếp xúc.',
          'หายใจช้า ๆ อยู่กับจุดสัมผัส',
          '慢慢呼吸，停留在接触点上。',
        ),
        step(
          10,
          'Thank your body for holding you today.',
          'Cảm ơn cơ thể đã nâng đỡ bạn hôm nay.',
          'ขอบคุณร่างกายที่พยุงคุณวันนี้',
          '感谢身体今天支撑着你。',
        ),
      ],
    ),
  ];

  // ---- Gentle micro-practices ----
  static final List<SelfCareIdea> gentle = [
    idea(
      emoji: '💧',
      minutes: 2,
      enTitle: 'Drink water slowly',
      viTitle: 'Uống nước chậm',
      thTitle: 'ดื่มน้ำช้า ๆ',
      zhTitle: '慢慢喝水',
      enBody: 'One glass, no rush. A small act of care that is still real.',
      viBody: 'Một cốc, không vội. Hành động nhỏ nhưng thật.',
      thBody: 'หนึ่งแก้ว ไม่รีบ การดูแลเล็ก ๆ ที่จริงใจ',
      zhBody: '一杯水，不着急。小小的、真实的照顾。',
      steps: [
        step(
          5,
          'Hold a glass of water if you can.',
          'Cầm một cốc nước nếu được.',
          'ถือแก้วน้ำถ้าได้',
          '如果可以，拿起一杯水。',
        ),
        step(
          20,
          'Take three slow sips. Feel the temperature.',
          'Uống ba ngụm chậm. Cảm nhận nhiệt độ.',
          'จิบช้าสามครั้ง รู้สึกอุณหภูมิ',
          '慢慢喝三口，感受温度。',
        ),
        step(
          10,
          'Pause. That was enough.',
          'Dừng lại. Thế là đủ.',
          'หยุด พอแล้ว',
          '停一下。已经够了。',
        ),
      ],
    ),
    idea(
      emoji: '👀',
      minutes: 2,
      enTitle: 'Soft gaze rest',
      viTitle: 'Nghỉ mắt dịu',
      thTitle: 'พักสายตานุ่มนวล',
      zhTitle: '柔和护眼',
      enBody: 'Look far away for 20 seconds. Let eye muscles unclench.',
      viBody: 'Nhìn xa 20 giây. Để cơ mắt được nghỉ.',
      thBody: 'มองไกล 20 วินาที ให้กล้ามเนื้อตาผ่อน',
      zhBody: '远眺20秒，让眼部肌肉放松。',
      steps: [
        step(
          5,
          'Unfocus from the screen.',
          'Rời mắt khỏi màn hình.',
          'ละสายตาจากหน้าจอ',
          '把视线从屏幕移开。',
        ),
        step(
          20,
          'Look at something distant. Soft eyes.',
          'Nhìn một vật ở xa. Mắt dịu.',
          'มองของที่ไกล ๆ ตานุ่ม',
          '看向远处，眼神放软。',
        ),
        step(
          10,
          'Blink slowly a few times. Return when ready.',
          'Chớp mắt chậm vài lần. Quay lại khi sẵn sàng.',
          'กระพริบช้า ๆ กลับเมื่อพร้อม',
          '慢慢眨眼几次，准备好再回来。',
        ),
      ],
    ),
    idea(
      emoji: '🤲',
      minutes: 3,
      enTitle: 'Hand on heart',
      viTitle: 'Tay trên tim',
      thTitle: 'มือบนหัวใจ',
      zhTitle: '手贴胸口',
      enBody:
          'Place a hand on your chest. Feel the rise and fall of the breath.',
      viBody: 'Đặt tay lên ngực. Cảm nhận nhịp thở lên xuống.',
      thBody: 'วางมือบนอก รู้สึกการหายใจขึ้นลง',
      zhBody: '将手贴在胸口，感受呼吸起伏。',
      steps: [
        step(
          8,
          'Place one hand gently on your chest.',
          'Đặt một tay nhẹ lên ngực.',
          'วางมือหนึ่งเบา ๆ บนอก',
          '将一只手轻轻放在胸口。',
        ),
        step(
          25,
          'Feel the breath under your palm. No need to deepen it.',
          'Cảm nhận hơi thở dưới lòng bàn tay. Không cần thở sâu hơn.',
          'รู้สึกลมหายใจใต้ฝ่ามือ ไม่ต้องหายใจลึกขึ้น',
          '感受掌下的呼吸，不必刻意加深。',
        ),
        step(
          12,
          'Silently say: “I am allowed to pause.”',
          'Thầm nói: “Mình được phép dừng lại.”',
          'พูดในใจ: “ฉันมีสิทธิ์หยุดพัก”',
          '在心里说：“我可以停一下。”',
        ),
      ],
    ),
  ];

  static List<SelfCareIdea> get allGuided => [
    ...breathing,
    ...grounding,
    ...gentle,
  ];

  /// Suggestions tuned to today's mood (if any).
  static List<SelfCareIdea> forStatus(CheckInStatus? status) {
    switch (status) {
      case CheckInStatus.ok:
        return [...gentle.take(2), breathing.first];
      case CheckInStatus.share:
        return [grounding.first, gentle.first, breathing.first];
      case CheckInStatus.selfCare:
        return [breathing.first, grounding.first, gentle.last];
      case null:
        return [breathing.first, grounding.first, gentle.first];
    }
  }
}
