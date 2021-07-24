import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:flutter/material.dart';

class CatListItem extends StatelessWidget {
  final Cat cat;

  const CatListItem({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cat.name),
        subtitle: cat.description != null ? Text(cat.description!) : null,
        onTap: () => Navigator.of(context).pushNamed(
          Routes.cat_detail,
          arguments: cat,
        ),
      ),
    );
  }
}
