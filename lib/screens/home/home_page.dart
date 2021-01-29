import 'package:cat_alogue/widgets/loading/cat_loader.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cats'),
      ),
      body: CatLoader(),
    );
  }
}
