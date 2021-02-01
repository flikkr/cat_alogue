import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/utils/route_generator.dart';
import 'package:flutter/material.dart';

class CatListItem extends StatelessWidget {
  final Cat cat;

  CatListItem({@required this.cat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cat.name),
      subtitle: Text(cat.description),
      onTap: () => Navigator.of(context).pushNamed(
        Routes.cat_detail,
        arguments: cat,
      ),
    );
  }
}
