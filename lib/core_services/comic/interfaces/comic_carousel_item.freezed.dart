// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_carousel_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicCarouselItem {

 String? get subText; OImage get image; String get comicId; String get name; String? get originalName; String? get type; String? get episodeDuration; DateTime? get updatedAt; String? get quality; int? get countSub; int? get countDub; double? get rate; String? get notice; String? get year; String? get description; String? get studio; String? get duration; String? get language; List<Genre>? get genres; List<Genre>? get actors;
/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCarouselItemCopyWith<ComicCarouselItem> get copyWith => _$ComicCarouselItemCopyWithImpl<ComicCarouselItem>(this as ComicCarouselItem, _$identity);

  /// Serializes this ComicCarouselItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicCarouselItem&&(identical(other.subText, subText) || other.subText == subText)&&(identical(other.image, image) || other.image == image)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.type, type) || other.type == type)&&(identical(other.episodeDuration, episodeDuration) || other.episodeDuration == episodeDuration)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.year, year) || other.year == year)&&(identical(other.description, description) || other.description == description)&&(identical(other.studio, studio) || other.studio == studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.actors, actors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,subText,image,comicId,name,originalName,type,episodeDuration,updatedAt,quality,countSub,countDub,rate,notice,year,description,studio,duration,language,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(actors)]);

@override
String toString() {
  return 'ComicCarouselItem(subText: $subText, image: $image, comicId: $comicId, name: $name, originalName: $originalName, type: $type, episodeDuration: $episodeDuration, updatedAt: $updatedAt, quality: $quality, countSub: $countSub, countDub: $countDub, rate: $rate, notice: $notice, year: $year, description: $description, studio: $studio, duration: $duration, language: $language, genres: $genres, actors: $actors)';
}


}

/// @nodoc
abstract mixin class $ComicCarouselItemCopyWith<$Res>  {
  factory $ComicCarouselItemCopyWith(ComicCarouselItem value, $Res Function(ComicCarouselItem) _then) = _$ComicCarouselItemCopyWithImpl;
@useResult
$Res call({
 String? subText, OImage image, String comicId, String name, String? originalName, String? type, String? episodeDuration, DateTime? updatedAt, String? quality, int? countSub, int? countDub, double? rate, String? notice, String? year, String? description, String? studio, String? duration, String? language, List<Genre>? genres, List<Genre>? actors
});


$OImageCopyWith<$Res> get image;

}
/// @nodoc
class _$ComicCarouselItemCopyWithImpl<$Res>
    implements $ComicCarouselItemCopyWith<$Res> {
  _$ComicCarouselItemCopyWithImpl(this._self, this._then);

  final ComicCarouselItem _self;
  final $Res Function(ComicCarouselItem) _then;

/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subText = freezed,Object? image = null,Object? comicId = null,Object? name = null,Object? originalName = freezed,Object? type = freezed,Object? episodeDuration = freezed,Object? updatedAt = freezed,Object? quality = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? rate = freezed,Object? notice = freezed,Object? year = freezed,Object? description = freezed,Object? studio = freezed,Object? duration = freezed,Object? language = freezed,Object? genres = freezed,Object? actors = freezed,}) {
  return _then(_self.copyWith(
subText: freezed == subText ? _self.subText : subText // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,episodeDuration: freezed == episodeDuration ? _self.episodeDuration : episodeDuration // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,actors: freezed == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<Genre>?,
  ));
}
/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ComicCarouselItem implements ComicCarouselItem {
  const _ComicCarouselItem({this.subText, required this.image, required this.comicId, required this.name, this.originalName, this.type, this.episodeDuration, this.updatedAt, this.quality, this.countSub, this.countDub, this.rate, this.notice, this.year, this.description, this.studio, this.duration, this.language, final  List<Genre>? genres, final  List<Genre>? actors}): _genres = genres,_actors = actors;
  factory _ComicCarouselItem.fromJson(Map<String, dynamic> json) => _$ComicCarouselItemFromJson(json);

@override final  String? subText;
@override final  OImage image;
@override final  String comicId;
@override final  String name;
@override final  String? originalName;
@override final  String? type;
@override final  String? episodeDuration;
@override final  DateTime? updatedAt;
@override final  String? quality;
@override final  int? countSub;
@override final  int? countDub;
@override final  double? rate;
@override final  String? notice;
@override final  String? year;
@override final  String? description;
@override final  String? studio;
@override final  String? duration;
@override final  String? language;
 final  List<Genre>? _genres;
@override List<Genre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Genre>? _actors;
@override List<Genre>? get actors {
  final value = _actors;
  if (value == null) return null;
  if (_actors is EqualUnmodifiableListView) return _actors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCarouselItemCopyWith<_ComicCarouselItem> get copyWith => __$ComicCarouselItemCopyWithImpl<_ComicCarouselItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicCarouselItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicCarouselItem&&(identical(other.subText, subText) || other.subText == subText)&&(identical(other.image, image) || other.image == image)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.type, type) || other.type == type)&&(identical(other.episodeDuration, episodeDuration) || other.episodeDuration == episodeDuration)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.year, year) || other.year == year)&&(identical(other.description, description) || other.description == description)&&(identical(other.studio, studio) || other.studio == studio)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._actors, _actors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,subText,image,comicId,name,originalName,type,episodeDuration,updatedAt,quality,countSub,countDub,rate,notice,year,description,studio,duration,language,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_actors)]);

@override
String toString() {
  return 'ComicCarouselItem(subText: $subText, image: $image, comicId: $comicId, name: $name, originalName: $originalName, type: $type, episodeDuration: $episodeDuration, updatedAt: $updatedAt, quality: $quality, countSub: $countSub, countDub: $countDub, rate: $rate, notice: $notice, year: $year, description: $description, studio: $studio, duration: $duration, language: $language, genres: $genres, actors: $actors)';
}


}

/// @nodoc
abstract mixin class _$ComicCarouselItemCopyWith<$Res> implements $ComicCarouselItemCopyWith<$Res> {
  factory _$ComicCarouselItemCopyWith(_ComicCarouselItem value, $Res Function(_ComicCarouselItem) _then) = __$ComicCarouselItemCopyWithImpl;
@override @useResult
$Res call({
 String? subText, OImage image, String comicId, String name, String? originalName, String? type, String? episodeDuration, DateTime? updatedAt, String? quality, int? countSub, int? countDub, double? rate, String? notice, String? year, String? description, String? studio, String? duration, String? language, List<Genre>? genres, List<Genre>? actors
});


@override $OImageCopyWith<$Res> get image;

}
/// @nodoc
class __$ComicCarouselItemCopyWithImpl<$Res>
    implements _$ComicCarouselItemCopyWith<$Res> {
  __$ComicCarouselItemCopyWithImpl(this._self, this._then);

  final _ComicCarouselItem _self;
  final $Res Function(_ComicCarouselItem) _then;

/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subText = freezed,Object? image = null,Object? comicId = null,Object? name = null,Object? originalName = freezed,Object? type = freezed,Object? episodeDuration = freezed,Object? updatedAt = freezed,Object? quality = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? rate = freezed,Object? notice = freezed,Object? year = freezed,Object? description = freezed,Object? studio = freezed,Object? duration = freezed,Object? language = freezed,Object? genres = freezed,Object? actors = freezed,}) {
  return _then(_ComicCarouselItem(
subText: freezed == subText ? _self.subText : subText // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,episodeDuration: freezed == episodeDuration ? _self.episodeDuration : episodeDuration // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,studio: freezed == studio ? _self.studio : studio // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,actors: freezed == actors ? _self._actors : actors // ignore: cast_nullable_to_non_nullable
as List<Genre>?,
  ));
}

/// Create a copy of ComicCarouselItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
