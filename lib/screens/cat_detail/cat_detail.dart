import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/gallery_options.dart';
import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                  title: const AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: 1.0,
                    child: Text('Text'),
                  ),
                  background: cat.profileImg?.display(),
                ),
                // flexibleSpace: Stack(
                //   fit: StackFit.expand,
                //   clipBehavior: Clip.none,
                //   children: [
                //     Image.network(
                //       'https://picsum.photos/200/300',
                //       fit: BoxFit.cover,
                //     ),
                //     Positioned(
                //       top: 60,
                //       child: Text(
                //         'This is ${cat.name}.',
                //         style: Theme.of(context).textTheme.headline4,
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //     Container(
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: [Colors.transparent, Colors.black54],
                //           stops: [0.5, 1.0],
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter,
                //           tileMode: TileMode.repeated,
                //         ),
                //       ),
                //     ),
                // Positioned(
                //   left: 0,
                //   right: 0,
                //   bottom: -100 + shrinkOffset,
                //   child: Opacity(
                //     opacity: titleOpacity(shrinkOffset),
                //     child: CircleAvatar(
                //       maxRadius: 100,
                //       backgroundImage: AssetImage(cat.imagePath),
                //     ),
                //   ),
                // ),
                //   ],
                // ),
              ),
              // SliverPersistentHeader(
              //   pinned: true,
              //   floating: true,
              //   delegate: CatDetailHeader(cat),
              // ),
              SliverPadding(
                padding: const EdgeInsets.all(4),
                sliver: SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 4,
                  // itemCount: cat.media?.length ?? 0,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Hero(
                    tag: index,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          Routes.gallery_view,
                          arguments: GalleryOptions(
                            initialIndex: index,
                            items: cat.media,
                          ),
                        ),
                        child: Image.asset(
                          cat.media![index].urlPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2 : 3),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
