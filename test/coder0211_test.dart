import 'package:coder0211/coder0211.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = BaseUtils.reversedNumber(number: 1234);
    expect(counter, 4321);
  });
}
