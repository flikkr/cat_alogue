// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      coord: json['coord'] == null
          ? null
          : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'coord': instance.coord?.toJson(),
      'address': instance.address,
    };
