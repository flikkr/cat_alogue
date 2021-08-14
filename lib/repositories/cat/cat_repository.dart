import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatRepository {
  final user = DatabaseService.userDoc;
  static QueryDocumentSnapshot? lastSnapshot;

  Future<List<Cat>> getInitialList({int limit = 10}) async {
    final result = await user.collection(DbPath.cats).limit(limit).get();
    lastSnapshot = result.docs.last;
    return result.docs.map((e) => Cat.fromJson(e.data())).toList();
  }

  Future<List<Cat>> getNextList({int limit = 10}) async {
    if (lastSnapshot == null) {
      return getInitialList(limit: limit);
    }

    final result = await user
        .collection(DbPath.cats)
        .limit(limit)
        .startAfterDocument(lastSnapshot!)
        .get();
    lastSnapshot = result.docs.last;
    return result.docs.map((e) => Cat.fromJson(e.data())).toList();
  }
}
