// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Eiga _$EigaFromJson(Map<String, dynamic> json) {
  return _Eiga.fromJson(json);
}

/// @nodoc
mixin _$Eiga {
  String get name => throw _privateConstructorUsedError;
  String get eigaId => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  OImage get image => throw _privateConstructorUsedError;
  EigaEpisode? get lastEpisode => throw _privateConstructorUsedError;
  DateTime? get timeAgo => throw _privateConstructorUsedError;
  String? get notice => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  bool get pending => throw _privateConstructorUsedError;
  DateTime? get preRelease => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaCopyWith<Eiga> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaCopyWith<$Res> {
  factory $EigaCopyWith(Eiga value, $Res Function(Eiga) then) =
      _$EigaCopyWithImpl<$Res, Eiga>;
  @useResult
  $Res call(
      {String name,
      String eigaId,
      String? originalName,
      OImage image,
      EigaEpisode? lastEpisode,
      DateTime? timeAgo,
      String? notice,
      double? rate,
      bool pending,
      DateTime? preRelease,
      String? description});

  $OImageCopyWith<$Res> get image;
  $EigaEpisodeCopyWith<$Res>? get lastEpisode;
}

/// @nodoc
class _$EigaCopyWithImpl<$Res, $Val extends Eiga>
    implements $EigaCopyWith<$Res> {
  _$EigaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? eigaId = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? lastEpisode = freezed,
    Object? timeAgo = freezed,
    Object? notice = freezed,
    Object? rate = freezed,
    Object? pending = null,
    Object? preRelease = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      lastEpisode: freezed == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as bool,
      preRelease: freezed == preRelease
          ? _value.preRelease
          : preRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  @override
  @pragma('vm:prefer-inline')
  $EigaEpisodeCopyWith<$Res>? get lastEpisode {
    if (_value.lastEpisode == null) {
      return null;
    }

    return $EigaEpisodeCopyWith<$Res>(_value.lastEpisode!, (value) {
      return _then(_value.copyWith(lastEpisode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EigaImplCopyWith<$Res> implements $EigaCopyWith<$Res> {
  factory _$$EigaImplCopyWith(
          _$EigaImpl value, $Res Function(_$EigaImpl) then) =
      __$$EigaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String eigaId,
      String? originalName,
      OImage image,
      EigaEpisode? lastEpisode,
      DateTime? timeAgo,
      String? notice,
      double? rate,
      bool pending,
      DateTime? preRelease,
      String? description});

  @override
  $OImageCopyWith<$Res> get image;
  @override
  $EigaEpisodeCopyWith<$Res>? get lastEpisode;
}

/// @nodoc
class __$$EigaImplCopyWithImpl<$Res>
    extends _$EigaCopyWithImpl<$Res, _$EigaImpl>
    implements _$$EigaImplCopyWith<$Res> {
  __$$EigaImplCopyWithImpl(_$EigaImpl _value, $Res Function(_$EigaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? eigaId = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? lastEpisode = freezed,
    Object? timeAgo = freezed,
    Object? notice = freezed,
    Object? rate = freezed,
    Object? pending = null,
    Object? preRelease = freezed,
    Object? description = freezed,
  }) {
    return _then(_$EigaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      lastEpisode: freezed == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notice: freezed == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as bool,
      preRelease: freezed == preRelease
          ? _value.preRelease
          : preRelease // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaImpl implements _Eiga {
  const _$EigaImpl(
      {required this.name,
      required this.eigaId,
      this.originalName,
      required this.image,
      this.lastEpisode,
      this.timeAgo,
      this.notice,
      this.rate,
      this.pending = false,
      this.preRelease,
      this.description});

  factory _$EigaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaImplFromJson(json);

  @override
  final String name;
  @override
  final String eigaId;
  @override
  final String? originalName;
  @override
  final OImage image;
  @override
  final EigaEpisode? lastEpisode;
  @override
  final DateTime? timeAgo;
  @override
  final String? notice;
  @override
  final double? rate;
  @override
  @JsonKey()
  final bool pending;
  @override
  final DateTime? preRelease;
  @override
  final String? description;

  @override
  String toString() {
    return 'Eiga(name: $name, eigaId: $eigaId, originalName: $originalName, image: $image, lastEpisode: $lastEpisode, timeAgo: $timeAgo, notice: $notice, rate: $rate, pending: $pending, preRelease: $preRelease, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lastEpisode, lastEpisode) ||
                other.lastEpisode == lastEpisode) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo) &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.preRelease, preRelease) ||
                other.preRelease == preRelease) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      eigaId,
      originalName,
      image,
      lastEpisode,
      timeAgo,
      notice,
      rate,
      pending,
      preRelease,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaImplCopyWith<_$EigaImpl> get copyWith =>
      __$$EigaImplCopyWithImpl<_$EigaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaImplToJson(
      this,
    );
  }
}

abstract class _Eiga implements Eiga {
  const factory _Eiga(
      {required final String name,
      required final String eigaId,
      final String? originalName,
      required final OImage image,
      final EigaEpisode? lastEpisode,
      final DateTime? timeAgo,
      final String? notice,
      final double? rate,
      final bool pending,
      final DateTime? preRelease,
      final String? description}) = _$EigaImpl;

  factory _Eiga.fromJson(Map<String, dynamic> json) = _$EigaImpl.fromJson;

  @override
  String get name;
  @override
  String get eigaId;
  @override
  String? get originalName;
  @override
  OImage get image;
  @override
  EigaEpisode? get lastEpisode;
  @override
  DateTime? get timeAgo;
  @override
  String? get notice;
  @override
  double? get rate;
  @override
  bool get pending;
  @override
  DateTime? get preRelease;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$EigaImplCopyWith<_$EigaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
