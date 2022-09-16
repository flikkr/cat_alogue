import 'package:cat_alogue/models/encounter/encounter.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/screens/encounter_detail/encounter_media_tile.dart';
import 'package:cat_alogue/widgets/menu/navbar.dart';
import 'package:cat_alogue/widgets/screen_result/no_encounters_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stilo/stilo.dart';

class EncounterDetailScreen extends StatelessWidget {
  static const int videoSize = 2;
  static const int imageSize = 1;

  final Encounter encounter;

  const EncounterDetailScreen({
    required this.encounter,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      appBar: Navbar(
        title: 'Encounter',
        centerTitle: false,
        actions: [
          Center(
            child: Padding(
              padding: StiloEdge.horiz2,
              child: Text(DateFormat('dd/MM/yyyy').format(encounter.date)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: StiloEdge.all2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                encounter.description ?? '',
                style: Theme.of(context).textTheme.headline5,
              ),
              StiloSpacing.all2,
              getEncounterListOutput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getEncounterListOutput() {
    final mediaList = encounter.media;

    if (mediaList == null || mediaList.isEmpty) {
      return const NoEncountersFound();
    }

    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: mediaList.map(
        (media) {
          final tileSize = media.type == MediaType.image ? 1 : 2;

          return StaggeredGridTile.count(
            key: key,
            crossAxisCellCount: tileSize,
            mainAxisCellCount: tileSize,
            child: EncounterMediaTile(mediaItem: media),
          );
        },
      ).toList(),
    );
  }
}
