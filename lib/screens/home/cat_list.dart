import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/screens/home/cat_list_provider.dart';
import 'package:cat_alogue/widgets/list/cat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteCatList extends HookWidget {
  const InfiniteCatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catList = useProvider(catListProvider);

    return PagedListView(
      pagingController: catList.controller,
      builderDelegate: PagedChildBuilderDelegate<Cat>(
        itemBuilder: (context, Cat item, index) => CatItem(cat: item),
      ),
    );
  }
}
