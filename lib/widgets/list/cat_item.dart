import 'package:cat_alogue/models/cat/cat.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class CatItem extends StatelessWidget {
  final Cat cat;

  const CatItem({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: StiloEdge.all2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cat.profileImg?.display(height: 70, width: 70) ?? Container(),
            StiloSpacing.all2,
            Column(
              children: [
                Text(
                  cat.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  cat.description ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
