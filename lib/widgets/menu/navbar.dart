import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final String title;

  const Navbar({this.title = 'My screen'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
