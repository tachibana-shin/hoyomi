// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaFollow {

 String get sourceId; Eiga get item; DateTime? get updatedAt; EigaEpisode? get lastEpisode;
/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaFollowCopyWith<EigaFollow> get copyWith => _$EigaFollowCopyWithImpl<EigaFollow>(this as EigaFollow, _$identity);

  /// Serializes this EigaFollow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaFollow&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,updatedAt,lastEpisode);

@override
String toString() {
  return 'EigaFollow(sourceId: $sourceId, item: $item, updatedAt: $updatedAt, lastEpisode: $lastEpisode)';
}


}

/// @nodoc
abstract mixin class $EigaFollowCopyWith<$Res>  {
  factory $EigaFollowCopyWith(EigaFollow value, $Res Function(EigaFollow) _then) = _$EigaFollowCopyWithImpl;
@useResult
$Res call({
 String sourceId, Eiga item, DateTime? updatedAt, EigaEpisode? lastEpisode
});


$EigaCopyWith<$Res> get item;$EigaEpisodeCopyWith<$Res>? get lastEpisode;

}
/// @nodoc
class _$EigaFollowCopyWithImpl<$Res>
    implements $EigaFollowCopyWith<$Res> {
  _$EigaFollowCopyWithImpl(this._self, this._then);

  final EigaFollow _self;
  final $Res Function(EigaFollow) _then;

/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? item = null,Object? updatedAt = freezed,Object? lastEpisode = freezed,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Eiga,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastEpisode: freezed == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode?,
  ));
}
/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaCopyWith<$Res> get item {
  
  return $EigaCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res>? get lastEpisode {
    if (_self.lastEpisode == null) {
    return null;
  }

  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode!, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EigaFollow implements EigaFollow {
  const _EigaFollow({required this.sourceId, required this.item, this.updatedAt, this.lastEpisode});
  factory _EigaFollow.fromJson(Map<String, dynamic> json) => _$EigaFollowFromJson(json);

@override final  String sourceId;
@override final  Eiga item;
@override final  DateTime? updatedAt;
@override final  EigaEpisode? lastEpisode;

/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaFollowCopyWith<_EigaFollow> get copyWith => __$EigaFollowCopyWithImpl<_EigaFollow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaFollowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaFollow&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,updatedAt,lastEpisode);

@override
String toString() {
  return 'EigaFollow(sourceId: $sourceId, item: $item, updatedAt: $updatedAt, lastEpisode: $lastEpisode)';
}


}

/// @nodoc
abstract mixin class _$EigaFollowCopyWith<$Res> implements $EigaFollowCopyWith<$Res> {
  factory _$EigaFollowCopyWith(_EigaFollow value, $Res Function(_EigaFollow) _then) = __$EigaFollowCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, Eiga item, DateTime? updatedAt, EigaEpisode? lastEpisode
});


@override $EigaCopyWith<$Res> get item;@override $EigaEpisodeCopyWith<$Res>? get lastEpisode;

}
/// @nodoc
class __$EigaFollowCopyWithImpl<$Res>
    implements _$EigaFollowCopyWith<$Res> {
  __$EigaFollowCopyWithImpl(this._self, this._then);

  final _EigaFollow _self;
  final $Res Function(_EigaFollow) _then;

/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? item = null,Object? updatedAt = freezed,Object? lastEpisode = freezed,}) {
  return _then(_EigaFollow(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Eiga,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastEpisode: freezed == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode?,
  ));
}

/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaCopyWith<$Res> get item {
  
  return $EigaCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of EigaFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res>? get lastEpisode {
    if (_self.lastEpisode == null) {
    return null;
  }

  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode!, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}
}

// dart format on
