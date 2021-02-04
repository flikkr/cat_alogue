import 'package:cat_alogue/models/cat.dart';
import 'package:flutter/material.dart';

class CatDetailContent extends StatelessWidget {
  final Cat cat;

  CatDetailContent(this.cat);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverList(
        delegate: SliverChildListDelegate([
        ]),
      ),
    );
  }
}
