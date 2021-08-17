import 'package:cat_alogue/models/media_item/media_item.dart';

class Encounter {
  final String? description;
  final List<MediaItem>? media;
  final DateTime date;

  Encounter({
    required this.date,
    this.description,
    this.media,
  });
}
