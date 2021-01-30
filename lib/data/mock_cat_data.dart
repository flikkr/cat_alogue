import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/interface/repository.dart';

class MockCatData extends IRepository {
  @override
  List<Cat> all() {
    return [
      Cat(name: 'Shifty', description: 'A really shifty kitty'),
      Cat(name: 'Pinky', description: 'A really pinky kitty'),
      Cat(name: 'Lola', description: 'A fat whiny kitty'),
    ];
  }
}
