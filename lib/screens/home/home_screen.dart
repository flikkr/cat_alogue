import 'package:cat_alogue/screens/home/cat_list.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:cat_alogue/widgets/menu/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(Routes.add_cat),
        label: const Text('Add cat 😺'),
      ),
      body: Container(
        padding: StiloEdge.all2,
        child: Center(child: CatList()),
      ),
    );
  }
}
