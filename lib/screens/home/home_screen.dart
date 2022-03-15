import 'package:cat_alogue/screens/home/cat_list.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:cat_alogue/widgets/menu/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Sidemenu(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(Routes.cat_form),
        label: const Text('Add cat 😺'),
      ),
      body: Container(
        padding: StiloEdge.all2,
        child: const Center(child: CatList()),
      ),
    );
  }
}
