import 'dart:io';

import 'package:cat_alogue/models/location/location.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cat_alogue/services/data/local_database.dart';
import 'package:cat_alogue/services/utils/helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:uuid/uuid.dart';

part 'cat.freezed.dart';
part 'cat.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
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
