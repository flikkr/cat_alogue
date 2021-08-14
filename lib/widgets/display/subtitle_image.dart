import 'package:flutter/material.dart';

class SubtitleImage extends StatelessWidget {
  final String subtitle;
  final Image image;

  const SubtitleImage({
    Key? key,
    required this.image,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 250, child: image),
        Text(subtitle, style: Theme.of(context).textTheme.headline5)
      ],
    );
  }
}
