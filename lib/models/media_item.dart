import 'dart:io';

import 'package:flutter/material.dart';

/// Defines the source type of the file
enum MediaType { image, video }

/// Defines the source type of the file
///
/// [MediaSource.network] refers to files fetched externally through the network (e.g. website)
/// [MediaSource.local] refers to files fetched locally on the users device
/// [MediaSource.appDefault] refers to files that are contained in the app itself
/// (e.g. placeholder images for trips)
enum MediaSource { network, local, appDefault }

class MediaItem {
  /// File path or url of the resource file
  final String path;
  final DateTime created = DateTime.now();
  final MediaType type;
  final MediaSource source;
  final Widget subtitle;

  Future<bool> get doesExist async => await File(this.path).exists();

  MediaItem({
    this.path,
    this.type,
    this.source,
    this.subtitle,
  });

  MediaItem copyWith({
    String path,
    String subtitle,
    MediaSource source,
    MediaType type,
  }) {
    return MediaItem(
      path: path ?? this.path,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      source: source ?? this.source,
    );
  }

  Widget get imageWidget {
    if (type == MediaType.image) {
      switch (source) {
        case MediaSource.appDefault:
          return Image.asset(path, fit: BoxFit.cover);
          break;
        case MediaSource.local:
          return Image.file(File(path), fit: BoxFit.cover);
          break;
        case MediaSource.network:
          return Image.network(path, fit: BoxFit.cover);
          break;
      }
    } else {
      //TODO: Implement video playback
      return Container();
    }
  }
}
