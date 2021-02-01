import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/interface/cat_repository.dart';
import 'package:cat_alogue/widgets/cat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class CatListProvider extends StateNotifier<List<Cat>> {
  ICatRepository catRepository;

  CatListProvider(this.catRepository) : super(catRepository.all());

  List<Widget> displayCats() {
    return state.map((cat) => CatListItem(cat: cat)).toList();
  }
}
