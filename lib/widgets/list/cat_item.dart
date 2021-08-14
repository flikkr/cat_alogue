import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/services/utils/route_generator.dart';
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
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.cat_detail, arguments: cat),
        child: Padding(
          padding: StiloEdge.all2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cat.profileImg?.display(height: 70, width: 70) ?? Container(),
              StiloSpacing.all2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
