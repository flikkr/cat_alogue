/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsAvatarsGen {
  const $AssetsAvatarsGen();

  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/avatars/avatar1.png');
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/avatars/avatar2.png');
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/avatars/avatar3.png');
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/avatars/avatar4.png');
  AssetGenImage get avatar5 =>
      const AssetGenImage('assets/avatars/avatar5.png');
  AssetGenImage get avatar6 =>
      const AssetGenImage('assets/avatars/avatar6.png');
}

class $AssetsImgGen {
  const $AssetsImgGen();

  AssetGenImage get cat1 => const AssetGenImage('assets/img/cat1.jpg');
  AssetGenImage get cat2 => const AssetGenImage('assets/img/cat2.jpg');
  AssetGenImage get cat3 => const AssetGenImage('assets/img/cat3.jpg');
  AssetGenImage get cat4 => const AssetGenImage('assets/img/cat4.jpg');
  AssetGenImage get cat5 => const AssetGenImage('assets/img/cat5.jpg');
}

class $AssetsInfoGen {
  const $AssetsInfoGen();

  AssetGenImage get catAmico =>
      const AssetGenImage('assets/info/cat-amico.png');
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  String get catPreloader => 'assets/lottie/cat-preloader.json';
}

class Assets {
  Assets._();

  static const $AssetsAvatarsGen avatars = $AssetsAvatarsGen();
  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsInfoGen info = $AssetsInfoGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
