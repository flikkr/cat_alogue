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
}
