import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/repositories/cat/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

var catListProvider = ChangeNotifierProvider.autoDispose<CatListProvider>(
  (_) => CatListProvider(),
);

class CatListProvider extends ChangeNotifier {
  static const int _pageSize = 10;
  final CatRepository repo = CatRepository();
  final PagingController<int, Cat> controller =
      PagingController(firstPageKey: 0);

  CatListProvider() {
    paginationFetchNext(0);
  }

  Future<void> refreshCatList() {
    throw UnimplementedError();
  }

  Future<void> paginationFetchNext(int pageKey) async {
    try {
      // ignore: avoid_redundant_argument_values
      final cats = await repo.getCatList(limit: _pageSize);

      if (cats.length < _pageSize) {
        controller.appendLastPage(cats);
      } else {
        final nextPageKey = pageKey + cats.length;
        controller.appendPage(cats, nextPageKey);
      }
    } catch (e) {}

    notifyListeners();
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

    notifyListeners();
  }
}
