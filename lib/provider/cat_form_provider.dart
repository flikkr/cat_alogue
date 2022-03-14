import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/location/location.dart' as location;
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/repositories/cat/cat_repository.dart';
import 'package:cat_alogue/services/utils/geo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

var catFormProvider =
    StateNotifierProvider.autoDispose.family<CatFormProvider, Cat, Cat?>(
  (ref, cat) {
    return CatFormProvider(cat);
  },
);

class CatFormProvider extends StateNotifier<Cat> {
  final CatRepository _repo;

  CatFormProvider(Cat? cat)
      : _repo = CatRepository(),
        super(cat ?? Cat());

  set cat(Cat cat) => state = cat;
  Cat get cat => state;

  Future<void> getAddressFromLocation() async {
    final loc = await Geo.getLocation();
    if (loc != null) {
      final placemark =
          (await placemarkFromCoordinates(loc.latitude!, loc.longitude!)).first;

      state = state.copyWith(
        location: location.Location(
          address:
              '${placemark.street}, ${placemark.administrativeArea} ${placemark.country}',
        ),
      );
    }
  }

  Future<void> getProfileImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      state = state.copyWith(
        profileImg: MediaItem(
          urlPath: image.path,
          type: MediaType.image,
          source: MediaSource.local,
        ),
      );
    }
  }

  /// Returns `true` if the cat has been successfully saved to the Firestore instance.
  Future<bool> saveCat() async {
    try {
      await _repo.save(state);
      return true;
    } on fb_storage.FirebaseException catch (e) {
      return false;
    }
  }
}
