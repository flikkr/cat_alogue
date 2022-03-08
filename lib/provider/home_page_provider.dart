import 'package:hooks_riverpod/hooks_riverpod.dart';

var homepageProvider =
    Provider<HomePageProvider>((ref) => HomePageProvider(ref.read));

class HomePageProvider {
  final Reader _read;
  HomePageProvider(this._read);

  void refreshCatList() {
    throw UnimplementedError();
  }

  void paginationFetchNext() {
    throw UnimplementedError();
  }
}
