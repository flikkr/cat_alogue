import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/interface/database_model.dart';

abstract class IRepository {
  List<IDatabaseModel> all();
}
