import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/interface/cat_repository.dart';
import 'package:cat_alogue/models/media_item.dart';

class MockCatData extends ICatRepository {
  var mockImages = [
    MediaItem(
      path: 'assets/img/cat1.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat2.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat3.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat1.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat2.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat3.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat1.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat2.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
    MediaItem(
      path: 'assets/img/cat3.jpg',
      source: MediaSource.local,
      type: MediaType.image,
    ),
  ];

  @override
  List<Cat> all() {
    return [
      Cat(
        name: 'Shifty',
        description: 'A really shifty kitty',
        profileImgPath: 'assets/img/cat1.jpg',
        media: mockImages,
      ),
      Cat(
        name: 'Pinky',
        description: 'A really pinky kitty',
        profileImgPath: 'assets/img/cat2.jpg',
        media: mockImages,
      ),
      Cat(
        name: 'Lola',
        description: 'A fat whiny kitty',
        profileImgPath: 'assets/img/cat3.jpg',
        media: mockImages,
      ),
    ];
  }
}
