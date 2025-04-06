// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListWatchHistory _$ListWatchHistoryFromJson(Map<String, dynamic> json) {
  return _ListWatchHistory.fromJson(json);
}

/// @nodoc
mixin _$ListWatchHistory {
  List<Data> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListWatchHistoryCopyWith<ListWatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListWatchHistoryCopyWith<$Res> {
  factory $ListWatchHistoryCopyWith(
          ListWatchHistory value, $Res Function(ListWatchHistory) then) =
      _$ListWatchHistoryCopyWithImpl<$Res, ListWatchHistory>;
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class _$ListWatchHistoryCopyWithImpl<$Res, $Val extends ListWatchHistory>
    implements $ListWatchHistoryCopyWith<$Res> {
  _$ListWatchHistoryCopyWithImpl(this._value, this._then);

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
              as List<Data>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListWatchHistoryImplCopyWith<$Res>
    implements $ListWatchHistoryCopyWith<$Res> {
  factory _$$ListWatchHistoryImplCopyWith(_$ListWatchHistoryImpl value,
          $Res Function(_$ListWatchHistoryImpl) then) =
      __$$ListWatchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class __$$ListWatchHistoryImplCopyWithImpl<$Res>
    extends _$ListWatchHistoryCopyWithImpl<$Res, _$ListWatchHistoryImpl>
    implements _$$ListWatchHistoryImplCopyWith<$Res> {
  __$$ListWatchHistoryImplCopyWithImpl(_$ListWatchHistoryImpl _value,
      $Res Function(_$ListWatchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ListWatchHistoryImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListWatchHistoryImpl implements _ListWatchHistory {
  const _$ListWatchHistoryImpl({required final List<Data> data}) : _data = data;

  factory _$ListWatchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListWatchHistoryImplFromJson(json);

  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ListWatchHistory(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListWatchHistoryImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListWatchHistoryImplCopyWith<_$ListWatchHistoryImpl> get copyWith =>
      __$$ListWatchHistoryImplCopyWithImpl<_$ListWatchHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListWatchHistoryImplToJson(
      this,
    );
  }
}

abstract class _ListWatchHistory implements ListWatchHistory {
  const factory _ListWatchHistory({required final List<Data> data}) =
      _$ListWatchHistoryImpl;

  factory _ListWatchHistory.fromJson(Map<String, dynamic> json) =
      _$ListWatchHistoryImpl.fromJson;

  @override
  List<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$ListWatchHistoryImplCopyWith<_$ListWatchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
