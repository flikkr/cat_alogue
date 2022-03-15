import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_item.g.dart';

/// Defines the source type of the file
enum MediaType {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
}

/// Defines the source type of the file
///
/// [MediaSource.network] refers to files fetched externally through the network (e.g. website)
/// [MediaSource.local] refers to files fetched locally on the users device
/// [MediaSource.app] refers to files that are contained in the app itself
/// (e.g. placeholder images)
enum MediaSource {
  @JsonValue('network')
  network,
  @JsonValue('local')
  local,
  @JsonValue('app')
  app,
}

@JsonSerializable(explicitToJson: true)
class MediaItem {
  /// File path or url of the resource file
  final String urlPath;
  final MediaType type;
  final MediaSource source;
  @JsonKey(ignore: true)
  final Widget? subtitle;
  late final DateTime created;

  Future<bool> get doesFileExist async => File(urlPath).exists();

  MediaItem({
    required this.urlPath,
    required this.type,
    required this.source,
    this.subtitle,
    DateTime? created,
  }) {
    this.created = created ?? DateTime.now();
  }

  Widget? display({
    double width = 100,
    double height = 100,
    BoxFit fit = BoxFit.cover,
  }) {
    if (type == MediaType.image) {
      ImageProvider imageProvider;

      switch (source) {
        case MediaSource.app:
          imageProvider = AssetImage(urlPath);
          break;
        case MediaSource.local:
          imageProvider = FileImage(File(urlPath));
          break;
        case MediaSource.network:
          imageProvider = NetworkImage(urlPath);
          break;
        default:
          return null;
      }

      return Image(
        image: imageProvider,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      //TODO: Implement video playback
      return Container();
    }
  }

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);
}
