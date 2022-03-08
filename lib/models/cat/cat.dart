import 'dart:io';

import 'package:cat_alogue/models/location/location.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cat_alogue/services/data/local_database.dart';
import 'package:cat_alogue/services/utils/helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'cat.freezed.dart';
part 'cat.g.dart';

@freezed
class Cat with _$Cat {
  factory Cat({
    String? id,
    @Default('') String name,
    String? description,
    @Default(false) bool isFavourite,
    MediaItem? profileImg,
    Location? location,
    List<MediaItem>? media,
  }) = _Cat;
  // ignore: unused_element
  const Cat._();

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Future<void> save() async {
    Cat cat = this;

    // check cat name not empty
    if (cat.name.trim().isEmpty) {
      throw fb_storage.FirebaseException(
        plugin: 'Firestore',
        message: 'Cat must have a name before saving to firestore',
      );
    }

    // assign random profile image if none was chosen
    if (cat.profileImg == null) {
      cat = cat.copyWith(profileImg: _assignRandomProfileImage());
    }

    // Assign an id if the cat is new
    if (cat.id == null) {
      cat = cat.copyWith(id: const Uuid().v4());
    }

    if (cat.profileImg?.source == MediaSource.local) {
      final storage = fb_storage.FirebaseStorage.instance;
      final snapshot = await storage
          .ref('cats/${cat.id}')
          .putFile(File(cat.profileImg!.urlPath));
      final url = await snapshot.ref.getDownloadURL();

      cat = cat.copyWith(
        profileImg: MediaItem(
          urlPath: url,
          type: MediaType.image,
          source: MediaSource.network,
        ),
      );
    }

    await DatabaseService.userDoc
        .collection(DbPath.cats)
        .doc(cat.id)
        .set(cat.toJson());
  }

  MediaItem _assignRandomProfileImage() {
    final avatars = LocalDatabase.avatarPaths;
    return MediaItem(
      urlPath: avatars![Helper.randBetween(0, avatars.length)],
      type: MediaType.image,
      source: MediaSource.app,
    );
  }
}
