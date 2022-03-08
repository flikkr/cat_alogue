// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) => MediaItem(
      urlPath: json['urlPath'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      source: $enumDecode(_$MediaSourceEnumMap, json['source']),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$MediaItemToJson(MediaItem instance) => <String, dynamic>{
      'urlPath': instance.urlPath,
      'type': _$MediaTypeEnumMap[instance.type],
      'source': _$MediaSourceEnumMap[instance.source],
      'created': instance.created.toIso8601String(),
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};

const _$MediaSourceEnumMap = {
  MediaSource.network: 'network',
  MediaSource.local: 'local',
  MediaSource.app: 'app',
};
