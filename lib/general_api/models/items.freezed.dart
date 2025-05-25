// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Items {

@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'comic_text_id') String get comicTextId; String get name;@JsonKey(name: 'original_name') String get originalName; String get poster;@JsonKey(name: 'season_name') String? get seasonName;@JsonKey(name: 'source_id') String get sourceId;@JsonKey(name: 'chapter_name') String get chapterName;@JsonKey(name: 'chapter_id') String get chapterId;@JsonKey(name: 'chapter_time') String? get chapterTime;
/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemsCopyWith<Items> get copyWith => _$ItemsCopyWithImpl<Items>(this as Items, _$identity);

  /// Serializes this Items to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Items&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.chapterTime, chapterTime) || other.chapterTime == chapterTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,comicTextId,name,originalName,poster,seasonName,sourceId,chapterName,chapterId,chapterTime);

@override
String toString() {
  return 'Items(createdAt: $createdAt, comicTextId: $comicTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, sourceId: $sourceId, chapterName: $chapterName, chapterId: $chapterId, chapterTime: $chapterTime)';
}


}

/// @nodoc
abstract mixin class $ItemsCopyWith<$Res>  {
  factory $ItemsCopyWith(Items value, $Res Function(Items) _then) = _$ItemsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'comic_text_id') String comicTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String? seasonName,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'chapter_name') String chapterName,@JsonKey(name: 'chapter_id') String chapterId,@JsonKey(name: 'chapter_time') String? chapterTime
});




}
/// @nodoc
class _$ItemsCopyWithImpl<$Res>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._self, this._then);

  final Items _self;
  final $Res Function(Items) _then;

/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? comicTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = freezed,Object? sourceId = null,Object? chapterName = null,Object? chapterId = null,Object? chapterTime = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,chapterTime: freezed == chapterTime ? _self.chapterTime : chapterTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Items implements Items {
  const _Items({@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'comic_text_id') required this.comicTextId, required this.name, @JsonKey(name: 'original_name') required this.originalName, required this.poster, @JsonKey(name: 'season_name') required this.seasonName, @JsonKey(name: 'source_id') required this.sourceId, @JsonKey(name: 'chapter_name') required this.chapterName, @JsonKey(name: 'chapter_id') required this.chapterId, @JsonKey(name: 'chapter_time') required this.chapterTime});
  factory _Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'comic_text_id') final  String comicTextId;
@override final  String name;
@override@JsonKey(name: 'original_name') final  String originalName;
@override final  String poster;
@override@JsonKey(name: 'season_name') final  String? seasonName;
@override@JsonKey(name: 'source_id') final  String sourceId;
@override@JsonKey(name: 'chapter_name') final  String chapterName;
@override@JsonKey(name: 'chapter_id') final  String chapterId;
@override@JsonKey(name: 'chapter_time') final  String? chapterTime;

/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemsCopyWith<_Items> get copyWith => __$ItemsCopyWithImpl<_Items>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Items&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.chapterTime, chapterTime) || other.chapterTime == chapterTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,comicTextId,name,originalName,poster,seasonName,sourceId,chapterName,chapterId,chapterTime);

@override
String toString() {
  return 'Items(createdAt: $createdAt, comicTextId: $comicTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, sourceId: $sourceId, chapterName: $chapterName, chapterId: $chapterId, chapterTime: $chapterTime)';
}


}

/// @nodoc
abstract mixin class _$ItemsCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$ItemsCopyWith(_Items value, $Res Function(_Items) _then) = __$ItemsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'comic_text_id') String comicTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String? seasonName,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'chapter_name') String chapterName,@JsonKey(name: 'chapter_id') String chapterId,@JsonKey(name: 'chapter_time') String? chapterTime
});




}
/// @nodoc
class __$ItemsCopyWithImpl<$Res>
    implements _$ItemsCopyWith<$Res> {
  __$ItemsCopyWithImpl(this._self, this._then);

  final _Items _self;
  final $Res Function(_Items) _then;

/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? comicTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = freezed,Object? sourceId = null,Object? chapterName = null,Object? chapterId = null,Object? chapterTime = freezed,}) {
  return _then(_Items(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,chapterTime: freezed == chapterTime ? _self.chapterTime : chapterTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
