import 'package:cat_alogue/models/util/gallery_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

var currentPageProvider;

class Gallery extends HookWidget {
  final GalleryOptions options;

  Gallery(this.options) {
    currentPageProvider = StateProvider.autoDispose<int>((_) => options.initialIndex!);
  }

  @override
  Widget build(BuildContext context) {
    int currentPage = useProvider(currentPageProvider);

    return PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(options.items![index].path!),
          initialScale: PhotoViewComputedScale.contained,
          heroAttributes: PhotoViewHeroAttributes(tag: options.initialIndex!),
        );
      },
      itemCount: options.items!.length,
      pageController: options.pageController,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
    );
  }
}
