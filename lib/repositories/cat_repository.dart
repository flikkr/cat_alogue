import 'package:cat_alogue/models/cat/cat.dart';

abstract class ICatRepository {
  List<Cat> all();
}
