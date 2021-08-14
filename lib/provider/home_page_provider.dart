import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/repositories/cat/cat_repository.dart';
import 'package:cat_alogue/services/data/database_service.dart';
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
