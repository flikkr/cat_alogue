import 'package:cat_alogue/models/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';

class Cat {
  String? name;
  String? description;
  bool isFavourite;
  String? profileImgPath;
  List<MediaItem>? media;

  Cat({
    this.name,
    this.description,
    this.isFavourite = false,
    this.profileImgPath,
    this.media,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isFavourite': isFavourite,
    };
  }

  static Future<void> create(Cat cat) {
    return DatabaseService.userDoc.collection(DbPath.cats).add(cat.toMap());
  }

  @override
  String toString() =>
      'Cat(name: $name, description: $description, isFavourite: $isFavourite)';
}
