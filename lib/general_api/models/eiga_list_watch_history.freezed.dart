// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EigaListWatchHistory _$EigaListWatchHistoryFromJson(Map<String, dynamic> json) {
  return _EigaListWatchHistory.fromJson(json);
}

/// @nodoc
mixin _$EigaListWatchHistory {
  List<Data4> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaListWatchHistoryCopyWith<EigaListWatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaListWatchHistoryCopyWith<$Res> {
  factory $EigaListWatchHistoryCopyWith(EigaListWatchHistory value,
          $Res Function(EigaListWatchHistory) then) =
      _$EigaListWatchHistoryCopyWithImpl<$Res, EigaListWatchHistory>;
  @useResult
  $Res call({List<Data4> data});
}

/// @nodoc
class _$EigaListWatchHistoryCopyWithImpl<$Res,
        $Val extends EigaListWatchHistory>
    implements $EigaListWatchHistoryCopyWith<$Res> {
  _$EigaListWatchHistoryCopyWithImpl(this._value, this._then);

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
              as List<Data4>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EigaListWatchHistoryImplCopyWith<$Res>
    implements $EigaListWatchHistoryCopyWith<$Res> {
  factory _$$EigaListWatchHistoryImplCopyWith(_$EigaListWatchHistoryImpl value,
          $Res Function(_$EigaListWatchHistoryImpl) then) =
      __$$EigaListWatchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data4> data});
}

/// @nodoc
class __$$EigaListWatchHistoryImplCopyWithImpl<$Res>
    extends _$EigaListWatchHistoryCopyWithImpl<$Res, _$EigaListWatchHistoryImpl>
    implements _$$EigaListWatchHistoryImplCopyWith<$Res> {
  __$$EigaListWatchHistoryImplCopyWithImpl(_$EigaListWatchHistoryImpl _value,
      $Res Function(_$EigaListWatchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$EigaListWatchHistoryImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data4>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaListWatchHistoryImpl implements _EigaListWatchHistory {
  const _$EigaListWatchHistoryImpl({required final List<Data4> data})
      : _data = data;

  factory _$EigaListWatchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaListWatchHistoryImplFromJson(json);

  final List<Data4> _data;
  @override
  List<Data4> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'EigaListWatchHistory(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaListWatchHistoryImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaListWatchHistoryImplCopyWith<_$EigaListWatchHistoryImpl>
      get copyWith =>
          __$$EigaListWatchHistoryImplCopyWithImpl<_$EigaListWatchHistoryImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaListWatchHistoryImplToJson(
      this,
    );
  }
}

abstract class _EigaListWatchHistory implements EigaListWatchHistory {
  const factory _EigaListWatchHistory({required final List<Data4> data}) =
      _$EigaListWatchHistoryImpl;

  factory _EigaListWatchHistory.fromJson(Map<String, dynamic> json) =
      _$EigaListWatchHistoryImpl.fromJson;

  @override
  List<Data4> get data;
  @override
  @JsonKey(ignore: true)
  _$$EigaListWatchHistoryImplCopyWith<_$EigaListWatchHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
