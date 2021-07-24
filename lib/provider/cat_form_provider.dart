import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/location/location.dart' as Loc;
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cat_alogue/services/data/local_database.dart';
import 'package:cat_alogue/services/utils/geo.dart';
import 'package:cat_alogue/services/utils/helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:uuid/uuid.dart';

var catProvider = StateProvider.autoDispose<Cat>((_) => Cat());

var catFormProvider = Provider.autoDispose<CatFormProvider>((ref) {
  return CatFormProvider(ref.read);
});

class CatFormProvider {
  final Reader _read;
  CatFormProvider(this._read);

  Future<void> initState(Cat? cat) async {
    await Future.microtask(() => _read(catProvider).state = cat ?? Cat());
  }

  Future<void> getAddressFromLocation() async {
    final loc = await Geo.getLocation();
    if (loc != null) {
      final placemark =
          (await placemarkFromCoordinates(loc.latitude!, loc.longitude!)).first;

      _read(catProvider).state = _read(catProvider).state.copyWith(
            location: Loc.Location(
              address:
                  '${placemark.street}, ${placemark.administrativeArea} ${placemark.country}',
            ),
          );
    }
  }

  Future<void> getProfileImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _read(catProvider).state = _read(catProvider).state.copyWith(
            profileImg: MediaItem(
              urlPath: image.path,
              type: MediaType.image,
              source: MediaSource.local,
            ),
          );
    }
  }

  Future saveCat() async {
    var cat = _read(catProvider).state;

    // Check name not empty
    if (cat.name == '') {
      throw fb_storage.FirebaseException(
          plugin: 'Firestore',
          message: 'Cat must have a name before saving to firestore');
    }
    // Choose a random avatar if no image is provided
    if (cat.profileImg == null) {
      final avatars = LocalDatabase.avatarPaths;
      final profileImg = MediaItem(
        urlPath: avatars![Helper.randBetween(0, avatars.length)],
        type: MediaType.image,
        source: MediaSource.app,
      );
      cat = cat.copyWith(profileImg: profileImg);
    }
    // Assign an id if the cat is new
    if (cat.id == null) {
      cat = cat.copyWith(id: const Uuid().v4());
    }

    try {
      if (cat.profileImg?.source == MediaSource.local) {
        final fb_storage.FirebaseStorage storage =
            fb_storage.FirebaseStorage.instance;
        final snapshot = await storage
            .ref('catProfile/')
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

      DatabaseService.userDoc
          .collection(DbPath.cats)
          .doc(cat.id)
          .set(cat.toJson());
    } catch (e) {
      print(e);
    }
  }
}
