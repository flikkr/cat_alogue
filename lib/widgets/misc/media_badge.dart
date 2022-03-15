import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class MediaBadge extends StatelessWidget {
  final MediaType mediaType;

  const MediaBadge({required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black54,
      ),
      child: Center(
        child: Padding(
          padding: StiloEdge.all1,
          child: Icon(
            mediaType == MediaType.video
                ? Icons.play_arrow
                : Icons.image_outlined,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
