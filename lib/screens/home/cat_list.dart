import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/screens/home/cat_list_provider.dart';
import 'package:cat_alogue/widgets/list/cat_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatList extends ConsumerWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catList = ref.watch(catListProvider);

    return PagedListView(
      pagingController: catList.controller,
      builderDelegate: PagedChildBuilderDelegate<Cat>(
        itemBuilder: (context, Cat item, index) => CatItem(cat: item),
      ),
    );
  }
}
