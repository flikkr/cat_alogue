import 'package:cat_alogue/models/cat.dart';

abstract class ICatRepository {
  List<Cat> all();
}
