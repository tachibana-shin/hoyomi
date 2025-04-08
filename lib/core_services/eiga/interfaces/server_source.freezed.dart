// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerSource _$ServerSourceFromJson(Map<String, dynamic> json) {
  return _ServerSource.fromJson(json);
}

/// @nodoc
mixin _$ServerSource {
  String get name => throw _privateConstructorUsedError;
  String get serverId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerSourceCopyWith<ServerSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerSourceCopyWith<$Res> {
  factory $ServerSourceCopyWith(
          ServerSource value, $Res Function(ServerSource) then) =
      _$ServerSourceCopyWithImpl<$Res, ServerSource>;
  @useResult
  $Res call({String name, String serverId});
}

/// @nodoc
class _$ServerSourceCopyWithImpl<$Res, $Val extends ServerSource>
    implements $ServerSourceCopyWith<$Res> {
  _$ServerSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerSourceImplCopyWith<$Res>
    implements $ServerSourceCopyWith<$Res> {
  factory _$$ServerSourceImplCopyWith(
          _$ServerSourceImpl value, $Res Function(_$ServerSourceImpl) then) =
      __$$ServerSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String serverId});
}

/// @nodoc
class __$$ServerSourceImplCopyWithImpl<$Res>
    extends _$ServerSourceCopyWithImpl<$Res, _$ServerSourceImpl>
    implements _$$ServerSourceImplCopyWith<$Res> {
  __$$ServerSourceImplCopyWithImpl(
      _$ServerSourceImpl _value, $Res Function(_$ServerSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? serverId = null,
  }) {
    return _then(_$ServerSourceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerSourceImpl implements _ServerSource {
  _$ServerSourceImpl({required this.name, required this.serverId});

  factory _$ServerSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerSourceImplFromJson(json);

  @override
  final String name;
  @override
  final String serverId;

  @override
  String toString() {
    return 'ServerSource(name: $name, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, serverId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSourceImplCopyWith<_$ServerSourceImpl> get copyWith =>
      __$$ServerSourceImplCopyWithImpl<_$ServerSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerSourceImplToJson(
      this,
    );
  }
}

abstract class _ServerSource implements ServerSource {
  factory _ServerSource(
      {required final String name,
      required final String serverId}) = _$ServerSourceImpl;

  factory _ServerSource.fromJson(Map<String, dynamic> json) =
      _$ServerSourceImpl.fromJson;

  @override
  String get name;
  @override
  String get serverId;
  @override
  @JsonKey(ignore: true)
  _$$ServerSourceImplCopyWith<_$ServerSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
