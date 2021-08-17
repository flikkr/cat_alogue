import 'package:cat_alogue/gen/assets.gen.dart';
import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/provider/home_page_provider.dart';
import 'package:cat_alogue/screens/home/cat_list_provider.dart';
import 'package:cat_alogue/widgets/display/subtitle_image.dart';
import 'package:cat_alogue/widgets/list/cat_item.dart';
import 'package:cat_alogue/widgets/loading/cat_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteCatList extends HookWidget {
  const InfiniteCatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catPaginator = useProvider(catListPaginator);

    return PagedListView(
      pagingController: catPaginator.controller,
      builderDelegate: PagedChildBuilderDelegate<Cat>(
        itemBuilder: (context, Cat item, index) => CatItem(cat: item),
      ),
    );

    // final catList = useProvider(catListFutureProvider);

    // return catList.when(
    //   data: (cats) {
    //     if (cats == null || cats.isEmpty) {
    //       return SubtitleImage(
    //         image: Image.asset(Assets.info.catAmico.path),
    //         subtitle: 'No cats found!',
    //       );
    //     }
    //     return PagedListView(pagingController: pagingController, builderDelegate: builderDelegate)
    //     return ListView(
    //       children: cats.map((cat) => CatItem(cat: cat)).toList(),
    //     );
    //   },
    //   loading: () => CatLoader(),
    //   error: (error, stackTrace) => Container(),
    // );
  }
}
