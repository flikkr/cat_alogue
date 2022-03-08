import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/repositories/cat/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

var catListPaginator = ChangeNotifierProvider.autoDispose<CatListPaginator>(
    (_) => CatListPaginator());

var homepageVm = Provider<HomePageVm>((ref) => HomePageVm(ref.read));

class CatListPaginator extends ChangeNotifier {
  static const int _pageSize = 10;
  final CatRepository _repo = CatRepository();
  final PagingController<int, Cat> controller =
      PagingController(firstPageKey: 0);

  CatListPaginator() {
    paginationFetchNext(0);
  }

  void refreshCatList() {
    throw UnimplementedError();
  }

  Future<void> paginationFetchNext(int pageKey) async {
    try {
      final cats = await _repo.getCatList();

      if (cats.length < _pageSize) {
        controller.appendLastPage(cats);
      } else {
        final nextPageKey = pageKey + cats.length;
        controller.appendPage(cats, nextPageKey);
      }
    } catch (e) {
      
    }

    notifyListeners();
  }
}

class HomePageVm {
  final Reader _read;

  HomePageVm(this._read);
}
