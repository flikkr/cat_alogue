import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:cat_alogue/widgets/cat_list_item.dart';
import 'package:cat_alogue/widgets/list/cat_item.dart';
import 'package:cat_alogue/widgets/loading/cat_loader.dart';
import 'package:cat_alogue/widgets/menu/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';
import 'package:cat_alogue/provider/home_page_provider.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final catList = useProvider(catListFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(Routes.add_cat),
        label: const Text('Add cat 😺'),
      ),
      body: Container(
        padding: StiloEdge.all2,
        child: Center(
          child: catList.when(
            data: (cats) {
              if (cats == null || cats.isEmpty) {
                return const Text('Nothing');
              }
              return ListView(
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(Routes.cat_list),
                    child: const Text('View my cats'),
                  ),
                  ...cats.map((cat) => CatItem(cat: cat)).toList(),
                ],
              );
            },
            loading: () => CatLoader(),
            error: (error, stackTrace) => Container(),
          ),
        ),
      ),
    );
  }
}
