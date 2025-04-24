// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicParam {

 String get comicId; String? get chapterId;
/// Create a copy of ComicParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicParamCopyWith<ComicParam> get copyWith => _$ComicParamCopyWithImpl<ComicParam>(this as ComicParam, _$identity);

  /// Serializes this ComicParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicParam&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,chapterId);

@override
String toString() {
  return 'ComicParam(comicId: $comicId, chapterId: $chapterId)';
}


}

/// @nodoc
abstract mixin class $ComicParamCopyWith<$Res>  {
  factory $ComicParamCopyWith(ComicParam value, $Res Function(ComicParam) _then) = _$ComicParamCopyWithImpl;
@useResult
$Res call({
 String comicId, String? chapterId
});




}
/// @nodoc
class _$ComicParamCopyWithImpl<$Res>
    implements $ComicParamCopyWith<$Res> {
  _$ComicParamCopyWithImpl(this._self, this._then);

  final ComicParam _self;
  final $Res Function(ComicParam) _then;

/// Create a copy of ComicParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? chapterId = freezed,}) {
  return _then(_self.copyWith(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ComicParam implements ComicParam {
  const _ComicParam({required this.comicId, this.chapterId});
  factory _ComicParam.fromJson(Map<String, dynamic> json) => _$ComicParamFromJson(json);

@override final  String comicId;
@override final  String? chapterId;

/// Create a copy of ComicParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicParamCopyWith<_ComicParam> get copyWith => __$ComicParamCopyWithImpl<_ComicParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicParam&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,chapterId);

@override
String toString() {
  return 'ComicParam(comicId: $comicId, chapterId: $chapterId)';
}


}

/// @nodoc
abstract mixin class _$ComicParamCopyWith<$Res> implements $ComicParamCopyWith<$Res> {
  factory _$ComicParamCopyWith(_ComicParam value, $Res Function(_ComicParam) _then) = __$ComicParamCopyWithImpl;
@override @useResult
$Res call({
 String comicId, String? chapterId
});




}
/// @nodoc
class __$ComicParamCopyWithImpl<$Res>
    implements _$ComicParamCopyWith<$Res> {
  __$ComicParamCopyWithImpl(this._self, this._then);

  final _ComicParam _self;
  final $Res Function(_ComicParam) _then;

/// Create a copy of ComicParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? chapterId = freezed,}) {
  return _then(_ComicParam(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
