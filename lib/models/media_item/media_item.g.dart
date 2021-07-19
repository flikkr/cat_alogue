// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return MediaItem(
    urlPath: json['urlPath'] as String,
    type: _$enumDecode(_$MediaTypeEnumMap, json['type']),
    source: _$enumDecode(_$MediaSourceEnumMap, json['source']),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$MediaItemToJson(MediaItem instance) => <String, dynamic>{
      'urlPath': instance.urlPath,
      'type': _$MediaTypeEnumMap[instance.type],
      'source': _$MediaSourceEnumMap[instance.source],
      'created': instance.created.toIso8601String(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};

const _$MediaSourceEnumMap = {
  MediaSource.network: 'network',
  MediaSource.local: 'local',
  MediaSource.app: 'app',
};
