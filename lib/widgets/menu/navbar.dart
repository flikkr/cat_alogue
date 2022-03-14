import 'package:flutter/material.dart';

class Navbar extends StatelessWidget with PreferredSizeWidget {
  final bool centerTitle;
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;

  const Navbar({
    this.title = 'My screen',
    this.backgroundColor = Colors.transparent,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
