import 'package:cat_alogue/utils/route_generator.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: Container(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Animations'),
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.sample_animations),
          )
        ],
      ),
    );
  }
}
