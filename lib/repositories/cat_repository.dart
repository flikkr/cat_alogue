import 'dart:io';

import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/repositories/repository.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cat_alogue/services/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:uuid/uuid.dart';

class CatRepository extends IRepository<Cat> {
  final user = DatabaseService.userDoc;
  static QueryDocumentSnapshot? lastSnapshot;

  // Get the list of cats from the user
  Future<List<Cat>?> getCatList({int limit = 10}) async {
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

  @override
  Future<void> save(Cat cat) async {
    Cat catToSave = cat;

    // check cat name not empty
    if (cat.name.trim().isEmpty) {
      throw fb_storage.FirebaseException(
        plugin: 'Firestore',
        message: 'Cat must have a name before saving to firestore',
      );
    }

    // assign random profile image if none was chosen
    if (cat.profileImg == null) {
      catToSave = cat.copyWith(profileImg: Helper.getRandomProfileImage());
    }

    // assign an id if the cat is new
    if (cat.id == null) {
      catToSave = cat.copyWith(id: const Uuid().v4());
    }

    // assign the profile url
    if (cat.profileImg?.source == MediaSource.local) {
      final storage = fb_storage.FirebaseStorage.instance;
      final snapshot = await storage
          .ref('${DbPath.cats}/${cat.id}')
          .putFile(File(cat.profileImg!.urlPath));
      final url = await snapshot.ref.getDownloadURL();

      catToSave = cat.copyWith(
        profileImg: MediaItem(
          urlPath: url,
          type: MediaType.image,
          source: MediaSource.network,
        ),
      );
    }

    await DatabaseCollection.cats.doc(cat.id).set(catToSave.toJson());
  }

  @override
  Future<Cat?> get(String id) async {
    final _cat = await DatabaseCollection.cats.doc(id).get();
    final catData = _cat.data();

    if (catData == null) return null;
    return Cat.fromJson(catData as Map<String, dynamic>);
  }

  @override
  Future<void> delete(String id) async =>
      DatabaseCollection.cats.doc(id).delete();
}
