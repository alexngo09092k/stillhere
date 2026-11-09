import 'package:flutter_test/flutter_test.dart';
import 'package:still_here/shared/models/check_in.dart';

void main() {
  test('CheckInStatus values stable for storage', () {
    expect(CheckInStatus.ok.name, 'ok');
    expect(CheckInStatus.share.name, 'share');
    expect(CheckInStatus.selfCare.name, 'selfCare');
  });
}
