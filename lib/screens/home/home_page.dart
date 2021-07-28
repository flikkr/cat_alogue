import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:cat_alogue/widgets/menu/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: AppDrawer(),
      body: Container(
        padding: StiloEdge.all2,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.cat_list),
                child: const Text('View my cats'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.add_cat),
                child: const Text('New cat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
