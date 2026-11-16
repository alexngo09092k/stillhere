import 'package:still_here/shared/models/check_in.dart';

class SelfCareIdea {
  final String titleVi;
  final String titleEn;
  final String bodyVi;
  final String bodyEn;
  final String emoji;
  final int minutes;

  const SelfCareIdea({
    required this.titleVi,
    required this.titleEn,
    required this.bodyVi,
    required this.bodyEn,
    required this.emoji,
    this.minutes = 5,
  });

  String title(String lang) => lang == 'vi' ? titleVi : titleEn;
  String body(String lang) => lang == 'vi' ? bodyVi : bodyEn;
}

/// Self-care toolkit content — a distinct content type (exercises + ideas).
class SelfCareContent {
  SelfCareContent._();

  static const List<SelfCareIdea> breathing = [
    SelfCareIdea(
      titleVi: 'Thở 4-7-8',
      titleEn: '4-7-8 Breathing',
      bodyVi:
          'Hít vào đếm 4. Giữ hơi đếm 7. Thở ra đếm 8. Lặp lại 4 vòng. Giúp hệ thần kinh dịu lại.',
      bodyEn:
          'Inhale for 4. Hold for 7. Exhale for 8. Repeat 4 rounds. Helps calm the nervous system.',
      emoji: '🌬️',
      minutes: 3,
    ),
    SelfCareIdea(
      titleVi: 'Thở hộp (Box breathing)',
      titleEn: 'Box Breathing',
      bodyVi:
          'Hít 4 giây → giữ 4 giây → thở ra 4 giây → giữ 4 giây. Lặp 4–6 lần. Rất tốt khi đang căng.',
      bodyEn:
          'Inhale 4s → hold 4s → exhale 4s → hold 4s. Repeat 4–6 times. Great when tense.',
      emoji: '📦',
      minutes: 4,
    ),
  ];

  static const List<SelfCareIdea> grounding = [
    SelfCareIdea(
      titleVi: '5-4-3-2-1 Grounding',
      titleEn: '5-4-3-2-1 Grounding',
      bodyVi:
          'Nhìn 5 thứ bạn thấy. Chạm 4 thứ. Nghe 3 âm thanh. Ngửi 2 mùi. Nếm 1 vị. Đưa bạn trở về hiện tại.',
      bodyEn:
          'Name 5 things you see. 4 you can touch. 3 you hear. 2 you smell. 1 you taste. Returns you to the present.',
      emoji: '🌍',
      minutes: 3,
    ),
    SelfCareIdea(
      titleVi: 'Cảm nhận bàn chân',
      titleEn: 'Feel your feet',
      bodyVi:
          'Ngồi hoặc đứng. Tập trung vào điểm tiếp xúc của bàn chân với mặt đất. Thở chậm 1 phút.',
      bodyEn:
          'Sit or stand. Notice where your feet meet the ground. Breathe slowly for 1 minute.',
      emoji: '🦶',
      minutes: 2,
    ),
  ];

  static const List<SelfCareIdea> gentle = [
    SelfCareIdea(
      titleVi: 'Uống một cốc nước chậm',
      titleEn: 'Drink a glass of water slowly',
      bodyVi: 'Không vội. Cảm nhận nước. Đây là hành động chăm sóc nhỏ nhưng thật.',
      bodyEn: 'No rush. Feel the water. A small but real act of care.',
      emoji: '💧',
      minutes: 2,
    ),
    SelfCareIdea(
      titleVi: 'Viết 3 điều biết ơn',
      titleEn: 'Write 3 things you are grateful for',
      bodyVi: 'Không cần lớn lao. Có thể là ánh nắng, một tin nhắn, hoặc việc bạn vẫn ở đây.',
      bodyEn: 'They need not be big. Sunlight, a message, or simply that you are still here.',
      emoji: '🙏',
      minutes: 5,
    ),
    SelfCareIdea(
      titleVi: 'Đi bộ 5 phút',
      titleEn: 'Walk for 5 minutes',
      bodyVi: 'Ra ngoài hoặc trong nhà. Chỉ cần di chuyển và thở.',
      bodyEn: 'Outside or indoors. Just move and breathe.',
      emoji: '🚶',
      minutes: 5,
    ),
    SelfCareIdea(
      titleVi: 'Tắt thông báo 15 phút',
      titleEn: 'Mute notifications for 15 minutes',
      bodyVi: 'Cho não bộ một khoảng yên tĩnh. Bạn xứng đáng được không bị làm gián đoạn.',
      bodyEn: 'Give your mind a quiet window. You deserve uninterrupted time.',
      emoji: '🔕',
      minutes: 15,
    ),
    SelfCareIdea(
      titleVi: 'Ôm gối hoặc ôm chính mình',
      titleEn: 'Hold a pillow or yourself',
      bodyVi: 'Áp lực nhẹ lên cơ thể giúp hệ thần kinh cảm thấy an toàn hơn.',
      bodyEn: 'Gentle pressure on the body can help the nervous system feel safer.',
      emoji: '🤗',
      minutes: 2,
    ),
    SelfCareIdea(
      titleVi: 'Nghe một bài nhạc dịu',
      titleEn: 'Listen to one gentle song',
      bodyVi: 'Chọn bài bạn thích. Chỉ ngồi nghe hết bài, không làm việc khác.',
      bodyEn: 'Pick a song you like. Just listen all the way through.',
      emoji: '🎵',
      minutes: 4,
    ),
  ];

  static const List<SelfCareIdea> forShare = [
    SelfCareIdea(
      titleVi: 'Nhắn một người bạn tin tưởng',
      titleEn: 'Message someone you trust',
      bodyVi: 'Không cần giải thích hết. Chỉ cần “Hôm nay mình hơi nặng lòng”.',
      bodyEn: 'You do not need the full story. “Today feels heavy” is enough.',
      emoji: '💬',
      minutes: 5,
    ),
    SelfCareIdea(
      titleVi: 'Viết ra những gì đang rối',
      titleEn: 'Write down what feels tangled',
      bodyVi: 'Không sửa câu. Không cần hay. Chỉ để mọi thứ ra khỏi đầu.',
      bodyEn: 'No editing. No polish. Just get it out of your head.',
      emoji: '📝',
      minutes: 7,
    ),
  ];

  static const List<SelfCareIdea> forSelfCare = [
    SelfCareIdea(
      titleVi: 'Cho phép bản thân nghỉ',
      titleEn: 'Allow yourself to rest',
      bodyVi: 'Bạn không cần “xứng đáng” mới được nghỉ. Nghỉ là quyền.',
      bodyEn: 'You do not need to “earn” rest. Rest is a right.',
      emoji: '🛏️',
      minutes: 10,
    ),
    SelfCareIdea(
      titleVi: 'Tắm nước ấm hoặc rửa mặt chậm',
      titleEn: 'Warm shower or slow face wash',
      bodyVi: 'Cảm nhận nước. Đây là cách cơ thể được chăm sóc trực tiếp.',
      bodyEn: 'Feel the water. Direct care for the body.',
      emoji: '🚿',
      minutes: 10,
    ),
  ];

  static List<SelfCareIdea> forStatus(CheckInStatus? status) {
    switch (status) {
      case CheckInStatus.share:
        return [...forShare, ...gentle, ...grounding];
      case CheckInStatus.selfCare:
        return [...forSelfCare, ...gentle, ...breathing, ...grounding];
      case CheckInStatus.ok:
        return [...gentle, ...breathing];
      case null:
        return [...gentle, ...breathing, ...grounding];
    }
  }

  static List<SelfCareIdea> allExercises() => [
        ...breathing,
        ...grounding,
        ...gentle,
      ];
}
