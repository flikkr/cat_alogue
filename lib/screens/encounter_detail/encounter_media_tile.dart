import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/widgets/misc/media_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stilo/stilo.dart';

class EncounterMediaTile extends StatelessWidget {
  final MediaItem mediaItem;

  late final int tileSize;
  static const double badgeOffset = 6;

  EncounterMediaTile({
    Key? key,
    required this.mediaItem,
  }) : super(key: key) {
    tileSize = mediaItem.type == MediaType.image ? 1 : 2;
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: tileSize,
      mainAxisCellCount: tileSize,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: StiloBorderRadius.allMd,
            ),
            child: Image.network(
              mediaItem.urlPath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: badgeOffset,
            left: badgeOffset,
            child: MediaBadge(mediaType: mediaItem.type),
          ),
        ],
      ),
    );
  }
}
