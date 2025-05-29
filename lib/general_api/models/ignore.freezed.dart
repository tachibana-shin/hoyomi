// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ignore.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ignore {

/// Source ID to exclude from results
 String get sourceId;/// Comic text ID to exclude from results
@JsonKey(name: 'comic_text_id') String get comicTextId;
/// Create a copy of Ignore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IgnoreCopyWith<Ignore> get copyWith => _$IgnoreCopyWithImpl<Ignore>(this as Ignore, _$identity);

  /// Serializes this Ignore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ignore&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId);

@override
String toString() {
  return 'Ignore(sourceId: $sourceId, comicTextId: $comicTextId)';
}


}

/// @nodoc
abstract mixin class $IgnoreCopyWith<$Res>  {
  factory $IgnoreCopyWith(Ignore value, $Res Function(Ignore) _then) = _$IgnoreCopyWithImpl;
@useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId
});




}
/// @nodoc
class _$IgnoreCopyWithImpl<$Res>
    implements $IgnoreCopyWith<$Res> {
  _$IgnoreCopyWithImpl(this._self, this._then);

  final Ignore _self;
  final $Res Function(Ignore) _then;

/// Create a copy of Ignore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? comicTextId = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Ignore implements Ignore {
  const _Ignore({required this.sourceId, @JsonKey(name: 'comic_text_id') required this.comicTextId});
  factory _Ignore.fromJson(Map<String, dynamic> json) => _$IgnoreFromJson(json);

/// Source ID to exclude from results
@override final  String sourceId;
/// Comic text ID to exclude from results
@override@JsonKey(name: 'comic_text_id') final  String comicTextId;

/// Create a copy of Ignore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IgnoreCopyWith<_Ignore> get copyWith => __$IgnoreCopyWithImpl<_Ignore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IgnoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ignore&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId);

@override
String toString() {
  return 'Ignore(sourceId: $sourceId, comicTextId: $comicTextId)';
}


}

/// @nodoc
abstract mixin class _$IgnoreCopyWith<$Res> implements $IgnoreCopyWith<$Res> {
  factory _$IgnoreCopyWith(_Ignore value, $Res Function(_Ignore) _then) = __$IgnoreCopyWithImpl;
@override @useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId
});




}
/// @nodoc
class __$IgnoreCopyWithImpl<$Res>
    implements _$IgnoreCopyWith<$Res> {
  __$IgnoreCopyWithImpl(this._self, this._then);

  final _Ignore _self;
  final $Res Function(_Ignore) _then;

/// Create a copy of Ignore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? comicTextId = null,}) {
  return _then(_Ignore(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
