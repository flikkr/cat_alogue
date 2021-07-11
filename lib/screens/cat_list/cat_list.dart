import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/repositories/mock_cat_data.dart';
import 'package:cat_alogue/services/utils/surround.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cat_list_provider.dart';

AutoDisposeStateNotifierProvider<CatListProvider, dynamic>? catListProvider = StateNotifierProvider.autoDispose(
  (_) => CatListProvider(MockCatData()),
);

class CatList extends HookWidget with Surround {
  @override
  Widget build(BuildContext context) {
    var catList = useProvider(catListProvider!);

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
        onPressed: () => showCatForm(context),
      ),
    );
  }
}
