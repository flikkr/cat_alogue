import 'package:flutter/material.dart';

import 'media_item.dart';

class GalleryOptions {
  final Decoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int? initialIndex;
  final PageController pageController;
  final List<MediaItem>? items;
  final Axis scrollDirection;

  GalleryOptions({
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    required this.items,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex ?? 0);
}
