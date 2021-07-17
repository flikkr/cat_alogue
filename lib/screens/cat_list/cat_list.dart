import 'package:cat_alogue/provider/session_provider.dart';
import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:cat_alogue/services/utils/surround.dart';
import 'package:cat_alogue/widgets/cat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CatList extends HookWidget with Surround {
  @override
  Widget build(BuildContext context) {
    var catList = useProvider(catProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My cats'),
      ),
      body: ListView(
        children: catList.map((cat) => CatListItem(cat: cat)).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Text('😺'),
        label: const Text('Add a cat'),
        onPressed: () => Navigator.of(context).pushNamed(Routes.add_cat),
      ),
    );
  }
}
