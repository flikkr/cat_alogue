import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/location/location.dart' as location;
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/repositories/cat/cat_repository.dart';
import 'package:cat_alogue/services/utils/geo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
      _read(catProvider).state = _read(catProvider).state.copyWith(
            profileImg: MediaItem(
              urlPath: image.path,
              type: MediaType.image,
              source: MediaSource.local,
            ),
          );
    }
  }

  Future<void> saveCat() async => CatRepository().save(
        _read(catProvider).state,
      );
}
