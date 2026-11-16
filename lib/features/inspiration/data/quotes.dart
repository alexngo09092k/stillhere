import 'package:still_here/shared/models/check_in.dart';

class Quote {
  final String textVi;
  final String textEn;
  final String author;

  const Quote({
    required this.textVi,
    required this.textEn,
    this.author = '',
  });

  String text(String lang) => lang == 'vi' ? textVi : textEn;
}

/// Local inspiration library — differentiated content type for AppGallery 4.1.
class InspirationQuotes {
  InspirationQuotes._();

  static const List<Quote> general = [
    Quote(
      textVi: 'Bạn không cần phải ổn mọi lúc. Chỉ cần vẫn ở đây là đủ.',
      textEn: 'You do not have to be okay all the time. Being here is enough.',
    ),
    Quote(
      textVi: 'Những bước nhỏ mỗi ngày vẫn là bước tiến.',
      textEn: 'Small steps every day are still progress.',
    ),
    Quote(
      textVi: 'Cảm xúc đến rồi đi. Bạn vẫn ở lại.',
      textEn: 'Feelings come and go. You remain.',
    ),
    Quote(
      textVi: 'Hôm nay bạn đã cố gắng. Điều đó đáng được ghi nhận.',
      textEn: 'You showed up today. That counts.',
    ),
    Quote(
      textVi: 'Không có cảm xúc nào là sai. Chúng chỉ đang nói chuyện với bạn.',
      textEn: 'No feeling is wrong. They are simply speaking to you.',
    ),
    Quote(
      textVi: 'Nghỉ ngơi cũng là một dạng chăm sóc bản thân.',
      textEn: 'Rest is also a form of self-care.',
    ),
    Quote(
      textVi: 'Bạn xứng đáng được đối xử dịu dàng — kể cả bởi chính mình.',
      textEn: 'You deserve to be treated gently — especially by yourself.',
    ),
    Quote(
      textVi: 'Một ngày bình thường vẫn có thể là một ngày tốt.',
      textEn: 'An ordinary day can still be a good day.',
    ),
    Quote(
      textVi: 'Bạn đang học cách ở bên cạnh chính mình.',
      textEn: 'You are learning how to stay with yourself.',
    ),
    Quote(
      textVi: 'Thở sâu một cái. Bạn đang ở đây, ngay bây giờ.',
      textEn: 'Take one deep breath. You are here, right now.',
    ),
  ];

  static const List<Quote> ok = [
    Quote(
      textVi: 'Khi mọi thứ ổn, hãy lưu lại cảm giác này.',
      textEn: 'When things feel okay, save this feeling.',
    ),
    Quote(
      textVi: 'Niềm vui nhỏ cũng đáng được nâng niu.',
      textEn: 'Small joys deserve to be held carefully.',
    ),
    Quote(
      textVi: 'Hôm nay ánh sáng dịu. Cám ơn bạn đã nhận ra.',
      textEn: 'The light is soft today. Thank you for noticing.',
    ),
  ];

  static const List<Quote> share = [
    Quote(
      textVi: 'Chia sẻ không làm bạn yếu đi. Nó làm bạn thật hơn.',
      textEn: 'Sharing does not make you weaker. It makes you more real.',
    ),
    Quote(
      textVi: 'Bạn không phải giải quyết mọi thứ một mình.',
      textEn: 'You do not have to figure everything out alone.',
    ),
    Quote(
      textVi: 'Nói ra một chút đã là dũng cảm.',
      textEn: 'Saying even a little is already brave.',
    ),
  ];

  static const List<Quote> selfCare = [
    Quote(
      textVi: 'Chăm sóc bản thân không phải xa xỉ. Đó là cần thiết.',
      textEn: 'Self-care is not a luxury. It is a necessity.',
    ),
    Quote(
      textVi: 'Hôm nay hãy chọn điều dịu dàng với chính mình.',
      textEn: 'Today, choose something gentle for yourself.',
    ),
    Quote(
      textVi: 'Bạn đang làm việc tốt khi lắng nghe cơ thể và tâm trí.',
      textEn: 'You are doing well by listening to your body and mind.',
    ),
  ];

  static Quote daily({int? dayOfYear, String lang = 'vi'}) {
    final d = dayOfYear ??
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
