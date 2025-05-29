// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ignore2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ignore2 {

/// Source ID to exclude from the result (optional)
 String get sourceId;/// Unique identifier for the eiga to exclude
@JsonKey(name: 'eiga_text_id') String get eigaTextId;
/// Create a copy of Ignore2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Ignore2CopyWith<Ignore2> get copyWith => _$Ignore2CopyWithImpl<Ignore2>(this as Ignore2, _$identity);

  /// Serializes this Ignore2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ignore2&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,eigaTextId);

@override
String toString() {
  return 'Ignore2(sourceId: $sourceId, eigaTextId: $eigaTextId)';
}


}

/// @nodoc
abstract mixin class $Ignore2CopyWith<$Res>  {
  factory $Ignore2CopyWith(Ignore2 value, $Res Function(Ignore2) _then) = _$Ignore2CopyWithImpl;
@useResult
$Res call({
 String sourceId,@JsonKey(name: 'eiga_text_id') String eigaTextId
});




}
/// @nodoc
class _$Ignore2CopyWithImpl<$Res>
    implements $Ignore2CopyWith<$Res> {
  _$Ignore2CopyWithImpl(this._self, this._then);

  final Ignore2 _self;
  final $Res Function(Ignore2) _then;

/// Create a copy of Ignore2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? eigaTextId = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Ignore2 implements Ignore2 {
  const _Ignore2({required this.sourceId, @JsonKey(name: 'eiga_text_id') required this.eigaTextId});
  factory _Ignore2.fromJson(Map<String, dynamic> json) => _$Ignore2FromJson(json);

/// Source ID to exclude from the result (optional)
@override final  String sourceId;
/// Unique identifier for the eiga to exclude
@override@JsonKey(name: 'eiga_text_id') final  String eigaTextId;

/// Create a copy of Ignore2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Ignore2CopyWith<_Ignore2> get copyWith => __$Ignore2CopyWithImpl<_Ignore2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Ignore2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ignore2&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,eigaTextId);

@override
String toString() {
  return 'Ignore2(sourceId: $sourceId, eigaTextId: $eigaTextId)';
}


}

/// @nodoc
abstract mixin class _$Ignore2CopyWith<$Res> implements $Ignore2CopyWith<$Res> {
  factory _$Ignore2CopyWith(_Ignore2 value, $Res Function(_Ignore2) _then) = __$Ignore2CopyWithImpl;
@override @useResult
$Res call({
 String sourceId,@JsonKey(name: 'eiga_text_id') String eigaTextId
});




}
/// @nodoc
class __$Ignore2CopyWithImpl<$Res>
    implements _$Ignore2CopyWith<$Res> {
  __$Ignore2CopyWithImpl(this._self, this._then);

  final _Ignore2 _self;
  final $Res Function(_Ignore2) _then;

/// Create a copy of Ignore2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? eigaTextId = null,}) {
  return _then(_Ignore2(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
