import 'package:flutter/material.dart';

class Navbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const Navbar({this.title = 'My screen'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
