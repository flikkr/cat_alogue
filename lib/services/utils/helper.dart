import 'dart:math';

class Helper {
  static int randBetween(int min, int max) {
    final _rand = Random();
    return min + _rand.nextInt(max - min);
  }
}
