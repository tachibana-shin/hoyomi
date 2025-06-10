// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Genre {
  String get name;
  String get genreId;
  String? get description;
  OImage? get image;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenreCopyWith<Genre> get copyWith =>
      _$GenreCopyWithImpl<Genre>(this as Genre, _$identity);

  /// Serializes this Genre to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Genre &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, genreId, description, image);

  @override
  String toString() {
    return 'Genre(name: $name, genreId: $genreId, description: $description, image: $image)';
  }
}

/// @nodoc
abstract mixin class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) _then) =
      _$GenreCopyWithImpl;
  @useResult
  $Res call({String name, String genreId, String? description, OImage? image});

  $OImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._self, this._then);

  final Genre _self;
  final $Res Function(Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? genreId = null,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: null == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
    ));
  }

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Genre implements Genre {
  const _Genre(
      {required this.name,
      required this.genreId,
      this.description,
      this.image});
  factory _Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  @override
  final String name;
  @override
  final String genreId;
  @override
  final String? description;
  @override
  final OImage? image;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Genre &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, genreId, description, image);

  @override
  String toString() {
    return 'Genre(name: $name, genreId: $genreId, description: $description, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) _then) =
      __$GenreCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String genreId, String? description, OImage? image});

  @override
  $OImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$GenreCopyWithImpl<$Res> implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(this._self, this._then);

  final _Genre _self;
  final $Res Function(_Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? genreId = null,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_Genre(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genreId: null == genreId
          ? _self.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
    ));
  }

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }
}

// dart format on
