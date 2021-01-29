import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/screens/cat_list/form/cat_form.dart';
import 'package:cat_alogue/utils/surround.dart';
import 'package:cat_alogue/widgets/loading/cat_loader.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/all.dart';

var catListProvider = Provider.autoDispose<List<Cat>>((_) => []);

class CatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cats'),
      ),
      body: Container(
        child: CatLoader(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Text('😺'),
        label: Text('Add a cat'),
        isExtended: true,
        onPressed: () => Surround(context).showBottomSheet(CatForm()),
      ),
    );
  }
}
