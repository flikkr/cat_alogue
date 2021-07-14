import 'package:cat_alogue/models/util/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';

class Cat {
  String? id;
  String? name;
  String? description;
  bool isFavourite;
  String? profileImgPath;
  List<MediaItem>? media;


  Cat({
    this.id,
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

  static Future<void> delete(Cat cat) {
    return DatabaseService.userDoc.collection(DbPath.cats).doc(cat.id).delete();
  }

  @override
  String toString() =>
      'Cat(name: $name, description: $description, isFavourite: $isFavourite)';
}
