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

  // MediaItem copyWith({
  //   String? path,
  //   String? subtitle,
  //   MediaSource? source,
  //   MediaType? type,
  // }) {
  //   return MediaItem(
  //     urlPath: path ?? this.urlPath,
  //     subtitle: subtitle as Widget? ?? this.subtitle,
  //     type: type ?? this.type,
  //     source: source ?? this.source,
  //   );
  // }

  Widget? display() {
    if (type == MediaType.image) {
      switch (source) {
        case MediaSource.app:
          return Image.asset(urlPath, fit: BoxFit.cover);
        case MediaSource.local:
          return Image.file(File(urlPath), fit: BoxFit.cover);
        case MediaSource.network:
          return Image.network(urlPath, fit: BoxFit.cover);
        default:
          return null;
      }
    } else {
      //TODO: Implement video playback
      return Container();
    }
  }

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);
}
