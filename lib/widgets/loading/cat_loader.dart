import 'package:cat_alogue/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class CatLoader extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    return Center(
      child: Lottie.asset(
        Assets.lottie.catPreloader,
        controller: controller,
        frameRate: FrameRate(60),
        width: 100,
        onLoaded: (comp) {
          controller.repeat();
        },
      ),
    );
  }
}
