import 'dart:math';

import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/services/data/local_database.dart';

class Helper {
  static int randBetween(int min, int max) {
    final _rand = Random();
    return min + _rand.nextInt(max - min);
  }

  static MediaItem getRandomProfileImage() {
    final avatars = LocalDatabase.avatarPaths;
    return MediaItem(
      urlPath: avatars![randBetween(0, avatars.length)],
      type: MediaType.image,
      source: MediaSource.app,
    );
  }
}
