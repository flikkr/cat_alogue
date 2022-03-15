import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/widgets/misc/media_badge.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class EncounterMediaTile extends StatelessWidget {
  final MediaItem mediaItem;

  static const double badgeOffset = 6;

  const EncounterMediaTile({
    Key? key,
    required this.mediaItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: key,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: StiloBorderRadius.allMd,
          ),
          child: mediaItem.display(
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
        Positioned(
          top: badgeOffset,
          left: badgeOffset,
          child: MediaBadge(mediaType: mediaItem.type),
        ),
      ],
    );
  }
}
