// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchTimeSchema _$WatchTimeSchemaFromJson(Map<String, dynamic> json) {
  return _WatchTimeSchema.fromJson(json);
}

/// @nodoc
mixin _$WatchTimeSchema {
  Data3? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchTimeSchemaCopyWith<WatchTimeSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchTimeSchemaCopyWith<$Res> {
  factory $WatchTimeSchemaCopyWith(
          WatchTimeSchema value, $Res Function(WatchTimeSchema) then) =
      _$WatchTimeSchemaCopyWithImpl<$Res, WatchTimeSchema>;
  @useResult
  $Res call({Data3? data});

  $Data3CopyWith<$Res>? get data;
}

/// @nodoc
class _$WatchTimeSchemaCopyWithImpl<$Res, $Val extends WatchTimeSchema>
    implements $WatchTimeSchemaCopyWith<$Res> {
  _$WatchTimeSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data3?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Data3CopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $Data3CopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchTimeSchemaImplCopyWith<$Res>
    implements $WatchTimeSchemaCopyWith<$Res> {
  factory _$$WatchTimeSchemaImplCopyWith(_$WatchTimeSchemaImpl value,
          $Res Function(_$WatchTimeSchemaImpl) then) =
      __$$WatchTimeSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data3? data});

  @override
  $Data3CopyWith<$Res>? get data;
}

/// @nodoc
class __$$WatchTimeSchemaImplCopyWithImpl<$Res>
    extends _$WatchTimeSchemaCopyWithImpl<$Res, _$WatchTimeSchemaImpl>
    implements _$$WatchTimeSchemaImplCopyWith<$Res> {
  __$$WatchTimeSchemaImplCopyWithImpl(
      _$WatchTimeSchemaImpl _value, $Res Function(_$WatchTimeSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$WatchTimeSchemaImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data3?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchTimeSchemaImpl implements _WatchTimeSchema {
  const _$WatchTimeSchemaImpl({required this.data});

  factory _$WatchTimeSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchTimeSchemaImplFromJson(json);

  @override
  final Data3? data;

  @override
  String toString() {
    return 'WatchTimeSchema(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchTimeSchemaImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchTimeSchemaImplCopyWith<_$WatchTimeSchemaImpl> get copyWith =>
      __$$WatchTimeSchemaImplCopyWithImpl<_$WatchTimeSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchTimeSchemaImplToJson(
      this,
    );
  }
}

abstract class _WatchTimeSchema implements WatchTimeSchema {
  const factory _WatchTimeSchema({required final Data3? data}) =
      _$WatchTimeSchemaImpl;

  factory _WatchTimeSchema.fromJson(Map<String, dynamic> json) =
      _$WatchTimeSchemaImpl.fromJson;

  @override
  Data3? get data;
  @override
  @JsonKey(ignore: true)
  _$$WatchTimeSchemaImplCopyWith<_$WatchTimeSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
