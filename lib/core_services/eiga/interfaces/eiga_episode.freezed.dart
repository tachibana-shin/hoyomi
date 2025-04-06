// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EigaEpisode _$EigaEpisodeFromJson(Map<String, dynamic> json) {
  return _EigaEpisode.fromJson(json);
}

/// @nodoc
mixin _$EigaEpisode {
  String get name => throw _privateConstructorUsedError;
  String get episodeId => throw _privateConstructorUsedError;
  OImage? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaEpisodeCopyWith<EigaEpisode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaEpisodeCopyWith<$Res> {
  factory $EigaEpisodeCopyWith(
          EigaEpisode value, $Res Function(EigaEpisode) then) =
      _$EigaEpisodeCopyWithImpl<$Res, EigaEpisode>;
  @useResult
  $Res call(
      {String name,
      String episodeId,
      OImage? image,
      String? description,
      String? extra});

  $OImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$EigaEpisodeCopyWithImpl<$Res, $Val extends EigaEpisode>
    implements $EigaEpisodeCopyWith<$Res> {
  _$EigaEpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? episodeId = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EigaEpisodeImplCopyWith<$Res>
    implements $EigaEpisodeCopyWith<$Res> {
  factory _$$EigaEpisodeImplCopyWith(
          _$EigaEpisodeImpl value, $Res Function(_$EigaEpisodeImpl) then) =
      __$$EigaEpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String episodeId,
      OImage? image,
      String? description,
      String? extra});

  @override
  $OImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$EigaEpisodeImplCopyWithImpl<$Res>
    extends _$EigaEpisodeCopyWithImpl<$Res, _$EigaEpisodeImpl>
    implements _$$EigaEpisodeImplCopyWith<$Res> {
  __$$EigaEpisodeImplCopyWithImpl(
      _$EigaEpisodeImpl _value, $Res Function(_$EigaEpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? episodeId = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? extra = freezed,
  }) {
    return _then(_$EigaEpisodeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaEpisodeImpl implements _EigaEpisode {
  const _$EigaEpisodeImpl(
      {required this.name,
      required this.episodeId,
      this.image,
      this.description,
      this.extra});

  factory _$EigaEpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaEpisodeImplFromJson(json);

  @override
  final String name;
  @override
  final String episodeId;
  @override
  final OImage? image;
  @override
  final String? description;
  @override
  final String? extra;

  @override
  String toString() {
    return 'EigaEpisode(name: $name, episodeId: $episodeId, image: $image, description: $description, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaEpisodeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, episodeId, image, description, extra);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaEpisodeImplCopyWith<_$EigaEpisodeImpl> get copyWith =>
      __$$EigaEpisodeImplCopyWithImpl<_$EigaEpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaEpisodeImplToJson(
      this,
    );
  }
}

abstract class _EigaEpisode implements EigaEpisode {
  const factory _EigaEpisode(
      {required final String name,
      required final String episodeId,
      final OImage? image,
      final String? description,
      final String? extra}) = _$EigaEpisodeImpl;

  factory _EigaEpisode.fromJson(Map<String, dynamic> json) =
      _$EigaEpisodeImpl.fromJson;

  @override
  String get name;
  @override
  String get episodeId;
  @override
  OImage? get image;
  @override
  String? get description;
  @override
  String? get extra;
  @override
  @JsonKey(ignore: true)
  _$$EigaEpisodeImplCopyWith<_$EigaEpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
