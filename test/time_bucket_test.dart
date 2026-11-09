import 'package:flutter_test/flutter_test.dart';
import 'package:still_here/shared/models/greeting.dart';

void main() {
  group('TimeBucket.fromHour', () {
    test('morning 5-11', () {
      expect(TimeBucket.fromHour(5), TimeBucket.morning);
      expect(TimeBucket.fromHour(11), TimeBucket.morning);
    });
    test('afternoon 12-17', () {
      expect(TimeBucket.fromHour(12), TimeBucket.afternoon);
      expect(TimeBucket.fromHour(17), TimeBucket.afternoon);
    });
    test('evening otherwise', () {
      expect(TimeBucket.fromHour(18), TimeBucket.evening);
      expect(TimeBucket.fromHour(0), TimeBucket.evening);
    });
  });
}
