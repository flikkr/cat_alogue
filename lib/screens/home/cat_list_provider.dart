import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/repositories/cat_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

var catListProvider =
    StateNotifierProvider.autoDispose<CatListProvider, List<Cat>?>(
  (_) => CatListProvider(),
);

class CatListProvider extends StateNotifier<List<Cat>?> {
  static const int _pageSize = 10;

  final CatRepository repo = CatRepository();
  final PagingController<int, Cat> controller = PagingController(
    firstPageKey: 0,
  );

  CatListProvider() : super([]) {
    paginationFetchNext(0);
  }

  Future<void> refreshCatList() {
    throw UnimplementedError();
  }

  Future<void> paginationFetchNext(int pageKey) async {
    try {
      // ignore: avoid_redundant_argument_values
      final cats = await repo.getCatList(limit: _pageSize);

      if (cats == null) return;

      if (cats.length < _pageSize) {
        controller.appendLastPage(cats);
      } else {
        final nextPageKey = pageKey + cats.length;
        controller.appendPage(cats, nextPageKey);
      }

      state = controller.itemList;
    } catch (e) {}
  }

  Future<bool> deleteCat(String id) async {
    try {
      repo.delete(id);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> removeCatFromList(String id) async {
    controller.itemList!.removeWhere((cat) => cat.id == id);

    state = controller.itemList;
  }
}
