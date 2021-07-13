import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:cat_alogue/widgets/menu/app_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.cat_list),
                child: Text('View my cats'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.add_cat),
                child: Text('New cat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
