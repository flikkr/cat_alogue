import 'package:cat_alogue/models/util/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';

class Cat {
  String? id;
  String? name;
  String? description;
  bool isFavourite;
  String? profileImgUrl;
  List<MediaItem>? media;

  Cat({
    this.id,
    this.name,
    this.description,
    this.isFavourite = false,
    this.profileImgUrl,
    this.media,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isFavourite': isFavourite,
    };
  }

  @override
  String toString() =>
      'Cat(name: $name, description: $description, isFavourite: $isFavourite)';
}
