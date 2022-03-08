// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cat _$CatFromJson(Map<String, dynamic> json) {
  return _Cat.fromJson(json);
}

/// @nodoc
class _$CatTearOff {
  const _$CatTearOff();

  _Cat call(
      {String? id,
      String name = '',
      String? description,
      bool isFavourite = false,
      MediaItem? profileImg,
      Location? location,
      List<MediaItem>? media}) {
    return _Cat(
      id: id,
      name: name,
      description: description,
      isFavourite: isFavourite,
      profileImg: profileImg,
      location: location,
      media: media,
    );
  }

  Cat fromJson(Map<String, Object> json) {
    return Cat.fromJson(json);
  }
}

/// @nodoc
const $Cat = _$CatTearOff();

/// @nodoc
mixin _$Cat {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  MediaItem? get profileImg => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  List<MediaItem>? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatCopyWith<Cat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatCopyWith<$Res> {
  factory $CatCopyWith(Cat value, $Res Function(Cat) then) =
      _$CatCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String? description,
      bool isFavourite,
      MediaItem? profileImg,
      Location? location,
      List<MediaItem>? media});
}

/// @nodoc
class _$CatCopyWithImpl<$Res> implements $CatCopyWith<$Res> {
  _$CatCopyWithImpl(this._value, this._then);

  final Cat _value;
  // ignore: unused_field
  final $Res Function(Cat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isFavourite = freezed,
    Object? profileImg = freezed,
    Object? location = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImg: profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc
abstract class _$CatCopyWith<$Res> implements $CatCopyWith<$Res> {
  factory _$CatCopyWith(_Cat value, $Res Function(_Cat) then) =
      __$CatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String? description,
      bool isFavourite,
      MediaItem? profileImg,
      Location? location,
      List<MediaItem>? media});
}

/// @nodoc
class __$CatCopyWithImpl<$Res> extends _$CatCopyWithImpl<$Res>
    implements _$CatCopyWith<$Res> {
  __$CatCopyWithImpl(_Cat _value, $Res Function(_Cat) _then)
      : super(_value, (v) => _then(v as _Cat));

  @override
  _Cat get _value => super._value as _Cat;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isFavourite = freezed,
    Object? profileImg = freezed,
    Object? location = freezed,
    Object? media = freezed,
  }) {
    return _then(_Cat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImg: profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as MediaItem?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cat extends _Cat {
  _$_Cat(
      {this.id,
      this.name = '',
      this.description,
      this.isFavourite = false,
      this.profileImg,
      this.location,
      this.media})
      : super._();

  factory _$_Cat.fromJson(Map<String, dynamic> json) => _$$_CatFromJson(json);

  @override
  final String? id;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @override
  final String? description;
  @JsonKey(defaultValue: false)
  @override
  final bool isFavourite;
  @override
  final MediaItem? profileImg;
  @override
  final Location? location;
  @override
  final List<MediaItem>? media;

  @override
  String toString() {
    return 'Cat(id: $id, name: $name, description: $description, isFavourite: $isFavourite, profileImg: $profileImg, location: $location, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isFavourite, isFavourite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavourite, isFavourite)) &&
            (identical(other.profileImg, profileImg) ||
                const DeepCollectionEquality()
                    .equals(other.profileImg, profileImg)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.media, media) ||
                const DeepCollectionEquality().equals(other.media, media)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isFavourite) ^
      const DeepCollectionEquality().hash(profileImg) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(media);

  @JsonKey(ignore: true)
  @override
  _$CatCopyWith<_Cat> get copyWith =>
      __$CatCopyWithImpl<_Cat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatToJson(this);
  }
}

abstract class _Cat extends Cat {
  factory _Cat(
      {String? id,
      String name,
      String? description,
      bool isFavourite,
      MediaItem? profileImg,
      Location? location,
      List<MediaItem>? media}) = _$_Cat;
  _Cat._() : super._();

  factory _Cat.fromJson(Map<String, dynamic> json) = _$_Cat.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  bool get isFavourite => throw _privateConstructorUsedError;
  @override
  MediaItem? get profileImg => throw _privateConstructorUsedError;
  @override
  Location? get location => throw _privateConstructorUsedError;
  @override
  List<MediaItem>? get media => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CatCopyWith<_Cat> get copyWith => throw _privateConstructorUsedError;
}
