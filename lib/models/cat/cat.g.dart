// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cat _$_$_CatFromJson(Map<String, dynamic> json) {
  return _$_Cat(
    id: json['id'] as String?,
    name: json['name'] as String? ?? '',
    description: json['description'] as String?,
    isFavourite: json['isFavourite'] as bool? ?? false,
    profileImg: json['profileImg'] == null
        ? null
        : MediaItem.fromJson(json['profileImg'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    media: (json['media'] as List<dynamic>?)
        ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CatToJson(_$_Cat instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isFavourite': instance.isFavourite,
      'profileImg': instance.profileImg?.toJson(),
      'location': instance.location?.toJson(),
      'media': instance.media?.map((e) => e.toJson()).toList(),
    };
