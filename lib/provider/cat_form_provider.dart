import 'package:cat_alogue/services/utils/geo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var locationP = StateProvider.autoDispose<String?>((_) => null);
var imagePaths = StateProvider.autoDispose<List<String>?>((_) => null);

var catFormProvider =
    Provider.autoDispose<CatFormProvider>((ref) => CatFormProvider(ref.read));

class CatFormProvider {
  final Reader read;
  CatFormProvider(this.read);

  Future<void> getAddressFromLocation() async {
    var loc = await Geo.getLocation();
    if (loc != null) {
      var placemark =
          (await placemarkFromCoordinates(loc.latitude!, loc.longitude!)).first;

      read(locationP).state = '${placemark.street}, ${placemark.administrativeArea} ${placemark.country}';
    }
  }
}
