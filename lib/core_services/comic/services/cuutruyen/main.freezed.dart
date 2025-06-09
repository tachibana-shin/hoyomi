// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeMangaResponse {

@JsonKey(name: 'spotlight_mangas') List<_SpotlightManga> get spotlightMangas;@JsonKey(name: 'new_chapter_mangas') List<_NewChapterManga> get newChapterMangas;
/// Create a copy of HomeMangaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeMangaResponseCopyWith<HomeMangaResponse> get copyWith => _$HomeMangaResponseCopyWithImpl<HomeMangaResponse>(this as HomeMangaResponse, _$identity);

  /// Serializes this HomeMangaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeMangaResponse&&const DeepCollectionEquality().equals(other.spotlightMangas, spotlightMangas)&&const DeepCollectionEquality().equals(other.newChapterMangas, newChapterMangas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(spotlightMangas),const DeepCollectionEquality().hash(newChapterMangas));

@override
String toString() {
  return 'HomeMangaResponse(spotlightMangas: $spotlightMangas, newChapterMangas: $newChapterMangas)';
}


}

/// @nodoc
abstract mixin class $HomeMangaResponseCopyWith<$Res>  {
  factory $HomeMangaResponseCopyWith(HomeMangaResponse value, $Res Function(HomeMangaResponse) _then) = _$HomeMangaResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'spotlight_mangas') List<_SpotlightManga> spotlightMangas,@JsonKey(name: 'new_chapter_mangas') List<_NewChapterManga> newChapterMangas
});




}
/// @nodoc
class _$HomeMangaResponseCopyWithImpl<$Res>
    implements $HomeMangaResponseCopyWith<$Res> {
  _$HomeMangaResponseCopyWithImpl(this._self, this._then);

  final HomeMangaResponse _self;
  final $Res Function(HomeMangaResponse) _then;

/// Create a copy of HomeMangaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spotlightMangas = null,Object? newChapterMangas = null,}) {
  return _then(_self.copyWith(
spotlightMangas: null == spotlightMangas ? _self.spotlightMangas : spotlightMangas // ignore: cast_nullable_to_non_nullable
as List<_SpotlightManga>,newChapterMangas: null == newChapterMangas ? _self.newChapterMangas : newChapterMangas // ignore: cast_nullable_to_non_nullable
as List<_NewChapterManga>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HomeMangaResponse implements HomeMangaResponse {
   _HomeMangaResponse({@JsonKey(name: 'spotlight_mangas') required final  List<_SpotlightManga> spotlightMangas, @JsonKey(name: 'new_chapter_mangas') required final  List<_NewChapterManga> newChapterMangas}): _spotlightMangas = spotlightMangas,_newChapterMangas = newChapterMangas;
  factory _HomeMangaResponse.fromJson(Map<String, dynamic> json) => _$HomeMangaResponseFromJson(json);

 final  List<_SpotlightManga> _spotlightMangas;
@override@JsonKey(name: 'spotlight_mangas') List<_SpotlightManga> get spotlightMangas {
  if (_spotlightMangas is EqualUnmodifiableListView) return _spotlightMangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_spotlightMangas);
}

 final  List<_NewChapterManga> _newChapterMangas;
@override@JsonKey(name: 'new_chapter_mangas') List<_NewChapterManga> get newChapterMangas {
  if (_newChapterMangas is EqualUnmodifiableListView) return _newChapterMangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newChapterMangas);
}


/// Create a copy of HomeMangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeMangaResponseCopyWith<_HomeMangaResponse> get copyWith => __$HomeMangaResponseCopyWithImpl<_HomeMangaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeMangaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeMangaResponse&&const DeepCollectionEquality().equals(other._spotlightMangas, _spotlightMangas)&&const DeepCollectionEquality().equals(other._newChapterMangas, _newChapterMangas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_spotlightMangas),const DeepCollectionEquality().hash(_newChapterMangas));

@override
String toString() {
  return 'HomeMangaResponse(spotlightMangas: $spotlightMangas, newChapterMangas: $newChapterMangas)';
}


}

/// @nodoc
abstract mixin class _$HomeMangaResponseCopyWith<$Res> implements $HomeMangaResponseCopyWith<$Res> {
  factory _$HomeMangaResponseCopyWith(_HomeMangaResponse value, $Res Function(_HomeMangaResponse) _then) = __$HomeMangaResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'spotlight_mangas') List<_SpotlightManga> spotlightMangas,@JsonKey(name: 'new_chapter_mangas') List<_NewChapterManga> newChapterMangas
});




}
/// @nodoc
class __$HomeMangaResponseCopyWithImpl<$Res>
    implements _$HomeMangaResponseCopyWith<$Res> {
  __$HomeMangaResponseCopyWithImpl(this._self, this._then);

  final _HomeMangaResponse _self;
  final $Res Function(_HomeMangaResponse) _then;

/// Create a copy of HomeMangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spotlightMangas = null,Object? newChapterMangas = null,}) {
  return _then(_HomeMangaResponse(
spotlightMangas: null == spotlightMangas ? _self._spotlightMangas : spotlightMangas // ignore: cast_nullable_to_non_nullable
as List<_SpotlightManga>,newChapterMangas: null == newChapterMangas ? _self._newChapterMangas : newChapterMangas // ignore: cast_nullable_to_non_nullable
as List<_NewChapterManga>,
  ));
}


}


/// @nodoc
mixin _$SpotlightManga {

 int get id; String get name;@JsonKey(name: 'panorama_url') String get panoramaUrl;@JsonKey(name: 'panorama_mobile_url') String get panoramaMobileUrl;@JsonKey(name: 'panorama_dominant_color') String? get panoramaDominantColor;@JsonKey(name: 'panorama_dominant_color2') String? get panoramaDominantColor2; String get description;
/// Create a copy of SpotlightManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotlightMangaCopyWith<SpotlightManga> get copyWith => _$SpotlightMangaCopyWithImpl<SpotlightManga>(this as SpotlightManga, _$identity);

  /// Serializes this SpotlightManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotlightManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.panoramaMobileUrl, panoramaMobileUrl) || other.panoramaMobileUrl == panoramaMobileUrl)&&(identical(other.panoramaDominantColor, panoramaDominantColor) || other.panoramaDominantColor == panoramaDominantColor)&&(identical(other.panoramaDominantColor2, panoramaDominantColor2) || other.panoramaDominantColor2 == panoramaDominantColor2)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,panoramaUrl,panoramaMobileUrl,panoramaDominantColor,panoramaDominantColor2,description);

@override
String toString() {
  return 'SpotlightManga(id: $id, name: $name, panoramaUrl: $panoramaUrl, panoramaMobileUrl: $panoramaMobileUrl, panoramaDominantColor: $panoramaDominantColor, panoramaDominantColor2: $panoramaDominantColor2, description: $description)';
}


}

/// @nodoc
abstract mixin class $SpotlightMangaCopyWith<$Res>  {
  factory $SpotlightMangaCopyWith(SpotlightManga value, $Res Function(SpotlightManga) _then) = _$SpotlightMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'panorama_url') String panoramaUrl,@JsonKey(name: 'panorama_mobile_url') String panoramaMobileUrl,@JsonKey(name: 'panorama_dominant_color') String? panoramaDominantColor,@JsonKey(name: 'panorama_dominant_color2') String? panoramaDominantColor2, String description
});




}
/// @nodoc
class _$SpotlightMangaCopyWithImpl<$Res>
    implements $SpotlightMangaCopyWith<$Res> {
  _$SpotlightMangaCopyWithImpl(this._self, this._then);

  final SpotlightManga _self;
  final $Res Function(SpotlightManga) _then;

/// Create a copy of SpotlightManga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? panoramaUrl = null,Object? panoramaMobileUrl = null,Object? panoramaDominantColor = freezed,Object? panoramaDominantColor2 = freezed,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaMobileUrl: null == panoramaMobileUrl ? _self.panoramaMobileUrl : panoramaMobileUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaDominantColor: freezed == panoramaDominantColor ? _self.panoramaDominantColor : panoramaDominantColor // ignore: cast_nullable_to_non_nullable
as String?,panoramaDominantColor2: freezed == panoramaDominantColor2 ? _self.panoramaDominantColor2 : panoramaDominantColor2 // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SpotlightManga implements SpotlightManga {
  const _SpotlightManga({required this.id, required this.name, @JsonKey(name: 'panorama_url') required this.panoramaUrl, @JsonKey(name: 'panorama_mobile_url') required this.panoramaMobileUrl, @JsonKey(name: 'panorama_dominant_color') this.panoramaDominantColor, @JsonKey(name: 'panorama_dominant_color2') this.panoramaDominantColor2, required this.description});
  factory _SpotlightManga.fromJson(Map<String, dynamic> json) => _$SpotlightMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'panorama_url') final  String panoramaUrl;
@override@JsonKey(name: 'panorama_mobile_url') final  String panoramaMobileUrl;
@override@JsonKey(name: 'panorama_dominant_color') final  String? panoramaDominantColor;
@override@JsonKey(name: 'panorama_dominant_color2') final  String? panoramaDominantColor2;
@override final  String description;

/// Create a copy of SpotlightManga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotlightMangaCopyWith<_SpotlightManga> get copyWith => __$SpotlightMangaCopyWithImpl<_SpotlightManga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotlightMangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotlightManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.panoramaMobileUrl, panoramaMobileUrl) || other.panoramaMobileUrl == panoramaMobileUrl)&&(identical(other.panoramaDominantColor, panoramaDominantColor) || other.panoramaDominantColor == panoramaDominantColor)&&(identical(other.panoramaDominantColor2, panoramaDominantColor2) || other.panoramaDominantColor2 == panoramaDominantColor2)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,panoramaUrl,panoramaMobileUrl,panoramaDominantColor,panoramaDominantColor2,description);

@override
String toString() {
  return 'SpotlightManga(id: $id, name: $name, panoramaUrl: $panoramaUrl, panoramaMobileUrl: $panoramaMobileUrl, panoramaDominantColor: $panoramaDominantColor, panoramaDominantColor2: $panoramaDominantColor2, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SpotlightMangaCopyWith<$Res> implements $SpotlightMangaCopyWith<$Res> {
  factory _$SpotlightMangaCopyWith(_SpotlightManga value, $Res Function(_SpotlightManga) _then) = __$SpotlightMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'panorama_url') String panoramaUrl,@JsonKey(name: 'panorama_mobile_url') String panoramaMobileUrl,@JsonKey(name: 'panorama_dominant_color') String? panoramaDominantColor,@JsonKey(name: 'panorama_dominant_color2') String? panoramaDominantColor2, String description
});




}
/// @nodoc
class __$SpotlightMangaCopyWithImpl<$Res>
    implements _$SpotlightMangaCopyWith<$Res> {
  __$SpotlightMangaCopyWithImpl(this._self, this._then);

  final _SpotlightManga _self;
  final $Res Function(_SpotlightManga) _then;

/// Create a copy of SpotlightManga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? panoramaUrl = null,Object? panoramaMobileUrl = null,Object? panoramaDominantColor = freezed,Object? panoramaDominantColor2 = freezed,Object? description = null,}) {
  return _then(_SpotlightManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaMobileUrl: null == panoramaMobileUrl ? _self.panoramaMobileUrl : panoramaMobileUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaDominantColor: freezed == panoramaDominantColor ? _self.panoramaDominantColor : panoramaDominantColor // ignore: cast_nullable_to_non_nullable
as String?,panoramaDominantColor2: freezed == panoramaDominantColor2 ? _self.panoramaDominantColor2 : panoramaDominantColor2 // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NewChapterManga {

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'cover_mobile_url') String get coverMobileUrl;@JsonKey(name: 'newest_chapter_number') String get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') DateTime get newestChapterCreatedAt;
/// Create a copy of NewChapterManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewChapterMangaCopyWith<NewChapterManga> get copyWith => _$NewChapterMangaCopyWithImpl<NewChapterManga>(this as NewChapterManga, _$identity);

  /// Serializes this NewChapterManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewChapterManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'NewChapterManga(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $NewChapterMangaCopyWith<$Res>  {
  factory $NewChapterMangaCopyWith(NewChapterManga value, $Res Function(NewChapterManga) _then) = _$NewChapterMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
});




}
/// @nodoc
class _$NewChapterMangaCopyWithImpl<$Res>
    implements $NewChapterMangaCopyWith<$Res> {
  _$NewChapterMangaCopyWithImpl(this._self, this._then);

  final NewChapterManga _self;
  final $Res Function(NewChapterManga) _then;

/// Create a copy of NewChapterManga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = null,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: null == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NewChapterManga implements NewChapterManga {
  const _NewChapterManga({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'cover_mobile_url') required this.coverMobileUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt});
  factory _NewChapterManga.fromJson(Map<String, dynamic> json) => _$NewChapterMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey(name: 'cover_mobile_url') final  String coverMobileUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  DateTime newestChapterCreatedAt;

/// Create a copy of NewChapterManga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewChapterMangaCopyWith<_NewChapterManga> get copyWith => __$NewChapterMangaCopyWithImpl<_NewChapterManga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewChapterMangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewChapterManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'NewChapterManga(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$NewChapterMangaCopyWith<$Res> implements $NewChapterMangaCopyWith<$Res> {
  factory _$NewChapterMangaCopyWith(_NewChapterManga value, $Res Function(_NewChapterManga) _then) = __$NewChapterMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
});




}
/// @nodoc
class __$NewChapterMangaCopyWithImpl<$Res>
    implements _$NewChapterMangaCopyWith<$Res> {
  __$NewChapterMangaCopyWithImpl(this._self, this._then);

  final _NewChapterManga _self;
  final $Res Function(_NewChapterManga) _then;

/// Create a copy of NewChapterManga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = null,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_NewChapterManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: null == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$MangaListResponse {

 List<MangaItem> get data;
/// Create a copy of MangaListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaListResponseCopyWith<MangaListResponse> get copyWith => _$MangaListResponseCopyWithImpl<MangaListResponse>(this as MangaListResponse, _$identity);

  /// Serializes this MangaListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaListResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MangaListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $MangaListResponseCopyWith<$Res>  {
  factory $MangaListResponseCopyWith(MangaListResponse value, $Res Function(MangaListResponse) _then) = _$MangaListResponseCopyWithImpl;
@useResult
$Res call({
 List<MangaItem> data
});




}
/// @nodoc
class _$MangaListResponseCopyWithImpl<$Res>
    implements $MangaListResponseCopyWith<$Res> {
  _$MangaListResponseCopyWithImpl(this._self, this._then);

  final MangaListResponse _self;
  final $Res Function(MangaListResponse) _then;

/// Create a copy of MangaListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MangaItem>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MangaListResponse implements MangaListResponse {
  const _MangaListResponse({required final  List<MangaItem> data}): _data = data;
  factory _MangaListResponse.fromJson(Map<String, dynamic> json) => _$MangaListResponseFromJson(json);

 final  List<MangaItem> _data;
@override List<MangaItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of MangaListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaListResponseCopyWith<_MangaListResponse> get copyWith => __$MangaListResponseCopyWithImpl<_MangaListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaListResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MangaListResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$MangaListResponseCopyWith<$Res> implements $MangaListResponseCopyWith<$Res> {
  factory _$MangaListResponseCopyWith(_MangaListResponse value, $Res Function(_MangaListResponse) _then) = __$MangaListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MangaItem> data
});




}
/// @nodoc
class __$MangaListResponseCopyWithImpl<$Res>
    implements _$MangaListResponseCopyWith<$Res> {
  __$MangaListResponseCopyWithImpl(this._self, this._then);

  final _MangaListResponse _self;
  final $Res Function(_MangaListResponse) _then;

/// Create a copy of MangaListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_MangaListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MangaItem>,
  ));
}


}


/// @nodoc
mixin _$MangaItem {

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'cover_mobile_url') String get coverMobileUrl;@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') String get newestChapterCreatedAt;@JsonKey(name: 'views_count') int get viewsCount;@JsonKey(name: 'views_count_week') int get viewsCountWeek;@JsonKey(name: 'views_count_month') int get viewsCountMonth;
/// Create a copy of MangaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaItemCopyWith<MangaItem> get copyWith => _$MangaItemCopyWithImpl<MangaItem>(this as MangaItem, _$identity);

  /// Serializes this MangaItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.viewsCountWeek, viewsCountWeek) || other.viewsCountWeek == viewsCountWeek)&&(identical(other.viewsCountMonth, viewsCountMonth) || other.viewsCountMonth == viewsCountMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt,viewsCount,viewsCountWeek,viewsCountMonth);

@override
String toString() {
  return 'MangaItem(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt, viewsCount: $viewsCount, viewsCountWeek: $viewsCountWeek, viewsCountMonth: $viewsCountMonth)';
}


}

/// @nodoc
abstract mixin class $MangaItemCopyWith<$Res>  {
  factory $MangaItemCopyWith(MangaItem value, $Res Function(MangaItem) _then) = _$MangaItemCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String newestChapterCreatedAt,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'views_count_week') int viewsCountWeek,@JsonKey(name: 'views_count_month') int viewsCountMonth
});




}
/// @nodoc
class _$MangaItemCopyWithImpl<$Res>
    implements $MangaItemCopyWith<$Res> {
  _$MangaItemCopyWithImpl(this._self, this._then);

  final MangaItem _self;
  final $Res Function(MangaItem) _then;

/// Create a copy of MangaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,Object? viewsCount = null,Object? viewsCountWeek = null,Object? viewsCountMonth = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,viewsCountWeek: null == viewsCountWeek ? _self.viewsCountWeek : viewsCountWeek // ignore: cast_nullable_to_non_nullable
as int,viewsCountMonth: null == viewsCountMonth ? _self.viewsCountMonth : viewsCountMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MangaItem implements MangaItem {
  const _MangaItem({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'cover_mobile_url') required this.coverMobileUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt, @JsonKey(name: 'views_count') required this.viewsCount, @JsonKey(name: 'views_count_week') required this.viewsCountWeek, @JsonKey(name: 'views_count_month') required this.viewsCountMonth});
  factory _MangaItem.fromJson(Map<String, dynamic> json) => _$MangaItemFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey(name: 'cover_mobile_url') final  String coverMobileUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  String newestChapterCreatedAt;
@override@JsonKey(name: 'views_count') final  int viewsCount;
@override@JsonKey(name: 'views_count_week') final  int viewsCountWeek;
@override@JsonKey(name: 'views_count_month') final  int viewsCountMonth;

/// Create a copy of MangaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaItemCopyWith<_MangaItem> get copyWith => __$MangaItemCopyWithImpl<_MangaItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.viewsCountWeek, viewsCountWeek) || other.viewsCountWeek == viewsCountWeek)&&(identical(other.viewsCountMonth, viewsCountMonth) || other.viewsCountMonth == viewsCountMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt,viewsCount,viewsCountWeek,viewsCountMonth);

@override
String toString() {
  return 'MangaItem(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt, viewsCount: $viewsCount, viewsCountWeek: $viewsCountWeek, viewsCountMonth: $viewsCountMonth)';
}


}

/// @nodoc
abstract mixin class _$MangaItemCopyWith<$Res> implements $MangaItemCopyWith<$Res> {
  factory _$MangaItemCopyWith(_MangaItem value, $Res Function(_MangaItem) _then) = __$MangaItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String newestChapterCreatedAt,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'views_count_week') int viewsCountWeek,@JsonKey(name: 'views_count_month') int viewsCountMonth
});




}
/// @nodoc
class __$MangaItemCopyWithImpl<$Res>
    implements _$MangaItemCopyWith<$Res> {
  __$MangaItemCopyWithImpl(this._self, this._then);

  final _MangaItem _self;
  final $Res Function(_MangaItem) _then;

/// Create a copy of MangaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,Object? viewsCount = null,Object? viewsCountWeek = null,Object? viewsCountMonth = null,}) {
  return _then(_MangaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,viewsCountWeek: null == viewsCountWeek ? _self.viewsCountWeek : viewsCountWeek // ignore: cast_nullable_to_non_nullable
as int,viewsCountMonth: null == viewsCountMonth ? _self.viewsCountMonth : viewsCountMonth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MangaDetail {

 int get id;// マンガID / Manga ID
 String get name;// タイトル名 / Title name
@JsonKey(name: 'cover_url') String get coverUrl;// 表紙URL（PC）/ Cover image URL (PC)
@JsonKey(name: 'cover_mobile_url') String get coverMobileUrl;// 表紙URL（モバイル）/ Cover image URL (Mobile)
@JsonKey(name: 'panorama_url') String get panoramaUrl;// パノラマURL（PC）/ Panorama URL (PC)
@JsonKey(name: 'panorama_mobile_url') String get panoramaMobileUrl;// パノラマURL（モバイル）/ Panorama URL (Mobile)
@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;// 最新チャプター番号 / Latest chapter number
@JsonKey(name: 'newest_chapter_id') int get newestChapterId;// 最新チャプターID / Latest chapter ID
@JsonKey(name: 'newest_chapter_created_at') DateTime get newestChapterCreatedAt;// 最新チャプター作成日時 / Latest chapter creation datetime
 Author get author;// 作者情報 / Author info
 String get description;// 簡単な説明 / Short description
@JsonKey(name: 'full_description') String? get fullDescription;// 詳細説明 / Full description
@JsonKey(name: 'official_url') String get officialUrl;// 公式URL / Official URL
@JsonKey(name: 'is_region_limited') bool get isRegionLimited;// 地域制限あり？/ Region limited?
@JsonKey(name: 'is_ads') bool get isAds;// 広告あり？/ Has advertisement?
@JsonKey(name: 'chapters_count') int get chaptersCount;// チャプター数 / Number of chapters
@JsonKey(name: 'views_count') int get viewsCount;// 閲覧数 / Number of views
@JsonKey(name: 'is_nsfw') bool get isNsfw;// NSFW？/ Is NSFW?
 List<Tag> get tags;// タグリスト / List of tags
 Team get team;// 翻訳チーム情報 / Translation team info
@JsonKey(name: 'is_following') bool get isFollowing;// フォロー済み？/ Is following?
 List<Title> get titles;// 別名タイトルリスト / List of alternative titles
@JsonKey(name: 'created_at') DateTime get createdAt;// 作成日 / Created date
@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaDetailCopyWith<MangaDetail> get copyWith => _$MangaDetailCopyWithImpl<MangaDetail>(this as MangaDetail, _$identity);

  /// Serializes this MangaDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.panoramaMobileUrl, panoramaMobileUrl) || other.panoramaMobileUrl == panoramaMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.officialUrl, officialUrl) || other.officialUrl == officialUrl)&&(identical(other.isRegionLimited, isRegionLimited) || other.isRegionLimited == isRegionLimited)&&(identical(other.isAds, isAds) || other.isAds == isAds)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.team, team) || other.team == team)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&const DeepCollectionEquality().equals(other.titles, titles)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,coverUrl,coverMobileUrl,panoramaUrl,panoramaMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt,author,description,fullDescription,officialUrl,isRegionLimited,isAds,chaptersCount,viewsCount,isNsfw,const DeepCollectionEquality().hash(tags),team,isFollowing,const DeepCollectionEquality().hash(titles),createdAt,updatedAt]);

@override
String toString() {
  return 'MangaDetail(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, panoramaUrl: $panoramaUrl, panoramaMobileUrl: $panoramaMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt, author: $author, description: $description, fullDescription: $fullDescription, officialUrl: $officialUrl, isRegionLimited: $isRegionLimited, isAds: $isAds, chaptersCount: $chaptersCount, viewsCount: $viewsCount, isNsfw: $isNsfw, tags: $tags, team: $team, isFollowing: $isFollowing, titles: $titles, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MangaDetailCopyWith<$Res>  {
  factory $MangaDetailCopyWith(MangaDetail value, $Res Function(MangaDetail) _then) = _$MangaDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'panorama_url') String panoramaUrl,@JsonKey(name: 'panorama_mobile_url') String panoramaMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt, Author author, String description,@JsonKey(name: 'full_description') String? fullDescription,@JsonKey(name: 'official_url') String officialUrl,@JsonKey(name: 'is_region_limited') bool isRegionLimited,@JsonKey(name: 'is_ads') bool isAds,@JsonKey(name: 'chapters_count') int chaptersCount,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'is_nsfw') bool isNsfw, List<Tag> tags, Team team,@JsonKey(name: 'is_following') bool isFollowing, List<Title> titles,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


$AuthorCopyWith<$Res> get author;$TeamCopyWith<$Res> get team;

}
/// @nodoc
class _$MangaDetailCopyWithImpl<$Res>
    implements $MangaDetailCopyWith<$Res> {
  _$MangaDetailCopyWithImpl(this._self, this._then);

  final MangaDetail _self;
  final $Res Function(MangaDetail) _then;

/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? panoramaUrl = null,Object? panoramaMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,Object? author = null,Object? description = null,Object? fullDescription = freezed,Object? officialUrl = null,Object? isRegionLimited = null,Object? isAds = null,Object? chaptersCount = null,Object? viewsCount = null,Object? isNsfw = null,Object? tags = null,Object? team = null,Object? isFollowing = null,Object? titles = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaMobileUrl: null == panoramaMobileUrl ? _self.panoramaMobileUrl : panoramaMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,officialUrl: null == officialUrl ? _self.officialUrl : officialUrl // ignore: cast_nullable_to_non_nullable
as String,isRegionLimited: null == isRegionLimited ? _self.isRegionLimited : isRegionLimited // ignore: cast_nullable_to_non_nullable
as bool,isAds: null == isAds ? _self.isAds : isAds // ignore: cast_nullable_to_non_nullable
as bool,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as List<Title>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MangaDetail implements MangaDetail {
  const _MangaDetail({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'cover_mobile_url') required this.coverMobileUrl, @JsonKey(name: 'panorama_url') required this.panoramaUrl, @JsonKey(name: 'panorama_mobile_url') required this.panoramaMobileUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt, required this.author, required this.description, @JsonKey(name: 'full_description') this.fullDescription, @JsonKey(name: 'official_url') required this.officialUrl, @JsonKey(name: 'is_region_limited') required this.isRegionLimited, @JsonKey(name: 'is_ads') required this.isAds, @JsonKey(name: 'chapters_count') required this.chaptersCount, @JsonKey(name: 'views_count') required this.viewsCount, @JsonKey(name: 'is_nsfw') required this.isNsfw, required final  List<Tag> tags, required this.team, @JsonKey(name: 'is_following') required this.isFollowing, required final  List<Title> titles, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _tags = tags,_titles = titles;
  factory _MangaDetail.fromJson(Map<String, dynamic> json) => _$MangaDetailFromJson(json);

@override final  int id;
// マンガID / Manga ID
@override final  String name;
// タイトル名 / Title name
@override@JsonKey(name: 'cover_url') final  String coverUrl;
// 表紙URL（PC）/ Cover image URL (PC)
@override@JsonKey(name: 'cover_mobile_url') final  String coverMobileUrl;
// 表紙URL（モバイル）/ Cover image URL (Mobile)
@override@JsonKey(name: 'panorama_url') final  String panoramaUrl;
// パノラマURL（PC）/ Panorama URL (PC)
@override@JsonKey(name: 'panorama_mobile_url') final  String panoramaMobileUrl;
// パノラマURL（モバイル）/ Panorama URL (Mobile)
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
// 最新チャプター番号 / Latest chapter number
@override@JsonKey(name: 'newest_chapter_id') final  int newestChapterId;
// 最新チャプターID / Latest chapter ID
@override@JsonKey(name: 'newest_chapter_created_at') final  DateTime newestChapterCreatedAt;
// 最新チャプター作成日時 / Latest chapter creation datetime
@override final  Author author;
// 作者情報 / Author info
@override final  String description;
// 簡単な説明 / Short description
@override@JsonKey(name: 'full_description') final  String? fullDescription;
// 詳細説明 / Full description
@override@JsonKey(name: 'official_url') final  String officialUrl;
// 公式URL / Official URL
@override@JsonKey(name: 'is_region_limited') final  bool isRegionLimited;
// 地域制限あり？/ Region limited?
@override@JsonKey(name: 'is_ads') final  bool isAds;
// 広告あり？/ Has advertisement?
@override@JsonKey(name: 'chapters_count') final  int chaptersCount;
// チャプター数 / Number of chapters
@override@JsonKey(name: 'views_count') final  int viewsCount;
// 閲覧数 / Number of views
@override@JsonKey(name: 'is_nsfw') final  bool isNsfw;
// NSFW？/ Is NSFW?
 final  List<Tag> _tags;
// NSFW？/ Is NSFW?
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

// タグリスト / List of tags
@override final  Team team;
// 翻訳チーム情報 / Translation team info
@override@JsonKey(name: 'is_following') final  bool isFollowing;
// フォロー済み？/ Is following?
 final  List<Title> _titles;
// フォロー済み？/ Is following?
@override List<Title> get titles {
  if (_titles is EqualUnmodifiableListView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_titles);
}

// 別名タイトルリスト / List of alternative titles
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
// 作成日 / Created date
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaDetailCopyWith<_MangaDetail> get copyWith => __$MangaDetailCopyWithImpl<_MangaDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.panoramaMobileUrl, panoramaMobileUrl) || other.panoramaMobileUrl == panoramaMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.officialUrl, officialUrl) || other.officialUrl == officialUrl)&&(identical(other.isRegionLimited, isRegionLimited) || other.isRegionLimited == isRegionLimited)&&(identical(other.isAds, isAds) || other.isAds == isAds)&&(identical(other.chaptersCount, chaptersCount) || other.chaptersCount == chaptersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.team, team) || other.team == team)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&const DeepCollectionEquality().equals(other._titles, _titles)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,coverUrl,coverMobileUrl,panoramaUrl,panoramaMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt,author,description,fullDescription,officialUrl,isRegionLimited,isAds,chaptersCount,viewsCount,isNsfw,const DeepCollectionEquality().hash(_tags),team,isFollowing,const DeepCollectionEquality().hash(_titles),createdAt,updatedAt]);

@override
String toString() {
  return 'MangaDetail(id: $id, name: $name, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, panoramaUrl: $panoramaUrl, panoramaMobileUrl: $panoramaMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt, author: $author, description: $description, fullDescription: $fullDescription, officialUrl: $officialUrl, isRegionLimited: $isRegionLimited, isAds: $isAds, chaptersCount: $chaptersCount, viewsCount: $viewsCount, isNsfw: $isNsfw, tags: $tags, team: $team, isFollowing: $isFollowing, titles: $titles, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MangaDetailCopyWith<$Res> implements $MangaDetailCopyWith<$Res> {
  factory _$MangaDetailCopyWith(_MangaDetail value, $Res Function(_MangaDetail) _then) = __$MangaDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'panorama_url') String panoramaUrl,@JsonKey(name: 'panorama_mobile_url') String panoramaMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt, Author author, String description,@JsonKey(name: 'full_description') String? fullDescription,@JsonKey(name: 'official_url') String officialUrl,@JsonKey(name: 'is_region_limited') bool isRegionLimited,@JsonKey(name: 'is_ads') bool isAds,@JsonKey(name: 'chapters_count') int chaptersCount,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'is_nsfw') bool isNsfw, List<Tag> tags, Team team,@JsonKey(name: 'is_following') bool isFollowing, List<Title> titles,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


@override $AuthorCopyWith<$Res> get author;@override $TeamCopyWith<$Res> get team;

}
/// @nodoc
class __$MangaDetailCopyWithImpl<$Res>
    implements _$MangaDetailCopyWith<$Res> {
  __$MangaDetailCopyWithImpl(this._self, this._then);

  final _MangaDetail _self;
  final $Res Function(_MangaDetail) _then;

/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? panoramaUrl = null,Object? panoramaMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,Object? author = null,Object? description = null,Object? fullDescription = freezed,Object? officialUrl = null,Object? isRegionLimited = null,Object? isAds = null,Object? chaptersCount = null,Object? viewsCount = null,Object? isNsfw = null,Object? tags = null,Object? team = null,Object? isFollowing = null,Object? titles = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MangaDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,panoramaMobileUrl: null == panoramaMobileUrl ? _self.panoramaMobileUrl : panoramaMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,officialUrl: null == officialUrl ? _self.officialUrl : officialUrl // ignore: cast_nullable_to_non_nullable
as String,isRegionLimited: null == isRegionLimited ? _self.isRegionLimited : isRegionLimited // ignore: cast_nullable_to_non_nullable
as bool,isAds: null == isAds ? _self.isAds : isAds // ignore: cast_nullable_to_non_nullable
as bool,chaptersCount: null == chaptersCount ? _self.chaptersCount : chaptersCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,isNsfw: null == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,titles: null == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as List<Title>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$Author {

 String get name;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Author(name: $name)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$AuthorCopyWithImpl<$Res>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Author implements Author {
  const _Author({required this.name});
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

@override final  String name;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorCopyWith<_Author> get copyWith => __$AuthorCopyWithImpl<_Author>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Author(name: $name)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Author(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Tag {

 String get name;// タグ名 / Tag name
 String get slug;// タグのスラッグ / Tag slug
@JsonKey(name: 'tagging_count') int get taggingCount;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.taggingCount, taggingCount) || other.taggingCount == taggingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,taggingCount);

@override
String toString() {
  return 'Tag(name: $name, slug: $slug, taggingCount: $taggingCount)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 String name, String slug,@JsonKey(name: 'tagging_count') int taggingCount
});




}
/// @nodoc
class _$TagCopyWithImpl<$Res>
    implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,Object? taggingCount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,taggingCount: null == taggingCount ? _self.taggingCount : taggingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Tag implements Tag {
  const _Tag({required this.name, required this.slug, @JsonKey(name: 'tagging_count') required this.taggingCount});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  String name;
// タグ名 / Tag name
@override final  String slug;
// タグのスラッグ / Tag slug
@override@JsonKey(name: 'tagging_count') final  int taggingCount;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagCopyWith<_Tag> get copyWith => __$TagCopyWithImpl<_Tag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.taggingCount, taggingCount) || other.taggingCount == taggingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,taggingCount);

@override
String toString() {
  return 'Tag(name: $name, slug: $slug, taggingCount: $taggingCount)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 String name, String slug,@JsonKey(name: 'tagging_count') int taggingCount
});




}
/// @nodoc
class __$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,Object? taggingCount = null,}) {
  return _then(_Tag(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,taggingCount: null == taggingCount ? _self.taggingCount : taggingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Team {

 int get id;// チームID / Team ID
 String get name;// チーム名 / Team name
 String? get description;// 説明 / Description
@JsonKey(name: 'is_ads') bool? get isAds;// 広告あり？/ Has advertisement?
@JsonKey(name: 'facebook_address') String? get facebookAddress;// Facebookアドレス / Facebook address
@JsonKey(name: 'views_count') int? get viewsCount;// チームの閲覧数 / Views count for team
@JsonKey(name: 'translations_count') int? get translationsCount;// 翻訳数 / Number of translations
@JsonKey(name: 'mangas_count') int? get mangasCount;@JsonKey(name: 'created_at') DateTime? get createdAt;// 作成日 / Created date
@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamCopyWith<Team> get copyWith => _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isAds, isAds) || other.isAds == isAds)&&(identical(other.facebookAddress, facebookAddress) || other.facebookAddress == facebookAddress)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.translationsCount, translationsCount) || other.translationsCount == translationsCount)&&(identical(other.mangasCount, mangasCount) || other.mangasCount == mangasCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isAds,facebookAddress,viewsCount,translationsCount,mangasCount,createdAt,updatedAt);

@override
String toString() {
  return 'Team(id: $id, name: $name, description: $description, isAds: $isAds, facebookAddress: $facebookAddress, viewsCount: $viewsCount, translationsCount: $translationsCount, mangasCount: $mangasCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res>  {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) = _$TeamCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description,@JsonKey(name: 'is_ads') bool? isAds,@JsonKey(name: 'facebook_address') String? facebookAddress,@JsonKey(name: 'views_count') int? viewsCount,@JsonKey(name: 'translations_count') int? translationsCount,@JsonKey(name: 'mangas_count') int? mangasCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TeamCopyWithImpl<$Res>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._self, this._then);

  final Team _self;
  final $Res Function(Team) _then;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? isAds = freezed,Object? facebookAddress = freezed,Object? viewsCount = freezed,Object? translationsCount = freezed,Object? mangasCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isAds: freezed == isAds ? _self.isAds : isAds // ignore: cast_nullable_to_non_nullable
as bool?,facebookAddress: freezed == facebookAddress ? _self.facebookAddress : facebookAddress // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,translationsCount: freezed == translationsCount ? _self.translationsCount : translationsCount // ignore: cast_nullable_to_non_nullable
as int?,mangasCount: freezed == mangasCount ? _self.mangasCount : mangasCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Team implements Team {
  const _Team({required this.id, required this.name, this.description, @JsonKey(name: 'is_ads') this.isAds, @JsonKey(name: 'facebook_address') this.facebookAddress, @JsonKey(name: 'views_count') this.viewsCount, @JsonKey(name: 'translations_count') this.translationsCount, @JsonKey(name: 'mangas_count') this.mangasCount, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

@override final  int id;
// チームID / Team ID
@override final  String name;
// チーム名 / Team name
@override final  String? description;
// 説明 / Description
@override@JsonKey(name: 'is_ads') final  bool? isAds;
// 広告あり？/ Has advertisement?
@override@JsonKey(name: 'facebook_address') final  String? facebookAddress;
// Facebookアドレス / Facebook address
@override@JsonKey(name: 'views_count') final  int? viewsCount;
// チームの閲覧数 / Views count for team
@override@JsonKey(name: 'translations_count') final  int? translationsCount;
// 翻訳数 / Number of translations
@override@JsonKey(name: 'mangas_count') final  int? mangasCount;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
// 作成日 / Created date
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamCopyWith<_Team> get copyWith => __$TeamCopyWithImpl<_Team>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Team&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isAds, isAds) || other.isAds == isAds)&&(identical(other.facebookAddress, facebookAddress) || other.facebookAddress == facebookAddress)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.translationsCount, translationsCount) || other.translationsCount == translationsCount)&&(identical(other.mangasCount, mangasCount) || other.mangasCount == mangasCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,isAds,facebookAddress,viewsCount,translationsCount,mangasCount,createdAt,updatedAt);

@override
String toString() {
  return 'Team(id: $id, name: $name, description: $description, isAds: $isAds, facebookAddress: $facebookAddress, viewsCount: $viewsCount, translationsCount: $translationsCount, mangasCount: $mangasCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) = __$TeamCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description,@JsonKey(name: 'is_ads') bool? isAds,@JsonKey(name: 'facebook_address') String? facebookAddress,@JsonKey(name: 'views_count') int? viewsCount,@JsonKey(name: 'translations_count') int? translationsCount,@JsonKey(name: 'mangas_count') int? mangasCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(this._self, this._then);

  final _Team _self;
  final $Res Function(_Team) _then;

/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? isAds = freezed,Object? facebookAddress = freezed,Object? viewsCount = freezed,Object? translationsCount = freezed,Object? mangasCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Team(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isAds: freezed == isAds ? _self.isAds : isAds // ignore: cast_nullable_to_non_nullable
as bool?,facebookAddress: freezed == facebookAddress ? _self.facebookAddress : facebookAddress // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,translationsCount: freezed == translationsCount ? _self.translationsCount : translationsCount // ignore: cast_nullable_to_non_nullable
as int?,mangasCount: freezed == mangasCount ? _self.mangasCount : mangasCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Title {

 int get id;// タイトルID / Title ID
 String get name;// 名前 / Name
 bool get primary;
/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleCopyWith<Title> get copyWith => _$TitleCopyWithImpl<Title>(this as Title, _$identity);

  /// Serializes this Title to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Title&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,primary);

@override
String toString() {
  return 'Title(id: $id, name: $name, primary: $primary)';
}


}

/// @nodoc
abstract mixin class $TitleCopyWith<$Res>  {
  factory $TitleCopyWith(Title value, $Res Function(Title) _then) = _$TitleCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool primary
});




}
/// @nodoc
class _$TitleCopyWithImpl<$Res>
    implements $TitleCopyWith<$Res> {
  _$TitleCopyWithImpl(this._self, this._then);

  final Title _self;
  final $Res Function(Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? primary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Title implements Title {
  const _Title({required this.id, required this.name, required this.primary});
  factory _Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

@override final  int id;
// タイトルID / Title ID
@override final  String name;
// 名前 / Name
@override final  bool primary;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleCopyWith<_Title> get copyWith => __$TitleCopyWithImpl<_Title>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Title&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primary, primary) || other.primary == primary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,primary);

@override
String toString() {
  return 'Title(id: $id, name: $name, primary: $primary)';
}


}

/// @nodoc
abstract mixin class _$TitleCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$TitleCopyWith(_Title value, $Res Function(_Title) _then) = __$TitleCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool primary
});




}
/// @nodoc
class __$TitleCopyWithImpl<$Res>
    implements _$TitleCopyWith<$Res> {
  __$TitleCopyWithImpl(this._self, this._then);

  final _Title _self;
  final $Res Function(_Title) _then;

/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? primary = null,}) {
  return _then(_Title(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Chapter {

 int get id;// チャプターID / Chapter ID
 int get order;// 表示順序 / Display order
 String get number;// チャプター番号 / Chapter number
 String? get name;// チャプター名 / Chapter name
@JsonKey(name: 'views_count') int get viewsCount;// 閲覧数 / Number of views
@JsonKey(name: 'comments_count') int get commentsCount;// コメント数 / Number of comments
 String get status;// ステータス / Status (例: "processed")
@JsonKey(name: 'created_at') DateTime get createdAt;// 作成日時 / Created date
@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,viewsCount,commentsCount,status,createdAt,updatedAt);

@override
String toString() {
  return 'Chapter(id: $id, order: $order, number: $number, name: $name, viewsCount: $viewsCount, commentsCount: $commentsCount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'comments_count') int commentsCount, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? viewsCount = null,Object? commentsCount = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
  const _Chapter({required this.id, required this.order, required this.number, required this.name, @JsonKey(name: 'views_count') required this.viewsCount, @JsonKey(name: 'comments_count') required this.commentsCount, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override final  int id;
// チャプターID / Chapter ID
@override final  int order;
// 表示順序 / Display order
@override final  String number;
// チャプター番号 / Chapter number
@override final  String? name;
// チャプター名 / Chapter name
@override@JsonKey(name: 'views_count') final  int viewsCount;
// 閲覧数 / Number of views
@override@JsonKey(name: 'comments_count') final  int commentsCount;
// コメント数 / Number of comments
@override final  String status;
// ステータス / Status (例: "processed")
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
// 作成日時 / Created date
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,viewsCount,commentsCount,status,createdAt,updatedAt);

@override
String toString() {
  return 'Chapter(id: $id, order: $order, number: $number, name: $name, viewsCount: $viewsCount, commentsCount: $commentsCount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'comments_count') int commentsCount, String status,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? viewsCount = null,Object? commentsCount = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ChaptersResponse {

 List<Chapter> get data;
/// Create a copy of ChaptersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChaptersResponseCopyWith<ChaptersResponse> get copyWith => _$ChaptersResponseCopyWithImpl<ChaptersResponse>(this as ChaptersResponse, _$identity);

  /// Serializes this ChaptersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChaptersResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ChaptersResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChaptersResponseCopyWith<$Res>  {
  factory $ChaptersResponseCopyWith(ChaptersResponse value, $Res Function(ChaptersResponse) _then) = _$ChaptersResponseCopyWithImpl;
@useResult
$Res call({
 List<Chapter> data
});




}
/// @nodoc
class _$ChaptersResponseCopyWithImpl<$Res>
    implements $ChaptersResponseCopyWith<$Res> {
  _$ChaptersResponseCopyWithImpl(this._self, this._then);

  final ChaptersResponse _self;
  final $Res Function(ChaptersResponse) _then;

/// Create a copy of ChaptersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Chapter>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChaptersResponse implements ChaptersResponse {
  const _ChaptersResponse({required final  List<Chapter> data}): _data = data;
  factory _ChaptersResponse.fromJson(Map<String, dynamic> json) => _$ChaptersResponseFromJson(json);

 final  List<Chapter> _data;
@override List<Chapter> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ChaptersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChaptersResponseCopyWith<_ChaptersResponse> get copyWith => __$ChaptersResponseCopyWithImpl<_ChaptersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChaptersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChaptersResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ChaptersResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ChaptersResponseCopyWith<$Res> implements $ChaptersResponseCopyWith<$Res> {
  factory _$ChaptersResponseCopyWith(_ChaptersResponse value, $Res Function(_ChaptersResponse) _then) = __$ChaptersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Chapter> data
});




}
/// @nodoc
class __$ChaptersResponseCopyWithImpl<$Res>
    implements _$ChaptersResponseCopyWith<$Res> {
  __$ChaptersResponseCopyWithImpl(this._self, this._then);

  final _ChaptersResponse _self;
  final $Res Function(_ChaptersResponse) _then;

/// Create a copy of ChaptersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ChaptersResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Chapter>,
  ));
}


}


/// @nodoc
mixin _$ChapterResponse {

 int get id; int get order; String get number; String? get name;@JsonKey(name: 'views_count') int get viewsCount;@JsonKey(name: 'comments_count') int get commentsCount; String get status;@JsonKey(name: 'previous_chapter_id') int? get previousChapterId;@JsonKey(name: 'previous_chapter_number') String? get previousChapterNumber;@JsonKey(name: 'previous_chapter_name') String? get previousChapterName;@JsonKey(name: 'next_chapter_id') int? get nextChapterId;@JsonKey(name: 'next_chapter_number') String? get nextChapterNumber;@JsonKey(name: 'next_chapter_name') String? get nextChapterName;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; Manga get manga; Team get team; List<Page> get pages;
/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterResponseCopyWith<ChapterResponse> get copyWith => _$ChapterResponseCopyWithImpl<ChapterResponse>(this as ChapterResponse, _$identity);

  /// Serializes this ChapterResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.previousChapterId, previousChapterId) || other.previousChapterId == previousChapterId)&&(identical(other.previousChapterNumber, previousChapterNumber) || other.previousChapterNumber == previousChapterNumber)&&(identical(other.previousChapterName, previousChapterName) || other.previousChapterName == previousChapterName)&&(identical(other.nextChapterId, nextChapterId) || other.nextChapterId == nextChapterId)&&(identical(other.nextChapterNumber, nextChapterNumber) || other.nextChapterNumber == nextChapterNumber)&&(identical(other.nextChapterName, nextChapterName) || other.nextChapterName == nextChapterName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.manga, manga) || other.manga == manga)&&(identical(other.team, team) || other.team == team)&&const DeepCollectionEquality().equals(other.pages, pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,viewsCount,commentsCount,status,previousChapterId,previousChapterNumber,previousChapterName,nextChapterId,nextChapterNumber,nextChapterName,createdAt,updatedAt,manga,team,const DeepCollectionEquality().hash(pages));

@override
String toString() {
  return 'ChapterResponse(id: $id, order: $order, number: $number, name: $name, viewsCount: $viewsCount, commentsCount: $commentsCount, status: $status, previousChapterId: $previousChapterId, previousChapterNumber: $previousChapterNumber, previousChapterName: $previousChapterName, nextChapterId: $nextChapterId, nextChapterNumber: $nextChapterNumber, nextChapterName: $nextChapterName, createdAt: $createdAt, updatedAt: $updatedAt, manga: $manga, team: $team, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $ChapterResponseCopyWith<$Res>  {
  factory $ChapterResponseCopyWith(ChapterResponse value, $Res Function(ChapterResponse) _then) = _$ChapterResponseCopyWithImpl;
@useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'comments_count') int commentsCount, String status,@JsonKey(name: 'previous_chapter_id') int? previousChapterId,@JsonKey(name: 'previous_chapter_number') String? previousChapterNumber,@JsonKey(name: 'previous_chapter_name') String? previousChapterName,@JsonKey(name: 'next_chapter_id') int? nextChapterId,@JsonKey(name: 'next_chapter_number') String? nextChapterNumber,@JsonKey(name: 'next_chapter_name') String? nextChapterName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Manga manga, Team team, List<Page> pages
});


$MangaCopyWith<$Res> get manga;$TeamCopyWith<$Res> get team;

}
/// @nodoc
class _$ChapterResponseCopyWithImpl<$Res>
    implements $ChapterResponseCopyWith<$Res> {
  _$ChapterResponseCopyWithImpl(this._self, this._then);

  final ChapterResponse _self;
  final $Res Function(ChapterResponse) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? viewsCount = null,Object? commentsCount = null,Object? status = null,Object? previousChapterId = freezed,Object? previousChapterNumber = freezed,Object? previousChapterName = freezed,Object? nextChapterId = freezed,Object? nextChapterNumber = freezed,Object? nextChapterName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? manga = null,Object? team = null,Object? pages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,previousChapterId: freezed == previousChapterId ? _self.previousChapterId : previousChapterId // ignore: cast_nullable_to_non_nullable
as int?,previousChapterNumber: freezed == previousChapterNumber ? _self.previousChapterNumber : previousChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,previousChapterName: freezed == previousChapterName ? _self.previousChapterName : previousChapterName // ignore: cast_nullable_to_non_nullable
as String?,nextChapterId: freezed == nextChapterId ? _self.nextChapterId : nextChapterId // ignore: cast_nullable_to_non_nullable
as int?,nextChapterNumber: freezed == nextChapterNumber ? _self.nextChapterNumber : nextChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,nextChapterName: freezed == nextChapterName ? _self.nextChapterName : nextChapterName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,manga: null == manga ? _self.manga : manga // ignore: cast_nullable_to_non_nullable
as Manga,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,
  ));
}
/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MangaCopyWith<$Res> get manga {
  
  return $MangaCopyWith<$Res>(_self.manga, (value) {
    return _then(_self.copyWith(manga: value));
  });
}/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ChapterResponse implements ChapterResponse {
  const _ChapterResponse({required this.id, required this.order, required this.number, required this.name, @JsonKey(name: 'views_count') required this.viewsCount, @JsonKey(name: 'comments_count') required this.commentsCount, required this.status, @JsonKey(name: 'previous_chapter_id') this.previousChapterId, @JsonKey(name: 'previous_chapter_number') this.previousChapterNumber, @JsonKey(name: 'previous_chapter_name') this.previousChapterName, @JsonKey(name: 'next_chapter_id') this.nextChapterId, @JsonKey(name: 'next_chapter_number') this.nextChapterNumber, @JsonKey(name: 'next_chapter_name') this.nextChapterName, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.manga, required this.team, required final  List<Page> pages}): _pages = pages;
  factory _ChapterResponse.fromJson(Map<String, dynamic> json) => _$ChapterResponseFromJson(json);

@override final  int id;
@override final  int order;
@override final  String number;
@override final  String? name;
@override@JsonKey(name: 'views_count') final  int viewsCount;
@override@JsonKey(name: 'comments_count') final  int commentsCount;
@override final  String status;
@override@JsonKey(name: 'previous_chapter_id') final  int? previousChapterId;
@override@JsonKey(name: 'previous_chapter_number') final  String? previousChapterNumber;
@override@JsonKey(name: 'previous_chapter_name') final  String? previousChapterName;
@override@JsonKey(name: 'next_chapter_id') final  int? nextChapterId;
@override@JsonKey(name: 'next_chapter_number') final  String? nextChapterNumber;
@override@JsonKey(name: 'next_chapter_name') final  String? nextChapterName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  Manga manga;
@override final  Team team;
 final  List<Page> _pages;
@override List<Page> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterResponseCopyWith<_ChapterResponse> get copyWith => __$ChapterResponseCopyWithImpl<_ChapterResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.previousChapterId, previousChapterId) || other.previousChapterId == previousChapterId)&&(identical(other.previousChapterNumber, previousChapterNumber) || other.previousChapterNumber == previousChapterNumber)&&(identical(other.previousChapterName, previousChapterName) || other.previousChapterName == previousChapterName)&&(identical(other.nextChapterId, nextChapterId) || other.nextChapterId == nextChapterId)&&(identical(other.nextChapterNumber, nextChapterNumber) || other.nextChapterNumber == nextChapterNumber)&&(identical(other.nextChapterName, nextChapterName) || other.nextChapterName == nextChapterName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.manga, manga) || other.manga == manga)&&(identical(other.team, team) || other.team == team)&&const DeepCollectionEquality().equals(other._pages, _pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,viewsCount,commentsCount,status,previousChapterId,previousChapterNumber,previousChapterName,nextChapterId,nextChapterNumber,nextChapterName,createdAt,updatedAt,manga,team,const DeepCollectionEquality().hash(_pages));

@override
String toString() {
  return 'ChapterResponse(id: $id, order: $order, number: $number, name: $name, viewsCount: $viewsCount, commentsCount: $commentsCount, status: $status, previousChapterId: $previousChapterId, previousChapterNumber: $previousChapterNumber, previousChapterName: $previousChapterName, nextChapterId: $nextChapterId, nextChapterNumber: $nextChapterNumber, nextChapterName: $nextChapterName, createdAt: $createdAt, updatedAt: $updatedAt, manga: $manga, team: $team, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$ChapterResponseCopyWith<$Res> implements $ChapterResponseCopyWith<$Res> {
  factory _$ChapterResponseCopyWith(_ChapterResponse value, $Res Function(_ChapterResponse) _then) = __$ChapterResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'views_count') int viewsCount,@JsonKey(name: 'comments_count') int commentsCount, String status,@JsonKey(name: 'previous_chapter_id') int? previousChapterId,@JsonKey(name: 'previous_chapter_number') String? previousChapterNumber,@JsonKey(name: 'previous_chapter_name') String? previousChapterName,@JsonKey(name: 'next_chapter_id') int? nextChapterId,@JsonKey(name: 'next_chapter_number') String? nextChapterNumber,@JsonKey(name: 'next_chapter_name') String? nextChapterName,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Manga manga, Team team, List<Page> pages
});


@override $MangaCopyWith<$Res> get manga;@override $TeamCopyWith<$Res> get team;

}
/// @nodoc
class __$ChapterResponseCopyWithImpl<$Res>
    implements _$ChapterResponseCopyWith<$Res> {
  __$ChapterResponseCopyWithImpl(this._self, this._then);

  final _ChapterResponse _self;
  final $Res Function(_ChapterResponse) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? viewsCount = null,Object? commentsCount = null,Object? status = null,Object? previousChapterId = freezed,Object? previousChapterNumber = freezed,Object? previousChapterName = freezed,Object? nextChapterId = freezed,Object? nextChapterNumber = freezed,Object? nextChapterName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? manga = null,Object? team = null,Object? pages = null,}) {
  return _then(_ChapterResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,previousChapterId: freezed == previousChapterId ? _self.previousChapterId : previousChapterId // ignore: cast_nullable_to_non_nullable
as int?,previousChapterNumber: freezed == previousChapterNumber ? _self.previousChapterNumber : previousChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,previousChapterName: freezed == previousChapterName ? _self.previousChapterName : previousChapterName // ignore: cast_nullable_to_non_nullable
as String?,nextChapterId: freezed == nextChapterId ? _self.nextChapterId : nextChapterId // ignore: cast_nullable_to_non_nullable
as int?,nextChapterNumber: freezed == nextChapterNumber ? _self.nextChapterNumber : nextChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,nextChapterName: freezed == nextChapterName ? _self.nextChapterName : nextChapterName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,manga: null == manga ? _self.manga : manga // ignore: cast_nullable_to_non_nullable
as Manga,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,
  ));
}

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MangaCopyWith<$Res> get manga {
  
  return $MangaCopyWith<$Res>(_self.manga, (value) {
    return _then(_self.copyWith(manga: value));
  });
}/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamCopyWith<$Res> get team {
  
  return $TeamCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$Manga {

 int get id; String get name; String? get description;@JsonKey(name: 'cover_url') String? get coverUrl;@JsonKey(name: 'panorama_url') String? get panoramaUrl; bool? get marginless;@JsonKey(name: 'is_region_limited') bool? get isRegionLimited; String? get direction;@JsonKey(name: 'is_nsfw') bool? get isNsfw;@JsonKey(name: 'author_name') String? get authorName;@JsonKey(name: 'cover_mobile_url') String? get coverMobileUrl;@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int? get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') String? get newestChapterCreatedAt;
/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaCopyWith<Manga> get copyWith => _$MangaCopyWithImpl<Manga>(this as Manga, _$identity);

  /// Serializes this Manga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.marginless, marginless) || other.marginless == marginless)&&(identical(other.isRegionLimited, isRegionLimited) || other.isRegionLimited == isRegionLimited)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,coverUrl,panoramaUrl,marginless,isRegionLimited,direction,isNsfw,authorName,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'Manga(id: $id, name: $name, description: $description, coverUrl: $coverUrl, panoramaUrl: $panoramaUrl, marginless: $marginless, isRegionLimited: $isRegionLimited, direction: $direction, isNsfw: $isNsfw, authorName: $authorName, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $MangaCopyWith<$Res>  {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) _then) = _$MangaCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'panorama_url') String? panoramaUrl, bool? marginless,@JsonKey(name: 'is_region_limited') bool? isRegionLimited, String? direction,@JsonKey(name: 'is_nsfw') bool? isNsfw,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'cover_mobile_url') String? coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String? newestChapterCreatedAt
});




}
/// @nodoc
class _$MangaCopyWithImpl<$Res>
    implements $MangaCopyWith<$Res> {
  _$MangaCopyWithImpl(this._self, this._then);

  final Manga _self;
  final $Res Function(Manga) _then;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? coverUrl = freezed,Object? panoramaUrl = freezed,Object? marginless = freezed,Object? isRegionLimited = freezed,Object? direction = freezed,Object? isNsfw = freezed,Object? authorName = freezed,Object? coverMobileUrl = freezed,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,panoramaUrl: freezed == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String?,marginless: freezed == marginless ? _self.marginless : marginless // ignore: cast_nullable_to_non_nullable
as bool?,isRegionLimited: freezed == isRegionLimited ? _self.isRegionLimited : isRegionLimited // ignore: cast_nullable_to_non_nullable
as bool?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,coverMobileUrl: freezed == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String?,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Manga implements Manga {
  const _Manga({required this.id, required this.name, this.description, @JsonKey(name: 'cover_url') this.coverUrl, @JsonKey(name: 'panorama_url') this.panoramaUrl, this.marginless, @JsonKey(name: 'is_region_limited') this.isRegionLimited, this.direction, @JsonKey(name: 'is_nsfw') this.isNsfw, @JsonKey(name: 'author_name') this.authorName, @JsonKey(name: 'cover_mobile_url') this.coverMobileUrl, @JsonKey(name: 'newest_chapter_number') this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') this.newestChapterCreatedAt});
  factory _Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override@JsonKey(name: 'panorama_url') final  String? panoramaUrl;
@override final  bool? marginless;
@override@JsonKey(name: 'is_region_limited') final  bool? isRegionLimited;
@override final  String? direction;
@override@JsonKey(name: 'is_nsfw') final  bool? isNsfw;
@override@JsonKey(name: 'author_name') final  String? authorName;
@override@JsonKey(name: 'cover_mobile_url') final  String? coverMobileUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int? newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  String? newestChapterCreatedAt;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaCopyWith<_Manga> get copyWith => __$MangaCopyWithImpl<_Manga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.marginless, marginless) || other.marginless == marginless)&&(identical(other.isRegionLimited, isRegionLimited) || other.isRegionLimited == isRegionLimited)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,coverUrl,panoramaUrl,marginless,isRegionLimited,direction,isNsfw,authorName,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'Manga(id: $id, name: $name, description: $description, coverUrl: $coverUrl, panoramaUrl: $panoramaUrl, marginless: $marginless, isRegionLimited: $isRegionLimited, direction: $direction, isNsfw: $isNsfw, authorName: $authorName, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$MangaCopyWith(_Manga value, $Res Function(_Manga) _then) = __$MangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'panorama_url') String? panoramaUrl, bool? marginless,@JsonKey(name: 'is_region_limited') bool? isRegionLimited, String? direction,@JsonKey(name: 'is_nsfw') bool? isNsfw,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'cover_mobile_url') String? coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String? newestChapterCreatedAt
});




}
/// @nodoc
class __$MangaCopyWithImpl<$Res>
    implements _$MangaCopyWith<$Res> {
  __$MangaCopyWithImpl(this._self, this._then);

  final _Manga _self;
  final $Res Function(_Manga) _then;

/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? coverUrl = freezed,Object? panoramaUrl = freezed,Object? marginless = freezed,Object? isRegionLimited = freezed,Object? direction = freezed,Object? isNsfw = freezed,Object? authorName = freezed,Object? coverMobileUrl = freezed,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_Manga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,panoramaUrl: freezed == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String?,marginless: freezed == marginless ? _self.marginless : marginless // ignore: cast_nullable_to_non_nullable
as bool?,isRegionLimited: freezed == isRegionLimited ? _self.isRegionLimited : isRegionLimited // ignore: cast_nullable_to_non_nullable
as bool?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String?,isNsfw: freezed == isNsfw ? _self.isNsfw : isNsfw // ignore: cast_nullable_to_non_nullable
as bool?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,coverMobileUrl: freezed == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String?,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Page {

 int get id; int get order; int get width; int get height; String get status;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'image_path') String get imagePath;@JsonKey(name: 'image_url_size') int? get imageUrlSize;@JsonKey(name: 'drm_data') String? get drmData;
/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageCopyWith<Page> get copyWith => _$PageCopyWithImpl<Page>(this as Page, _$identity);

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Page&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.imageUrlSize, imageUrlSize) || other.imageUrlSize == imageUrlSize)&&(identical(other.drmData, drmData) || other.drmData == drmData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,width,height,status,imageUrl,imagePath,imageUrlSize,drmData);

@override
String toString() {
  return 'Page(id: $id, order: $order, width: $width, height: $height, status: $status, imageUrl: $imageUrl, imagePath: $imagePath, imageUrlSize: $imageUrlSize, drmData: $drmData)';
}


}

/// @nodoc
abstract mixin class $PageCopyWith<$Res>  {
  factory $PageCopyWith(Page value, $Res Function(Page) _then) = _$PageCopyWithImpl;
@useResult
$Res call({
 int id, int order, int width, int height, String status,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'image_path') String imagePath,@JsonKey(name: 'image_url_size') int? imageUrlSize,@JsonKey(name: 'drm_data') String? drmData
});




}
/// @nodoc
class _$PageCopyWithImpl<$Res>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._self, this._then);

  final Page _self;
  final $Res Function(Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? width = null,Object? height = null,Object? status = null,Object? imageUrl = null,Object? imagePath = null,Object? imageUrlSize = freezed,Object? drmData = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,imageUrlSize: freezed == imageUrlSize ? _self.imageUrlSize : imageUrlSize // ignore: cast_nullable_to_non_nullable
as int?,drmData: freezed == drmData ? _self.drmData : drmData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Page implements Page {
  const _Page({required this.id, required this.order, required this.width, required this.height, required this.status, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'image_path') required this.imagePath, @JsonKey(name: 'image_url_size') this.imageUrlSize, @JsonKey(name: 'drm_data') this.drmData});
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

@override final  int id;
@override final  int order;
@override final  int width;
@override final  int height;
@override final  String status;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'image_path') final  String imagePath;
@override@JsonKey(name: 'image_url_size') final  int? imageUrlSize;
@override@JsonKey(name: 'drm_data') final  String? drmData;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageCopyWith<_Page> get copyWith => __$PageCopyWithImpl<_Page>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Page&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.imageUrlSize, imageUrlSize) || other.imageUrlSize == imageUrlSize)&&(identical(other.drmData, drmData) || other.drmData == drmData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,width,height,status,imageUrl,imagePath,imageUrlSize,drmData);

@override
String toString() {
  return 'Page(id: $id, order: $order, width: $width, height: $height, status: $status, imageUrl: $imageUrl, imagePath: $imagePath, imageUrlSize: $imageUrlSize, drmData: $drmData)';
}


}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) = __$PageCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, int width, int height, String status,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'image_path') String imagePath,@JsonKey(name: 'image_url_size') int? imageUrlSize,@JsonKey(name: 'drm_data') String? drmData
});




}
/// @nodoc
class __$PageCopyWithImpl<$Res>
    implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(this._self, this._then);

  final _Page _self;
  final $Res Function(_Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? width = null,Object? height = null,Object? status = null,Object? imageUrl = null,Object? imagePath = null,Object? imageUrlSize = freezed,Object? drmData = freezed,}) {
  return _then(_Page(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,imageUrlSize: freezed == imageUrlSize ? _self.imageUrlSize : imageUrlSize // ignore: cast_nullable_to_non_nullable
as int?,drmData: freezed == drmData ? _self.drmData : drmData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SearchResultManga {

 int get id; String get name;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'cover_mobile_url') String get coverMobileUrl;@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') DateTime get newestChapterCreatedAt;
/// Create a copy of SearchResultManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultMangaCopyWith<SearchResultManga> get copyWith => _$SearchResultMangaCopyWithImpl<SearchResultManga>(this as SearchResultManga, _$identity);

  /// Serializes this SearchResultManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,authorName,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'SearchResultManga(id: $id, name: $name, authorName: $authorName, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $SearchResultMangaCopyWith<$Res>  {
  factory $SearchResultMangaCopyWith(SearchResultManga value, $Res Function(SearchResultManga) _then) = _$SearchResultMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
});




}
/// @nodoc
class _$SearchResultMangaCopyWithImpl<$Res>
    implements $SearchResultMangaCopyWith<$Res> {
  _$SearchResultMangaCopyWithImpl(this._self, this._then);

  final SearchResultManga _self;
  final $Res Function(SearchResultManga) _then;

/// Create a copy of SearchResultManga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? authorName = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchResultManga implements SearchResultManga {
  const _SearchResultManga({required this.id, required this.name, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'cover_mobile_url') required this.coverMobileUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt});
  factory _SearchResultManga.fromJson(Map<String, dynamic> json) => _$SearchResultMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey(name: 'cover_mobile_url') final  String coverMobileUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  DateTime newestChapterCreatedAt;

/// Create a copy of SearchResultManga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultMangaCopyWith<_SearchResultManga> get copyWith => __$SearchResultMangaCopyWithImpl<_SearchResultManga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultMangaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.coverMobileUrl, coverMobileUrl) || other.coverMobileUrl == coverMobileUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,authorName,coverUrl,coverMobileUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'SearchResultManga(id: $id, name: $name, authorName: $authorName, coverUrl: $coverUrl, coverMobileUrl: $coverMobileUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$SearchResultMangaCopyWith<$Res> implements $SearchResultMangaCopyWith<$Res> {
  factory _$SearchResultMangaCopyWith(_SearchResultManga value, $Res Function(_SearchResultManga) _then) = __$SearchResultMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'cover_mobile_url') String coverMobileUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
});




}
/// @nodoc
class __$SearchResultMangaCopyWithImpl<$Res>
    implements _$SearchResultMangaCopyWith<$Res> {
  __$SearchResultMangaCopyWithImpl(this._self, this._then);

  final _SearchResultManga _self;
  final $Res Function(_SearchResultManga) _then;

/// Create a copy of SearchResultManga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? authorName = null,Object? coverUrl = null,Object? coverMobileUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_SearchResultManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,coverMobileUrl: null == coverMobileUrl ? _self.coverMobileUrl : coverMobileUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Metadata {

@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'per_page') int get perPage;
/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataCopyWith<Metadata> get copyWith => _$MetadataCopyWithImpl<Metadata>(this as Metadata, _$identity);

  /// Serializes this Metadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metadata&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,totalPages,currentPage,perPage);

@override
String toString() {
  return 'Metadata(totalCount: $totalCount, totalPages: $totalPages, currentPage: $currentPage, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $MetadataCopyWith<$Res>  {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) _then) = _$MetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'per_page') int perPage
});




}
/// @nodoc
class _$MetadataCopyWithImpl<$Res>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._self, this._then);

  final Metadata _self;
  final $Res Function(Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? totalPages = null,Object? currentPage = null,Object? perPage = null,}) {
  return _then(_self.copyWith(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Metadata implements Metadata {
  const _Metadata({@JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'per_page') required this.perPage});
  factory _Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'total_pages') final  int totalPages;
@override@JsonKey(name: 'current_page') final  int currentPage;
@override@JsonKey(name: 'per_page') final  int perPage;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataCopyWith<_Metadata> get copyWith => __$MetadataCopyWithImpl<_Metadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metadata&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,totalPages,currentPage,perPage);

@override
String toString() {
  return 'Metadata(totalCount: $totalCount, totalPages: $totalPages, currentPage: $currentPage, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$MetadataCopyWith<$Res> implements $MetadataCopyWith<$Res> {
  factory _$MetadataCopyWith(_Metadata value, $Res Function(_Metadata) _then) = __$MetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'per_page') int perPage
});




}
/// @nodoc
class __$MetadataCopyWithImpl<$Res>
    implements _$MetadataCopyWith<$Res> {
  __$MetadataCopyWithImpl(this._self, this._then);

  final _Metadata _self;
  final $Res Function(_Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? totalPages = null,Object? currentPage = null,Object? perPage = null,}) {
  return _then(_Metadata(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchResultResponse {

@JsonKey(name: 'data') List<SearchResultManga> get data;@JsonKey(name: '_metadata') Metadata get meta;
/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultResponseCopyWith<SearchResultResponse> get copyWith => _$SearchResultResponseCopyWithImpl<SearchResultResponse>(this as SearchResultResponse, _$identity);

  /// Serializes this SearchResultResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'SearchResultResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchResultResponseCopyWith<$Res>  {
  factory $SearchResultResponseCopyWith(SearchResultResponse value, $Res Function(SearchResultResponse) _then) = _$SearchResultResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') List<SearchResultManga> data,@JsonKey(name: '_metadata') Metadata meta
});


$MetadataCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchResultResponseCopyWithImpl<$Res>
    implements $SearchResultResponseCopyWith<$Res> {
  _$SearchResultResponseCopyWithImpl(this._self, this._then);

  final SearchResultResponse _self;
  final $Res Function(SearchResultResponse) _then;

/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SearchResultManga>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}
/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get meta {
  
  return $MetadataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SearchResultResponse implements SearchResultResponse {
  const _SearchResultResponse({@JsonKey(name: 'data') required final  List<SearchResultManga> data, @JsonKey(name: '_metadata') required this.meta}): _data = data;
  factory _SearchResultResponse.fromJson(Map<String, dynamic> json) => _$SearchResultResponseFromJson(json);

 final  List<SearchResultManga> _data;
@override@JsonKey(name: 'data') List<SearchResultManga> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: '_metadata') final  Metadata meta;

/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultResponseCopyWith<_SearchResultResponse> get copyWith => __$SearchResultResponseCopyWithImpl<_SearchResultResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'SearchResultResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SearchResultResponseCopyWith<$Res> implements $SearchResultResponseCopyWith<$Res> {
  factory _$SearchResultResponseCopyWith(_SearchResultResponse value, $Res Function(_SearchResultResponse) _then) = __$SearchResultResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') List<SearchResultManga> data,@JsonKey(name: '_metadata') Metadata meta
});


@override $MetadataCopyWith<$Res> get meta;

}
/// @nodoc
class __$SearchResultResponseCopyWithImpl<$Res>
    implements _$SearchResultResponseCopyWith<$Res> {
  __$SearchResultResponseCopyWithImpl(this._self, this._then);

  final _SearchResultResponse _self;
  final $Res Function(_SearchResultResponse) _then;

/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_SearchResultResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SearchResultManga>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}

/// Create a copy of SearchResultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get meta {
  
  return $MetadataCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$MangaTagResponse {

 MangaListData get data;@JsonKey(name: '_metadata') Metadata get metadata;
/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaTagResponseCopyWith<MangaTagResponse> get copyWith => _$MangaTagResponseCopyWithImpl<MangaTagResponse>(this as MangaTagResponse, _$identity);

  /// Serializes this MangaTagResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaTagResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata);

@override
String toString() {
  return 'MangaTagResponse(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $MangaTagResponseCopyWith<$Res>  {
  factory $MangaTagResponseCopyWith(MangaTagResponse value, $Res Function(MangaTagResponse) _then) = _$MangaTagResponseCopyWithImpl;
@useResult
$Res call({
 MangaListData data,@JsonKey(name: '_metadata') Metadata metadata
});


$MangaListDataCopyWith<$Res> get data;$MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$MangaTagResponseCopyWithImpl<$Res>
    implements $MangaTagResponseCopyWith<$Res> {
  _$MangaTagResponseCopyWithImpl(this._self, this._then);

  final MangaTagResponse _self;
  final $Res Function(MangaTagResponse) _then;

/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MangaListData,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}
/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MangaListDataCopyWith<$Res> get data {
  
  return $MangaListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MangaTagResponse implements MangaTagResponse {
  const _MangaTagResponse({required this.data, @JsonKey(name: '_metadata') required this.metadata});
  factory _MangaTagResponse.fromJson(Map<String, dynamic> json) => _$MangaTagResponseFromJson(json);

@override final  MangaListData data;
@override@JsonKey(name: '_metadata') final  Metadata metadata;

/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaTagResponseCopyWith<_MangaTagResponse> get copyWith => __$MangaTagResponseCopyWithImpl<_MangaTagResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaTagResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaTagResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,metadata);

@override
String toString() {
  return 'MangaTagResponse(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MangaTagResponseCopyWith<$Res> implements $MangaTagResponseCopyWith<$Res> {
  factory _$MangaTagResponseCopyWith(_MangaTagResponse value, $Res Function(_MangaTagResponse) _then) = __$MangaTagResponseCopyWithImpl;
@override @useResult
$Res call({
 MangaListData data,@JsonKey(name: '_metadata') Metadata metadata
});


@override $MangaListDataCopyWith<$Res> get data;@override $MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$MangaTagResponseCopyWithImpl<$Res>
    implements _$MangaTagResponseCopyWith<$Res> {
  __$MangaTagResponseCopyWithImpl(this._self, this._then);

  final _MangaTagResponse _self;
  final $Res Function(_MangaTagResponse) _then;

/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? metadata = null,}) {
  return _then(_MangaTagResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MangaListData,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}

/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MangaListDataCopyWith<$Res> get data {
  
  return $MangaListDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MangaTagResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$MangaListData {

 List<Manga> get mangas; Tag get tag;
/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaListDataCopyWith<MangaListData> get copyWith => _$MangaListDataCopyWithImpl<MangaListData>(this as MangaListData, _$identity);

  /// Serializes this MangaListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaListData&&const DeepCollectionEquality().equals(other.mangas, mangas)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(mangas),tag);

@override
String toString() {
  return 'MangaListData(mangas: $mangas, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $MangaListDataCopyWith<$Res>  {
  factory $MangaListDataCopyWith(MangaListData value, $Res Function(MangaListData) _then) = _$MangaListDataCopyWithImpl;
@useResult
$Res call({
 List<Manga> mangas, Tag tag
});


$TagCopyWith<$Res> get tag;

}
/// @nodoc
class _$MangaListDataCopyWithImpl<$Res>
    implements $MangaListDataCopyWith<$Res> {
  _$MangaListDataCopyWithImpl(this._self, this._then);

  final MangaListData _self;
  final $Res Function(MangaListData) _then;

/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mangas = null,Object? tag = null,}) {
  return _then(_self.copyWith(
mangas: null == mangas ? _self.mangas : mangas // ignore: cast_nullable_to_non_nullable
as List<Manga>,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}
/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MangaListData implements MangaListData {
  const _MangaListData({required final  List<Manga> mangas, required this.tag}): _mangas = mangas;
  factory _MangaListData.fromJson(Map<String, dynamic> json) => _$MangaListDataFromJson(json);

 final  List<Manga> _mangas;
@override List<Manga> get mangas {
  if (_mangas is EqualUnmodifiableListView) return _mangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mangas);
}

@override final  Tag tag;

/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaListDataCopyWith<_MangaListData> get copyWith => __$MangaListDataCopyWithImpl<_MangaListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaListData&&const DeepCollectionEquality().equals(other._mangas, _mangas)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_mangas),tag);

@override
String toString() {
  return 'MangaListData(mangas: $mangas, tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$MangaListDataCopyWith<$Res> implements $MangaListDataCopyWith<$Res> {
  factory _$MangaListDataCopyWith(_MangaListData value, $Res Function(_MangaListData) _then) = __$MangaListDataCopyWithImpl;
@override @useResult
$Res call({
 List<Manga> mangas, Tag tag
});


@override $TagCopyWith<$Res> get tag;

}
/// @nodoc
class __$MangaListDataCopyWithImpl<$Res>
    implements _$MangaListDataCopyWith<$Res> {
  __$MangaListDataCopyWithImpl(this._self, this._then);

  final _MangaListData _self;
  final $Res Function(_MangaListData) _then;

/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mangas = null,Object? tag = null,}) {
  return _then(_MangaListData(
mangas: null == mangas ? _self._mangas : mangas // ignore: cast_nullable_to_non_nullable
as List<Manga>,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}

/// Create a copy of MangaListData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}


/// @nodoc
mixin _$Comment {

 int get id; CommentUser get user;@JsonKey(name: 'processed_content') String get processedContent;@JsonKey(name: 'is_shadow_removed') bool get isShadowRemoved;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'replied_ids') List<int> get repliedIds;
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCopyWith<Comment> get copyWith => _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.processedContent, processedContent) || other.processedContent == processedContent)&&(identical(other.isShadowRemoved, isShadowRemoved) || other.isShadowRemoved == isShadowRemoved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.repliedIds, repliedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,processedContent,isShadowRemoved,createdAt,const DeepCollectionEquality().hash(repliedIds));

@override
String toString() {
  return 'Comment(id: $id, user: $user, processedContent: $processedContent, isShadowRemoved: $isShadowRemoved, createdAt: $createdAt, repliedIds: $repliedIds)';
}


}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res>  {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) = _$CommentCopyWithImpl;
@useResult
$Res call({
 int id, CommentUser user,@JsonKey(name: 'processed_content') String processedContent,@JsonKey(name: 'is_shadow_removed') bool isShadowRemoved,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'replied_ids') List<int> repliedIds
});


$CommentUserCopyWith<$Res> get user;

}
/// @nodoc
class _$CommentCopyWithImpl<$Res>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? processedContent = null,Object? isShadowRemoved = null,Object? createdAt = null,Object? repliedIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUser,processedContent: null == processedContent ? _self.processedContent : processedContent // ignore: cast_nullable_to_non_nullable
as String,isShadowRemoved: null == isShadowRemoved ? _self.isShadowRemoved : isShadowRemoved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,repliedIds: null == repliedIds ? _self.repliedIds : repliedIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserCopyWith<$Res> get user {
  
  return $CommentUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Comment implements Comment {
  const _Comment({required this.id, required this.user, @JsonKey(name: 'processed_content') required this.processedContent, @JsonKey(name: 'is_shadow_removed') required this.isShadowRemoved, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'replied_ids') required final  List<int> repliedIds}): _repliedIds = repliedIds;
  factory _Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

@override final  int id;
@override final  CommentUser user;
@override@JsonKey(name: 'processed_content') final  String processedContent;
@override@JsonKey(name: 'is_shadow_removed') final  bool isShadowRemoved;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
 final  List<int> _repliedIds;
@override@JsonKey(name: 'replied_ids') List<int> get repliedIds {
  if (_repliedIds is EqualUnmodifiableListView) return _repliedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repliedIds);
}


/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.processedContent, processedContent) || other.processedContent == processedContent)&&(identical(other.isShadowRemoved, isShadowRemoved) || other.isShadowRemoved == isShadowRemoved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._repliedIds, _repliedIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,processedContent,isShadowRemoved,createdAt,const DeepCollectionEquality().hash(_repliedIds));

@override
String toString() {
  return 'Comment(id: $id, user: $user, processedContent: $processedContent, isShadowRemoved: $isShadowRemoved, createdAt: $createdAt, repliedIds: $repliedIds)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@override @useResult
$Res call({
 int id, CommentUser user,@JsonKey(name: 'processed_content') String processedContent,@JsonKey(name: 'is_shadow_removed') bool isShadowRemoved,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'replied_ids') List<int> repliedIds
});


@override $CommentUserCopyWith<$Res> get user;

}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? processedContent = null,Object? isShadowRemoved = null,Object? createdAt = null,Object? repliedIds = null,}) {
  return _then(_Comment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUser,processedContent: null == processedContent ? _self.processedContent : processedContent // ignore: cast_nullable_to_non_nullable
as String,isShadowRemoved: null == isShadowRemoved ? _self.isShadowRemoved : isShadowRemoved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,repliedIds: null == repliedIds ? _self._repliedIds : repliedIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserCopyWith<$Res> get user {
  
  return $CommentUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$CommentUser {

 int get id; String get username; List<dynamic> get teams; String get level;
/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentUserCopyWith<CommentUser> get copyWith => _$CommentUserCopyWithImpl<CommentUser>(this as CommentUser, _$identity);

  /// Serializes this CommentUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other.teams, teams)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,const DeepCollectionEquality().hash(teams),level);

@override
String toString() {
  return 'CommentUser(id: $id, username: $username, teams: $teams, level: $level)';
}


}

/// @nodoc
abstract mixin class $CommentUserCopyWith<$Res>  {
  factory $CommentUserCopyWith(CommentUser value, $Res Function(CommentUser) _then) = _$CommentUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, List<dynamic> teams, String level
});




}
/// @nodoc
class _$CommentUserCopyWithImpl<$Res>
    implements $CommentUserCopyWith<$Res> {
  _$CommentUserCopyWithImpl(this._self, this._then);

  final CommentUser _self;
  final $Res Function(CommentUser) _then;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? teams = null,Object? level = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<dynamic>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentUser implements CommentUser {
  const _CommentUser({required this.id, required this.username, required final  List<dynamic> teams, required this.level}): _teams = teams;
  factory _CommentUser.fromJson(Map<String, dynamic> json) => _$CommentUserFromJson(json);

@override final  int id;
@override final  String username;
 final  List<dynamic> _teams;
@override List<dynamic> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

@override final  String level;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentUserCopyWith<_CommentUser> get copyWith => __$CommentUserCopyWithImpl<_CommentUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other._teams, _teams)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,const DeepCollectionEquality().hash(_teams),level);

@override
String toString() {
  return 'CommentUser(id: $id, username: $username, teams: $teams, level: $level)';
}


}

/// @nodoc
abstract mixin class _$CommentUserCopyWith<$Res> implements $CommentUserCopyWith<$Res> {
  factory _$CommentUserCopyWith(_CommentUser value, $Res Function(_CommentUser) _then) = __$CommentUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, List<dynamic> teams, String level
});




}
/// @nodoc
class __$CommentUserCopyWithImpl<$Res>
    implements _$CommentUserCopyWith<$Res> {
  __$CommentUserCopyWithImpl(this._self, this._then);

  final _CommentUser _self;
  final $Res Function(_CommentUser) _then;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? teams = null,Object? level = null,}) {
  return _then(_CommentUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<dynamic>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CommentsResponse {

 List<Comment> get data; int? get total; int? get page;@JsonKey(name: 'page_size') int? get pageSize;
/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsResponseCopyWith<CommentsResponse> get copyWith => _$CommentsResponseCopyWithImpl<CommentsResponse>(this as CommentsResponse, _$identity);

  /// Serializes this CommentsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,pageSize);

@override
String toString() {
  return 'CommentsResponse(data: $data, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $CommentsResponseCopyWith<$Res>  {
  factory $CommentsResponseCopyWith(CommentsResponse value, $Res Function(CommentsResponse) _then) = _$CommentsResponseCopyWithImpl;
@useResult
$Res call({
 List<Comment> data, int? total, int? page,@JsonKey(name: 'page_size') int? pageSize
});




}
/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._self, this._then);

  final CommentsResponse _self;
  final $Res Function(CommentsResponse) _then;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = freezed,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Comment>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentsResponse implements CommentsResponse {
  const _CommentsResponse({required final  List<Comment> data, this.total, this.page, @JsonKey(name: 'page_size') this.pageSize}): _data = data;
  factory _CommentsResponse.fromJson(Map<String, dynamic> json) => _$CommentsResponseFromJson(json);

 final  List<Comment> _data;
@override List<Comment> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int? total;
@override final  int? page;
@override@JsonKey(name: 'page_size') final  int? pageSize;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsResponseCopyWith<_CommentsResponse> get copyWith => __$CommentsResponseCopyWithImpl<_CommentsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,pageSize);

@override
String toString() {
  return 'CommentsResponse(data: $data, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$CommentsResponseCopyWith<$Res> implements $CommentsResponseCopyWith<$Res> {
  factory _$CommentsResponseCopyWith(_CommentsResponse value, $Res Function(_CommentsResponse) _then) = __$CommentsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Comment> data, int? total, int? page,@JsonKey(name: 'page_size') int? pageSize
});




}
/// @nodoc
class __$CommentsResponseCopyWithImpl<$Res>
    implements _$CommentsResponseCopyWith<$Res> {
  __$CommentsResponseCopyWithImpl(this._self, this._then);

  final _CommentsResponse _self;
  final $Res Function(_CommentsResponse) _then;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = freezed,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(_CommentsResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Comment>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
