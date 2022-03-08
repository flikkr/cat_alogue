import 'package:cat_alogue/services/auth/auth.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            // ignore: use_named_constants
            padding: const EdgeInsets.all(0),
            child: Container(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('Animations'),
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.sample_animations),
          ),
          ListTile(
            title: const Text('Debug'),
            onTap: () => Navigator.of(context).pushNamed(Routes.debug_screen),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () => signOut(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
