import 'package:cat_alogue/models/cat/cat.dart';
import 'package:flutter/material.dart';

class CatDetailContent extends StatelessWidget {
  final Cat cat;

  const CatDetailContent(this.cat);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([]),
    );
  }
}
