import 'package:cat_alogue/data/cat_image.dart';
import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/repositories/cat_repository.dart';

class MockCatData extends ICatRepository {
  @override
  List<Cat> all() {
    return [
      Cat(
        name: 'Shifty',
        description: 'A really shifty kitty',
        profileImgUrl: 'assets/img/cat1.jpg',
        media: mockImages,
      ),
      Cat(
        name: 'Pinky',
        description: 'A really pinky kitty',
        profileImgUrl: 'assets/img/cat2.jpg',
        media: mockImages,
      ),
      Cat(
        name: 'Lola',
        description: 'A fat whiny kitty',
        profileImgUrl: 'assets/img/cat3.jpg',
        media: mockImages,
      ),
    ];
  }
}
