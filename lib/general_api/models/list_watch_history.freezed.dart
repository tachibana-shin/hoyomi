// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListWatchHistory {
  List<Data> get data;

  /// Create a copy of ListWatchHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListWatchHistoryCopyWith<ListWatchHistory> get copyWith =>
      _$ListWatchHistoryCopyWithImpl<ListWatchHistory>(
          this as ListWatchHistory, _$identity);

  /// Serializes this ListWatchHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListWatchHistory &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ListWatchHistory(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ListWatchHistoryCopyWith<$Res> {
  factory $ListWatchHistoryCopyWith(
          ListWatchHistory value, $Res Function(ListWatchHistory) _then) =
      _$ListWatchHistoryCopyWithImpl;
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class _$ListWatchHistoryCopyWithImpl<$Res>
    implements $ListWatchHistoryCopyWith<$Res> {
  _$ListWatchHistoryCopyWithImpl(this._self, this._then);

  final ListWatchHistory _self;
  final $Res Function(ListWatchHistory) _then;

  /// Create a copy of ListWatchHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ListWatchHistory implements ListWatchHistory {
  const _ListWatchHistory({required final List<Data> data}) : _data = data;
  factory _ListWatchHistory.fromJson(Map<String, dynamic> json) =>
      _$ListWatchHistoryFromJson(json);

  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ListWatchHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListWatchHistoryCopyWith<_ListWatchHistory> get copyWith =>
      __$ListWatchHistoryCopyWithImpl<_ListWatchHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListWatchHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListWatchHistory &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ListWatchHistory(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ListWatchHistoryCopyWith<$Res>
    implements $ListWatchHistoryCopyWith<$Res> {
  factory _$ListWatchHistoryCopyWith(
          _ListWatchHistory value, $Res Function(_ListWatchHistory) _then) =
      __$ListWatchHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class __$ListWatchHistoryCopyWithImpl<$Res>
    implements _$ListWatchHistoryCopyWith<$Res> {
  __$ListWatchHistoryCopyWithImpl(this._self, this._then);

  final _ListWatchHistory _self;
  final $Res Function(_ListWatchHistory) _then;

  /// Create a copy of ListWatchHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_ListWatchHistory(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

// dart format on
