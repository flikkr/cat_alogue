import 'package:cat_alogue/models/media_item/media_item.dart';

class Encounter {
  final String title;
  final String? description;
  final List<MediaItem>? media;
  final DateTime created;

  Encounter({
    required this.title,
    required this.created,
    this.description,
    this.media,
  });
}
