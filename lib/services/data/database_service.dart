import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DbPath {
  static const String cats = 'cats';
  static const String userColl = 'users';
  static const String statsDoc = '--stats--';
}

class DatabaseService {
  // Firestore instance
  static final _inst = FirebaseFirestore.instance;
  // Document reference of the current logged in user
  static late DocumentReference userDoc;

  DatabaseService(String uid) {
    userDoc = _inst.collection(DbPath.userColl).doc(uid);
  }

  /// Cat operations
  // Future<void> createOrUpdateCat(Cat cat) {}

  static Future<List<Cat>?> getCats({String? searchQuery}) async {
    final result = await userDoc.collection(DbPath.cats).limit(5).get();
    return result.docs.map((e) => Cat.fromJson(e.data())).toList();
  }
}
