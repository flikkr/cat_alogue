import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/screens/cat_detail/cat_detail_content.dart';
import 'package:cat_alogue/screens/cat_detail/cat_detail_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cat_detail_provider.dart';

var catDetailProvider =
    ChangeNotifierProvider.autoDispose.family<CatDetailProvider, Cat>(
  (_, cat) => CatDetailProvider(cat),
);

class CatDetail extends HookWidget {
  final Cat cat;

  CatDetail(this.cat);

  @override
  Widget build(BuildContext context) {
    var catProvider = useProvider(catDetailProvider(cat));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              title: Text('asdasd'),
              expandedHeight: 200,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        //opacity: top == 80.0 ? 1.0 : 0.0,
                        opacity: 1.0,
                        child: Text(
                          constraints.biggest.height.toString(),
                          style: TextStyle(fontSize: 12.0),
                        )),
                    background: Image.network(
                      "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                      fit: BoxFit.cover,
                    ));
              })
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
              //     Positioned(
              //       left: 0,
              //       right: 0,
              //       bottom: -100 + shrinkOffset,
              //       child: Opacity(
              //         opacity: titleOpacity(shrinkOffset),
              //         child: CircleAvatar(
              //           maxRadius: 100,
              //           backgroundImage: AssetImage(cat.imagePath),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // expandedHeight: 200,
              ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   floating: true,
          //   delegate: CatDetailHeader(cat),
          // ),
          CatDetailContent(cat),
          SliverPadding(
            padding: const EdgeInsets.all(4),
            sliver: SliverStaggeredGrid.countBuilder(
              crossAxisCount: 4,
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) => Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('$index'),
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
    );
  }
}
