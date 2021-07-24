import 'package:cat_alogue/services/utils/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Random range between', () {
    for (var i = 0; i < 10; i++) {
      final result = Helper.randBetween(1, 4);
      print(result);
    }
  });
}
