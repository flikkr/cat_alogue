import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatRepository {
  final user = DatabaseService.userDoc;
  static QueryDocumentSnapshot? lastSnapshot;
  
  Future<List<Cat>> getCatList({int limit = 10}) async {
    QuerySnapshot<Map<String, dynamic>> queryResult;

    if (lastSnapshot == null) {
      queryResult = await user.collection(DbPath.cats).limit(limit).get();
    } else {
      queryResult = await user
          .collection(DbPath.cats)
          .limit(limit)
          .startAfterDocument(lastSnapshot!)
          .get();
    }

    lastSnapshot = queryResult.docs.last;
    return queryResult.docs.map((e) => Cat.fromJson(e.data())).toList();
  }
}
