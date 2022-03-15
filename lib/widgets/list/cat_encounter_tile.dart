import 'package:cat_alogue/models/encounter/encounter.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EncounterTile extends StatelessWidget {
  final Encounter encounter;
  final bool isFirst;
  final bool isLast;
  final Function? onTap;

  const EncounterTile({
    Key? key,
    required this.encounter,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        color: Theme.of(context).primaryColor,
        padding: StiloEdge.all1,
        width: 26,
      ),
      endChild: Padding(
        padding: StiloEdge.all1,
        child: Material(
          borderRadius: StiloBorderRadius.allLg,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              Routes.encounter_detail,
              arguments: encounter,
            ),
            child: Padding(
              padding: StiloEdge.all2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (encounter.description != null)
                    Expanded(
                      child: Text(
                        encounter.description!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  Row(
                    children: encounter.media
                            ?.map(
                              (image) => Padding(
                                padding: StiloEdge.right1,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    borderRadius: StiloBorderRadius.allSm,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: image.display(),
                                ),
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
