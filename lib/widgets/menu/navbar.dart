import 'package:flutter/material.dart';

class Navbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;

  const Navbar({
    this.title = 'My screen',
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
