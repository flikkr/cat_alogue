import 'package:cat_alogue/data/cat_image.dart';
import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/repositories/cat_repository.dart';

class MockCatData extends ICatRepository {
  @override
  List<Cat> all() {
    return [
      Cat(
        name: 'Shifty',
        description: 'A really shifty kitty',
        profileImg: MediaItem(
          urlPath: 'assets/img/cat1.jpg',
          type: MediaType.image,
          source: MediaSource.app,
        ),
        media: mockImages,
      ),
      Cat(
        name: 'Pinky',
        description: 'A really pinky kitty',
        profileImg: MediaItem(
          urlPath: 'assets/img/cat2.jpg',
          type: MediaType.image,
          source: MediaSource.app,
        ),
        media: mockImages,
      ),
      Cat(
        name: 'Lola',
        description: 'A fat whiny kitty',
        profileImg: MediaItem(
          urlPath: 'assets/img/cat3.jpg',
          type: MediaType.image,
          source: MediaSource.app,
        ),
        media: mockImages,
      ),
    ];
  }
}
