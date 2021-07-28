import 'package:cat_alogue/models/location/location.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat.freezed.dart';
part 'cat.g.dart';

@freezed
class Cat with _$Cat {
  factory Cat({
    String? id,
    @Default('') String name,
    String? description,
    @Default(false) bool isFavourite,
    MediaItem? profileImg,
    Location? location,
    List<MediaItem>? media,
  }) = _Cat;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
}
