// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComicListWatchHistory _$ComicListWatchHistoryFromJson(
    Map<String, dynamic> json) {
  return _ComicListWatchHistory.fromJson(json);
}

/// @nodoc
mixin _$ComicListWatchHistory {
  List<Data> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComicListWatchHistoryCopyWith<ComicListWatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicListWatchHistoryCopyWith<$Res> {
  factory $ComicListWatchHistoryCopyWith(ComicListWatchHistory value,
          $Res Function(ComicListWatchHistory) then) =
      _$ComicListWatchHistoryCopyWithImpl<$Res, ComicListWatchHistory>;
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class _$ComicListWatchHistoryCopyWithImpl<$Res,
        $Val extends ComicListWatchHistory>
    implements $ComicListWatchHistoryCopyWith<$Res> {
  _$ComicListWatchHistoryCopyWithImpl(this._value, this._then);

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
abstract class _$$ComicListWatchHistoryImplCopyWith<$Res>
    implements $ComicListWatchHistoryCopyWith<$Res> {
  factory _$$ComicListWatchHistoryImplCopyWith(
          _$ComicListWatchHistoryImpl value,
          $Res Function(_$ComicListWatchHistoryImpl) then) =
      __$$ComicListWatchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class __$$ComicListWatchHistoryImplCopyWithImpl<$Res>
    extends _$ComicListWatchHistoryCopyWithImpl<$Res,
        _$ComicListWatchHistoryImpl>
    implements _$$ComicListWatchHistoryImplCopyWith<$Res> {
  __$$ComicListWatchHistoryImplCopyWithImpl(_$ComicListWatchHistoryImpl _value,
      $Res Function(_$ComicListWatchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ComicListWatchHistoryImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComicListWatchHistoryImpl implements _ComicListWatchHistory {
  const _$ComicListWatchHistoryImpl({required final List<Data> data})
      : _data = data;

  factory _$ComicListWatchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComicListWatchHistoryImplFromJson(json);

  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ComicListWatchHistory(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComicListWatchHistoryImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComicListWatchHistoryImplCopyWith<_$ComicListWatchHistoryImpl>
      get copyWith => __$$ComicListWatchHistoryImplCopyWithImpl<
          _$ComicListWatchHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComicListWatchHistoryImplToJson(
      this,
    );
  }
}

abstract class _ComicListWatchHistory implements ComicListWatchHistory {
  const factory _ComicListWatchHistory({required final List<Data> data}) =
      _$ComicListWatchHistoryImpl;

  factory _ComicListWatchHistory.fromJson(Map<String, dynamic> json) =
      _$ComicListWatchHistoryImpl.fromJson;

  @override
  List<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$ComicListWatchHistoryImplCopyWith<_$ComicListWatchHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
