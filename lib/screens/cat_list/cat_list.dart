import 'package:cat_alogue/data/mock_cat_data.dart';
import 'package:cat_alogue/screens/cat_list/form/cat_form.dart';
import 'package:cat_alogue/utils/surround.dart';
import 'package:cat_alogue/widgets/loading/cat_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:riverpod/all.dart';

import 'cat_list_provider.dart';

var catListProvider = StateNotifierProvider.autoDispose<CatListProvider>(
    (_) => CatListProvider(MockCatData()));

class CatList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var catList = useProvider(catListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('My cats'),
      ),
      body: Container(
        child: ListView(
          children: catList.displayCats(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Text('😺'),
        label: Text('Add a cat'),
        isExtended: true,
        onPressed: () => Surround.of(context).showBottomSheet(CatForm()),
      ),
    );
  }
}
