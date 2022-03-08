import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/encounter/encounter.dart';
import 'package:cat_alogue/models/gallery_options.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:cat_alogue/widgets/list/encounter_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stilo/stilo.dart';

class CatDetail extends HookWidget {
  final Cat cat;

  const CatDetail(this.cat);

  @override
  Widget build(BuildContext context) {
    // var catProvider = useProvider(catDetailProvider!(cat));
    final controller = useScrollController();

    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(onPressed: onPressed, label: label),
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: 1.0,
                    child: Text(cat.name),
                  ),
                  background: GestureDetector(
                    onTap: () {
                      if (cat.profileImg == null) return;
                      Navigator.of(context).pushNamed(
                        Routes.gallery_view,
                        arguments: GalleryOptions(
                          items: [cat.profileImg!],
                        ),
                      );
                    },
                    child: cat.profileImg?.display(),
                  ),
                ),
              ),
              SliverPadding(
                padding: StiloEdge.all1,
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      5,
                      (index) => EncounterTile(
                        encounter: Encounter(
                            date: DateTime.now(),
                            description: 'short encounter with stretchy',
                            media: [
                              MediaItem(
                                urlPath: 'https://picsum.photos/200/300',
                                type: MediaType.image,
                                source: MediaSource.network,
                              ),
                              MediaItem(
                                urlPath: 'https://picsum.photos/200/300',
                                type: MediaType.image,
                                source: MediaSource.network,
                              ),
                              MediaItem(
                                urlPath: 'https://picsum.photos/200/300',
                                type: MediaType.image,
                                source: MediaSource.network,
                              ),
                              MediaItem(
                                urlPath: 'https://picsum.photos/200/300',
                                type: MediaType.image,
                                source: MediaSource.network,
                              ),
                            ]),
                        isFirst: index == 0,
                        isLast: index == 4,
                      ),
                    ),
                  ),
                ),
                // sliver: SliverStaggeredGrid.countBuilder(
                //   crossAxisCount: 4,
                //   // itemCount: cat.media?.length ?? 0,
                //   itemCount: 10,
                //   itemBuilder: (BuildContext context, int index) => Hero(
                //     tag: index,
                //     child: Material(
                //       clipBehavior: Clip.antiAlias,
                //       borderRadius: BorderRadius.circular(10),
                //       child: InkWell(
                //         onTap: () => Navigator.of(context).pushNamed(
                //           Routes.gallery_view,
                //           arguments: GalleryOptions(
                //             initialIndex: index,
                //             items: cat.media,
                //           ),
                //         ),
                //         child: Image.asset(
                //           cat.media![index].urlPath,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //   ),
                //   staggeredTileBuilder: (int index) =>
                //       StaggeredTile.count(2, index.isEven ? 2 : 3),
                //   mainAxisSpacing: 4.0,
                //   crossAxisSpacing: 4.0,
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
