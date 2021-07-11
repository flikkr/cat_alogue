import 'dart:math';

import 'package:cat_alogue/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CatDetailHeader implements SliverPersistentHeaderDelegate {
  final Cat cat;

  CatDetailHeader(this.cat);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Image.network(
          'https://picsum.photos/200/300',
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 100 - shrinkOffset,
          child: Text(
            'This is ${cat.name}.',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -100 + shrinkOffset,
          child: Opacity(
            opacity: titleOpacity(shrinkOffset),
            child: CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage(cat.profileImgPath!),
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    // return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
