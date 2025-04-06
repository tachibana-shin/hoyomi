// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comic _$ComicFromJson(Map<String, dynamic> json) {
  return _Comic.fromJson(json);
}

/// @nodoc
mixin _$Comic {
  String get name => throw _privateConstructorUsedError;
  String get comicId => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  OImage get image => throw _privateConstructorUsedError;
  ComicChapter? get lastChap => throw _privateConstructorUsedError;
  DateTime? get timeAgo => throw _privateConstructorUsedError;
  String? get notice => throw _privateConstructorUsedError;
  bool get pending => throw _privateConstructorUsedError;
  DateTime? get preRelease => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComicCopyWith<Comic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicCopyWith<$Res> {
  factory $ComicCopyWith(Comic value, $Res Function(Comic) then) =
      _$ComicCopyWithImpl<$Res, Comic>;
  @useResult
  $Res call(
      {String name,
      String comicId,
      String? originalName,
      OImage image,
      ComicChapter? lastChap,
      DateTime? timeAgo,
      String? notice,
      bool pending,
      DateTime? preRelease,
      double? rate,
      String? description});

  $OImageCopyWith<$Res> get image;
}

/// @nodoc
class _$ComicCopyWithImpl<$Res, $Val extends Comic>
    implements $ComicCopyWith<$Res> {
  _$ComicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? comicId = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? lastChap = freezed,
    Object? timeAgo = freezed,
    Object? notice = freezed,
    Object? pending = null,
    Object? preRelease = freezed,
    Object? rate = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      lastChap: freezed == lastChap
          ? _value.lastChap
          : lastChap // ignore: cast_nullable_to_non_nullable
              as ComicChapter?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String?,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as bool,
      preRelease: freezed == preRelease
          ? _value.preRelease
          : preRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get image {
    return $OImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComicImplCopyWith<$Res> implements $ComicCopyWith<$Res> {
  factory _$$ComicImplCopyWith(
          _$ComicImpl value, $Res Function(_$ComicImpl) then) =
      __$$ComicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String comicId,
      String? originalName,
      OImage image,
      ComicChapter? lastChap,
      DateTime? timeAgo,
      String? notice,
      bool pending,
      DateTime? preRelease,
      double? rate,
      String? description});

  @override
  $OImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$ComicImplCopyWithImpl<$Res>
    extends _$ComicCopyWithImpl<$Res, _$ComicImpl>
    implements _$$ComicImplCopyWith<$Res> {
  __$$ComicImplCopyWithImpl(
      _$ComicImpl _value, $Res Function(_$ComicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? comicId = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? lastChap = freezed,
    Object? timeAgo = freezed,
    Object? notice = freezed,
    Object? pending = null,
    Object? preRelease = freezed,
    Object? rate = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ComicImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      lastChap: freezed == lastChap
          ? _value.lastChap
          : lastChap // ignore: cast_nullable_to_non_nullable
              as ComicChapter?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String?,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as bool,
      preRelease: freezed == preRelease
          ? _value.preRelease
          : preRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComicImpl implements _Comic {
  const _$ComicImpl(
      {required this.name,
      required this.comicId,
      this.originalName,
      required this.image,
      this.lastChap,
      this.timeAgo,
      this.notice,
      this.pending = false,
      this.preRelease,
      this.rate,
      this.description});

  factory _$ComicImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComicImplFromJson(json);

  @override
  final String name;
  @override
  final String comicId;
  @override
  final String? originalName;
  @override
  final OImage image;
  @override
  final ComicChapter? lastChap;
  @override
  final DateTime? timeAgo;
  @override
  final String? notice;
  @override
  @JsonKey()
  final bool pending;
  @override
  final DateTime? preRelease;
  @override
  final double? rate;
  @override
  final String? description;

  @override
  String toString() {
    return 'Comic(name: $name, comicId: $comicId, originalName: $originalName, image: $image, lastChap: $lastChap, timeAgo: $timeAgo, notice: $notice, pending: $pending, preRelease: $preRelease, rate: $rate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.comicId, comicId) || other.comicId == comicId) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lastChap, lastChap) ||
                other.lastChap == lastChap) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo) &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.preRelease, preRelease) ||
                other.preRelease == preRelease) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, comicId, originalName,
      image, lastChap, timeAgo, notice, pending, preRelease, rate, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComicImplCopyWith<_$ComicImpl> get copyWith =>
      __$$ComicImplCopyWithImpl<_$ComicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComicImplToJson(
      this,
    );
  }
}

abstract class _Comic implements Comic {
  const factory _Comic(
      {required final String name,
      required final String comicId,
      final String? originalName,
      required final OImage image,
      final ComicChapter? lastChap,
      final DateTime? timeAgo,
      final String? notice,
      final bool pending,
      final DateTime? preRelease,
      final double? rate,
      final String? description}) = _$ComicImpl;

  factory _Comic.fromJson(Map<String, dynamic> json) = _$ComicImpl.fromJson;

  @override
  String get name;
  @override
  String get comicId;
  @override
  String? get originalName;
  @override
  OImage get image;
  @override
  ComicChapter? get lastChap;
  @override
  DateTime? get timeAgo;
  @override
  String? get notice;
  @override
  bool get pending;
  @override
  DateTime? get preRelease;
  @override
  double? get rate;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ComicImplCopyWith<_$ComicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
