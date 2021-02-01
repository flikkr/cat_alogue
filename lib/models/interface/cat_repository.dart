import 'package:cat_alogue/models/interface/database_model.dart';

abstract class ICatRepository {
  List<IDatabaseModel> all();
}
