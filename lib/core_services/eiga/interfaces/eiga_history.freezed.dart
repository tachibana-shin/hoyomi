// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaHistory {

 String get sourceId; Eiga get item; DateTime get watchUpdatedAt; EigaEpisode get lastEpisode; WatchTime get watchTime;
/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaHistoryCopyWith<EigaHistory> get copyWith => _$EigaHistoryCopyWithImpl<EigaHistory>(this as EigaHistory, _$identity);

  /// Serializes this EigaHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaHistory&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode)&&(identical(other.watchTime, watchTime) || other.watchTime == watchTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,watchUpdatedAt,lastEpisode,watchTime);

@override
String toString() {
  return 'EigaHistory(sourceId: $sourceId, item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchTime: $watchTime)';
}


}

/// @nodoc
abstract mixin class $EigaHistoryCopyWith<$Res>  {
  factory $EigaHistoryCopyWith(EigaHistory value, $Res Function(EigaHistory) _then) = _$EigaHistoryCopyWithImpl;
@useResult
$Res call({
 String sourceId, Eiga item, DateTime watchUpdatedAt, EigaEpisode lastEpisode, WatchTime watchTime
});


$EigaCopyWith<$Res> get item;$EigaEpisodeCopyWith<$Res> get lastEpisode;$WatchTimeCopyWith<$Res> get watchTime;

}
/// @nodoc
class _$EigaHistoryCopyWithImpl<$Res>
    implements $EigaHistoryCopyWith<$Res> {
  _$EigaHistoryCopyWithImpl(this._self, this._then);

  final EigaHistory _self;
  final $Res Function(EigaHistory) _then;

/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? item = null,Object? watchUpdatedAt = null,Object? lastEpisode = null,Object? watchTime = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Eiga,watchUpdatedAt: null == watchUpdatedAt ? _self.watchUpdatedAt : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastEpisode: null == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,watchTime: null == watchTime ? _self.watchTime : watchTime // ignore: cast_nullable_to_non_nullable
as WatchTime,
  ));
}
/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaCopyWith<$Res> get item {
  
  return $EigaCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get lastEpisode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchTimeCopyWith<$Res> get watchTime {
  
  return $WatchTimeCopyWith<$Res>(_self.watchTime, (value) {
    return _then(_self.copyWith(watchTime: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EigaHistory implements EigaHistory {
  const _EigaHistory({required this.sourceId, required this.item, required this.watchUpdatedAt, required this.lastEpisode, required this.watchTime});
  factory _EigaHistory.fromJson(Map<String, dynamic> json) => _$EigaHistoryFromJson(json);

@override final  String sourceId;
@override final  Eiga item;
@override final  DateTime watchUpdatedAt;
@override final  EigaEpisode lastEpisode;
@override final  WatchTime watchTime;

/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaHistoryCopyWith<_EigaHistory> get copyWith => __$EigaHistoryCopyWithImpl<_EigaHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaHistory&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode)&&(identical(other.watchTime, watchTime) || other.watchTime == watchTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,watchUpdatedAt,lastEpisode,watchTime);

@override
String toString() {
  return 'EigaHistory(sourceId: $sourceId, item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchTime: $watchTime)';
}


}

/// @nodoc
abstract mixin class _$EigaHistoryCopyWith<$Res> implements $EigaHistoryCopyWith<$Res> {
  factory _$EigaHistoryCopyWith(_EigaHistory value, $Res Function(_EigaHistory) _then) = __$EigaHistoryCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, Eiga item, DateTime watchUpdatedAt, EigaEpisode lastEpisode, WatchTime watchTime
});


@override $EigaCopyWith<$Res> get item;@override $EigaEpisodeCopyWith<$Res> get lastEpisode;@override $WatchTimeCopyWith<$Res> get watchTime;

}
/// @nodoc
class __$EigaHistoryCopyWithImpl<$Res>
    implements _$EigaHistoryCopyWith<$Res> {
  __$EigaHistoryCopyWithImpl(this._self, this._then);

  final _EigaHistory _self;
  final $Res Function(_EigaHistory) _then;

/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? item = null,Object? watchUpdatedAt = null,Object? lastEpisode = null,Object? watchTime = null,}) {
  return _then(_EigaHistory(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Eiga,watchUpdatedAt: null == watchUpdatedAt ? _self.watchUpdatedAt : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastEpisode: null == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,watchTime: null == watchTime ? _self.watchTime : watchTime // ignore: cast_nullable_to_non_nullable
as WatchTime,
  ));
}

/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaCopyWith<$Res> get item {
  
  return $EigaCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get lastEpisode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}/// Create a copy of EigaHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchTimeCopyWith<$Res> get watchTime {
  
  return $WatchTimeCopyWith<$Res>(_self.watchTime, (value) {
    return _then(_self.copyWith(watchTime: value));
  });
}
}

// dart format on
