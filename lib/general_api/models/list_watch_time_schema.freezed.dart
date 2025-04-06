// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_watch_time_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListWatchTimeSchema _$ListWatchTimeSchemaFromJson(Map<String, dynamic> json) {
  return _ListWatchTimeSchema.fromJson(json);
}

/// @nodoc
mixin _$ListWatchTimeSchema {
  List<Data2> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListWatchTimeSchemaCopyWith<ListWatchTimeSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListWatchTimeSchemaCopyWith<$Res> {
  factory $ListWatchTimeSchemaCopyWith(
          ListWatchTimeSchema value, $Res Function(ListWatchTimeSchema) then) =
      _$ListWatchTimeSchemaCopyWithImpl<$Res, ListWatchTimeSchema>;
  @useResult
  $Res call({List<Data2> data});
}

/// @nodoc
class _$ListWatchTimeSchemaCopyWithImpl<$Res, $Val extends ListWatchTimeSchema>
    implements $ListWatchTimeSchemaCopyWith<$Res> {
  _$ListWatchTimeSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data2>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListWatchTimeSchemaImplCopyWith<$Res>
    implements $ListWatchTimeSchemaCopyWith<$Res> {
  factory _$$ListWatchTimeSchemaImplCopyWith(_$ListWatchTimeSchemaImpl value,
          $Res Function(_$ListWatchTimeSchemaImpl) then) =
      __$$ListWatchTimeSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data2> data});
}

/// @nodoc
class __$$ListWatchTimeSchemaImplCopyWithImpl<$Res>
    extends _$ListWatchTimeSchemaCopyWithImpl<$Res, _$ListWatchTimeSchemaImpl>
    implements _$$ListWatchTimeSchemaImplCopyWith<$Res> {
  __$$ListWatchTimeSchemaImplCopyWithImpl(_$ListWatchTimeSchemaImpl _value,
      $Res Function(_$ListWatchTimeSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ListWatchTimeSchemaImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data2>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListWatchTimeSchemaImpl implements _ListWatchTimeSchema {
  const _$ListWatchTimeSchemaImpl({required final List<Data2> data})
      : _data = data;

  factory _$ListWatchTimeSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListWatchTimeSchemaImplFromJson(json);

  final List<Data2> _data;
  @override
  List<Data2> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ListWatchTimeSchema(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListWatchTimeSchemaImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListWatchTimeSchemaImplCopyWith<_$ListWatchTimeSchemaImpl> get copyWith =>
      __$$ListWatchTimeSchemaImplCopyWithImpl<_$ListWatchTimeSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListWatchTimeSchemaImplToJson(
      this,
    );
  }
}

abstract class _ListWatchTimeSchema implements ListWatchTimeSchema {
  const factory _ListWatchTimeSchema({required final List<Data2> data}) =
      _$ListWatchTimeSchemaImpl;

  factory _ListWatchTimeSchema.fromJson(Map<String, dynamic> json) =
      _$ListWatchTimeSchemaImpl.fromJson;

  @override
  List<Data2> get data;
  @override
  @JsonKey(ignore: true)
  _$$ListWatchTimeSchemaImplCopyWith<_$ListWatchTimeSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
