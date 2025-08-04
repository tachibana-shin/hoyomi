// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

@JsonKey(name: 'spotlight_mangas') List<SpotlightManga> get spotlightMangas;@JsonKey(name: 'new_chapter_mangas') List<NewChapterManga> get newChapterMangas;
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
@JsonKey(name: 'spotlight_mangas') List<SpotlightManga> spotlightMangas,@JsonKey(name: 'new_chapter_mangas') List<NewChapterManga> newChapterMangas
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
as List<SpotlightManga>,newChapterMangas: null == newChapterMangas ? _self.newChapterMangas : newChapterMangas // ignore: cast_nullable_to_non_nullable
as List<NewChapterManga>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeMangaResponse].
extension HomeMangaResponsePatterns on HomeMangaResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeMangaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeMangaResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeMangaResponse value)  $default,){
final _that = this;
switch (_that) {
case _HomeMangaResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeMangaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HomeMangaResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'spotlight_mangas')  List<SpotlightManga> spotlightMangas, @JsonKey(name: 'new_chapter_mangas')  List<NewChapterManga> newChapterMangas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeMangaResponse() when $default != null:
return $default(_that.spotlightMangas,_that.newChapterMangas);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'spotlight_mangas')  List<SpotlightManga> spotlightMangas, @JsonKey(name: 'new_chapter_mangas')  List<NewChapterManga> newChapterMangas)  $default,) {final _that = this;
switch (_that) {
case _HomeMangaResponse():
return $default(_that.spotlightMangas,_that.newChapterMangas);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'spotlight_mangas')  List<SpotlightManga> spotlightMangas, @JsonKey(name: 'new_chapter_mangas')  List<NewChapterManga> newChapterMangas)?  $default,) {final _that = this;
switch (_that) {
case _HomeMangaResponse() when $default != null:
return $default(_that.spotlightMangas,_that.newChapterMangas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeMangaResponse implements HomeMangaResponse {
   _HomeMangaResponse({@JsonKey(name: 'spotlight_mangas') required final  List<SpotlightManga> spotlightMangas, @JsonKey(name: 'new_chapter_mangas') required final  List<NewChapterManga> newChapterMangas}): _spotlightMangas = spotlightMangas,_newChapterMangas = newChapterMangas;
  factory _HomeMangaResponse.fromJson(Map<String, dynamic> json) => _$HomeMangaResponseFromJson(json);

 final  List<SpotlightManga> _spotlightMangas;
@override@JsonKey(name: 'spotlight_mangas') List<SpotlightManga> get spotlightMangas {
  if (_spotlightMangas is EqualUnmodifiableListView) return _spotlightMangas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_spotlightMangas);
}

 final  List<NewChapterManga> _newChapterMangas;
@override@JsonKey(name: 'new_chapter_mangas') List<NewChapterManga> get newChapterMangas {
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
@JsonKey(name: 'spotlight_mangas') List<SpotlightManga> spotlightMangas,@JsonKey(name: 'new_chapter_mangas') List<NewChapterManga> newChapterMangas
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
as List<SpotlightManga>,newChapterMangas: null == newChapterMangas ? _self._newChapterMangas : newChapterMangas // ignore: cast_nullable_to_non_nullable
as List<NewChapterManga>,
  ));
}


}


/// @nodoc
mixin _$SpotlightManga {

 int get id; String get name;@JsonKey(name: 'panorama_url') String get panoramaUrl; String get description;
/// Create a copy of SpotlightManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotlightMangaCopyWith<SpotlightManga> get copyWith => _$SpotlightMangaCopyWithImpl<SpotlightManga>(this as SpotlightManga, _$identity);

  /// Serializes this SpotlightManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpotlightManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,panoramaUrl,description);

@override
String toString() {
  return 'SpotlightManga(id: $id, name: $name, panoramaUrl: $panoramaUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class $SpotlightMangaCopyWith<$Res>  {
  factory $SpotlightMangaCopyWith(SpotlightManga value, $Res Function(SpotlightManga) _then) = _$SpotlightMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'panorama_url') String panoramaUrl, String description
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? panoramaUrl = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpotlightManga].
extension SpotlightMangaPatterns on SpotlightManga {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpotlightManga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpotlightManga() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpotlightManga value)  $default,){
final _that = this;
switch (_that) {
case _SpotlightManga():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpotlightManga value)?  $default,){
final _that = this;
switch (_that) {
case _SpotlightManga() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'panorama_url')  String panoramaUrl,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpotlightManga() when $default != null:
return $default(_that.id,_that.name,_that.panoramaUrl,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'panorama_url')  String panoramaUrl,  String description)  $default,) {final _that = this;
switch (_that) {
case _SpotlightManga():
return $default(_that.id,_that.name,_that.panoramaUrl,_that.description);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'panorama_url')  String panoramaUrl,  String description)?  $default,) {final _that = this;
switch (_that) {
case _SpotlightManga() when $default != null:
return $default(_that.id,_that.name,_that.panoramaUrl,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpotlightManga implements SpotlightManga {
  const _SpotlightManga({required this.id, required this.name, @JsonKey(name: 'panorama_url') required this.panoramaUrl, required this.description});
  factory _SpotlightManga.fromJson(Map<String, dynamic> json) => _$SpotlightMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'panorama_url') final  String panoramaUrl;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpotlightManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.panoramaUrl, panoramaUrl) || other.panoramaUrl == panoramaUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,panoramaUrl,description);

@override
String toString() {
  return 'SpotlightManga(id: $id, name: $name, panoramaUrl: $panoramaUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SpotlightMangaCopyWith<$Res> implements $SpotlightMangaCopyWith<$Res> {
  factory _$SpotlightMangaCopyWith(_SpotlightManga value, $Res Function(_SpotlightManga) _then) = __$SpotlightMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'panorama_url') String panoramaUrl, String description
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? panoramaUrl = null,Object? description = null,}) {
  return _then(_SpotlightManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,panoramaUrl: null == panoramaUrl ? _self.panoramaUrl : panoramaUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NewChapterManga {

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'newest_chapter_number') String get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') DateTime get newestChapterCreatedAt;
/// Create a copy of NewChapterManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewChapterMangaCopyWith<NewChapterManga> get copyWith => _$NewChapterMangaCopyWithImpl<NewChapterManga>(this as NewChapterManga, _$identity);

  /// Serializes this NewChapterManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewChapterManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'NewChapterManga(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $NewChapterMangaCopyWith<$Res>  {
  factory $NewChapterMangaCopyWith(NewChapterManga value, $Res Function(NewChapterManga) _then) = _$NewChapterMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = null,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: null == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String,newestChapterId: null == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int,newestChapterCreatedAt: null == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NewChapterManga].
extension NewChapterMangaPatterns on NewChapterManga {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewChapterManga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewChapterManga() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewChapterManga value)  $default,){
final _that = this;
switch (_that) {
case _NewChapterManga():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewChapterManga value)?  $default,){
final _that = this;
switch (_that) {
case _NewChapterManga() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime newestChapterCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewChapterManga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime newestChapterCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _NewChapterManga():
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime newestChapterCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NewChapterManga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewChapterManga implements NewChapterManga {
  const _NewChapterManga({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt});
  factory _NewChapterManga.fromJson(Map<String, dynamic> json) => _$NewChapterMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewChapterManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'NewChapterManga(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$NewChapterMangaCopyWith<$Res> implements $NewChapterMangaCopyWith<$Res> {
  factory _$NewChapterMangaCopyWith(_NewChapterManga value, $Res Function(_NewChapterManga) _then) = __$NewChapterMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime newestChapterCreatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = null,Object? newestChapterId = null,Object? newestChapterCreatedAt = null,}) {
  return _then(_NewChapterManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [MangaListResponse].
extension MangaListResponsePatterns on MangaListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaListResponse value)  $default,){
final _that = this;
switch (_that) {
case _MangaListResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MangaListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MangaItem> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaListResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MangaItem> data)  $default,) {final _that = this;
switch (_that) {
case _MangaListResponse():
return $default(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MangaItem> data)?  $default,) {final _that = this;
switch (_that) {
case _MangaListResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
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

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int? get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') String? get newestChapterCreatedAt;
/// Create a copy of MangaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaItemCopyWith<MangaItem> get copyWith => _$MangaItemCopyWithImpl<MangaItem>(this as MangaItem, _$identity);

  /// Serializes this MangaItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'MangaItem(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $MangaItemCopyWith<$Res>  {
  factory $MangaItemCopyWith(MangaItem value, $Res Function(MangaItem) _then) = _$MangaItemCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String? newestChapterCreatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaItem].
extension MangaItemPatterns on MangaItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaItem value)  $default,){
final _that = this;
switch (_that) {
case _MangaItem():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaItem value)?  $default,){
final _that = this;
switch (_that) {
case _MangaItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  String? newestChapterCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaItem() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  String? newestChapterCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _MangaItem():
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  String? newestChapterCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MangaItem() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaItem implements MangaItem {
  const _MangaItem({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt});
  factory _MangaItem.fromJson(Map<String, dynamic> json) => _$MangaItemFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int? newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  String? newestChapterCreatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'MangaItem(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$MangaItemCopyWith<$Res> implements $MangaItemCopyWith<$Res> {
  factory _$MangaItemCopyWith(_MangaItem value, $Res Function(_MangaItem) _then) = __$MangaItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') String? newestChapterCreatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_MangaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MangaDetail {

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl; Author get author; String get description;@JsonKey(name: 'full_description') String? get fullDescription;@JsonKey(name: 'views_count') int get viewsCount; List<Tag> get tags; Team get team; List<Title> get titles;
/// Create a copy of MangaDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaDetailCopyWith<MangaDetail> get copyWith => _$MangaDetailCopyWithImpl<MangaDetail>(this as MangaDetail, _$identity);

  /// Serializes this MangaDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.team, team) || other.team == team)&&const DeepCollectionEquality().equals(other.titles, titles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,author,description,fullDescription,viewsCount,const DeepCollectionEquality().hash(tags),team,const DeepCollectionEquality().hash(titles));

@override
String toString() {
  return 'MangaDetail(id: $id, name: $name, coverUrl: $coverUrl, author: $author, description: $description, fullDescription: $fullDescription, viewsCount: $viewsCount, tags: $tags, team: $team, titles: $titles)';
}


}

/// @nodoc
abstract mixin class $MangaDetailCopyWith<$Res>  {
  factory $MangaDetailCopyWith(MangaDetail value, $Res Function(MangaDetail) _then) = _$MangaDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl, Author author, String description,@JsonKey(name: 'full_description') String? fullDescription,@JsonKey(name: 'views_count') int viewsCount, List<Tag> tags, Team team, List<Title> titles
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? author = null,Object? description = null,Object? fullDescription = freezed,Object? viewsCount = null,Object? tags = null,Object? team = null,Object? titles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as List<Title>,
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


/// Adds pattern-matching-related methods to [MangaDetail].
extension MangaDetailPatterns on MangaDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaDetail value)  $default,){
final _that = this;
switch (_that) {
case _MangaDetail():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MangaDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl,  Author author,  String description, @JsonKey(name: 'full_description')  String? fullDescription, @JsonKey(name: 'views_count')  int viewsCount,  List<Tag> tags,  Team team,  List<Title> titles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaDetail() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.author,_that.description,_that.fullDescription,_that.viewsCount,_that.tags,_that.team,_that.titles);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl,  Author author,  String description, @JsonKey(name: 'full_description')  String? fullDescription, @JsonKey(name: 'views_count')  int viewsCount,  List<Tag> tags,  Team team,  List<Title> titles)  $default,) {final _that = this;
switch (_that) {
case _MangaDetail():
return $default(_that.id,_that.name,_that.coverUrl,_that.author,_that.description,_that.fullDescription,_that.viewsCount,_that.tags,_that.team,_that.titles);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl,  Author author,  String description, @JsonKey(name: 'full_description')  String? fullDescription, @JsonKey(name: 'views_count')  int viewsCount,  List<Tag> tags,  Team team,  List<Title> titles)?  $default,) {final _that = this;
switch (_that) {
case _MangaDetail() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.author,_that.description,_that.fullDescription,_that.viewsCount,_that.tags,_that.team,_that.titles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaDetail implements MangaDetail {
  const _MangaDetail({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, required this.author, required this.description, @JsonKey(name: 'full_description') this.fullDescription, @JsonKey(name: 'views_count') required this.viewsCount, required final  List<Tag> tags, required this.team, required final  List<Title> titles}): _tags = tags,_titles = titles;
  factory _MangaDetail.fromJson(Map<String, dynamic> json) => _$MangaDetailFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override final  Author author;
@override final  String description;
@override@JsonKey(name: 'full_description') final  String? fullDescription;
@override@JsonKey(name: 'views_count') final  int viewsCount;
 final  List<Tag> _tags;
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  Team team;
 final  List<Title> _titles;
@override List<Title> get titles {
  if (_titles is EqualUnmodifiableListView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_titles);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.team, team) || other.team == team)&&const DeepCollectionEquality().equals(other._titles, _titles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,author,description,fullDescription,viewsCount,const DeepCollectionEquality().hash(_tags),team,const DeepCollectionEquality().hash(_titles));

@override
String toString() {
  return 'MangaDetail(id: $id, name: $name, coverUrl: $coverUrl, author: $author, description: $description, fullDescription: $fullDescription, viewsCount: $viewsCount, tags: $tags, team: $team, titles: $titles)';
}


}

/// @nodoc
abstract mixin class _$MangaDetailCopyWith<$Res> implements $MangaDetailCopyWith<$Res> {
  factory _$MangaDetailCopyWith(_MangaDetail value, $Res Function(_MangaDetail) _then) = __$MangaDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl, Author author, String description,@JsonKey(name: 'full_description') String? fullDescription,@JsonKey(name: 'views_count') int viewsCount, List<Tag> tags, Team team, List<Title> titles
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? author = null,Object? description = null,Object? fullDescription = freezed,Object? viewsCount = null,Object? tags = null,Object? team = null,Object? titles = null,}) {
  return _then(_MangaDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as Team,titles: null == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as List<Title>,
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


/// Adds pattern-matching-related methods to [Author].
extension AuthorPatterns on Author {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Author value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Author value)  $default,){
final _that = this;
switch (_that) {
case _Author():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Author value)?  $default,){
final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.name);case _:
  return null;

}
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

 String get name; String get slug;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug);

@override
String toString() {
  return 'Tag(name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 String name, String slug
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Tag].
extension TagPatterns on Tag {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tag value)  $default,){
final _that = this;
switch (_that) {
case _Tag():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tag value)?  $default,){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.name,_that.slug);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String slug)  $default,) {final _that = this;
switch (_that) {
case _Tag():
return $default(_that.name,_that.slug);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String slug)?  $default,) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tag implements Tag {
  const _Tag({required this.name, required this.slug});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  String name;
@override final  String slug;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug);

@override
String toString() {
  return 'Tag(name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 String name, String slug
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,}) {
  return _then(_Tag(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Team {

 String get name;
/// Create a copy of Team
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamCopyWith<Team> get copyWith => _$TeamCopyWithImpl<Team>(this as Team, _$identity);

  /// Serializes this Team to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Team&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Team(name: $name)';
}


}

/// @nodoc
abstract mixin class $TeamCopyWith<$Res>  {
  factory $TeamCopyWith(Team value, $Res Function(Team) _then) = _$TeamCopyWithImpl;
@useResult
$Res call({
 String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Team].
extension TeamPatterns on Team {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Team value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Team value)  $default,){
final _that = this;
switch (_that) {
case _Team():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Team value)?  $default,){
final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _Team():
return $default(_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _Team() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Team implements Team {
  const _Team({required this.name});
  factory _Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

@override final  String name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Team&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Team(name: $name)';
}


}

/// @nodoc
abstract mixin class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) _then) = __$TeamCopyWithImpl;
@override @useResult
$Res call({
 String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Team(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Title {

 String get name;
/// Create a copy of Title
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitleCopyWith<Title> get copyWith => _$TitleCopyWithImpl<Title>(this as Title, _$identity);

  /// Serializes this Title to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Title&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Title(name: $name)';
}


}

/// @nodoc
abstract mixin class $TitleCopyWith<$Res>  {
  factory $TitleCopyWith(Title value, $Res Function(Title) _then) = _$TitleCopyWithImpl;
@useResult
$Res call({
 String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Title].
extension TitlePatterns on Title {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Title value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Title value)  $default,){
final _that = this;
switch (_that) {
case _Title():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Title value)?  $default,){
final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _Title():
return $default(_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _Title() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Title implements Title {
  const _Title({required this.name});
  factory _Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

@override final  String name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Title&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'Title(name: $name)';
}


}

/// @nodoc
abstract mixin class _$TitleCopyWith<$Res> implements $TitleCopyWith<$Res> {
  factory _$TitleCopyWith(_Title value, $Res Function(_Title) _then) = __$TitleCopyWithImpl;
@override @useResult
$Res call({
 String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_Title(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Chapter {

 int get id; int get order; String get number; String? get name;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,updatedAt);

@override
String toString() {
  return 'Chapter(id: $id, order: $order, number: $number, name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int order,  String number,  String? name, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.order,_that.number,_that.name,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int order,  String number,  String? name, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.order,_that.number,_that.name,_that.updatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int order,  String number,  String? name, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.order,_that.number,_that.name,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
  const _Chapter({required this.id, required this.order, required this.number, required this.name, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override final  int id;
@override final  int order;
@override final  String number;
@override final  String? name;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,number,name,updatedAt);

@override
String toString() {
  return 'Chapter(id: $id, order: $order, number: $number, name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, String number, String? name,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? number = null,Object? name = freezed,Object? updatedAt = null,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ChaptersResponse].
extension ChaptersResponsePatterns on ChaptersResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChaptersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChaptersResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChaptersResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChaptersResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChaptersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChaptersResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Chapter> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChaptersResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Chapter> data)  $default,) {final _that = this;
switch (_that) {
case _ChaptersResponse():
return $default(_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Chapter> data)?  $default,) {final _that = this;
switch (_that) {
case _ChaptersResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
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

 List<Page> get pages;
/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterResponseCopyWith<ChapterResponse> get copyWith => _$ChapterResponseCopyWithImpl<ChapterResponse>(this as ChapterResponse, _$identity);

  /// Serializes this ChapterResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterResponse&&const DeepCollectionEquality().equals(other.pages, pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pages));

@override
String toString() {
  return 'ChapterResponse(pages: $pages)';
}


}

/// @nodoc
abstract mixin class $ChapterResponseCopyWith<$Res>  {
  factory $ChapterResponseCopyWith(ChapterResponse value, $Res Function(ChapterResponse) _then) = _$ChapterResponseCopyWithImpl;
@useResult
$Res call({
 List<Page> pages
});




}
/// @nodoc
class _$ChapterResponseCopyWithImpl<$Res>
    implements $ChapterResponseCopyWith<$Res> {
  _$ChapterResponseCopyWithImpl(this._self, this._then);

  final ChapterResponse _self;
  final $Res Function(ChapterResponse) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pages = null,}) {
  return _then(_self.copyWith(
pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterResponse].
extension ChapterResponsePatterns on ChapterResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChapterResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Page> pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that.pages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Page> pages)  $default,) {final _that = this;
switch (_that) {
case _ChapterResponse():
return $default(_that.pages);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Page> pages)?  $default,) {final _that = this;
switch (_that) {
case _ChapterResponse() when $default != null:
return $default(_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterResponse implements ChapterResponse {
  const _ChapterResponse({required final  List<Page> pages}): _pages = pages;
  factory _ChapterResponse.fromJson(Map<String, dynamic> json) => _$ChapterResponseFromJson(json);

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterResponse&&const DeepCollectionEquality().equals(other._pages, _pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pages));

@override
String toString() {
  return 'ChapterResponse(pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$ChapterResponseCopyWith<$Res> implements $ChapterResponseCopyWith<$Res> {
  factory _$ChapterResponseCopyWith(_ChapterResponse value, $Res Function(_ChapterResponse) _then) = __$ChapterResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Page> pages
});




}
/// @nodoc
class __$ChapterResponseCopyWithImpl<$Res>
    implements _$ChapterResponseCopyWith<$Res> {
  __$ChapterResponseCopyWithImpl(this._self, this._then);

  final _ChapterResponse _self;
  final $Res Function(_ChapterResponse) _then;

/// Create a copy of ChapterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pages = null,}) {
  return _then(_ChapterResponse(
pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,
  ));
}


}


/// @nodoc
mixin _$Page {

@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'drm_data') String? get drmData;
/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageCopyWith<Page> get copyWith => _$PageCopyWithImpl<Page>(this as Page, _$identity);

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Page&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.drmData, drmData) || other.drmData == drmData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,drmData);

@override
String toString() {
  return 'Page(imageUrl: $imageUrl, drmData: $drmData)';
}


}

/// @nodoc
abstract mixin class $PageCopyWith<$Res>  {
  factory $PageCopyWith(Page value, $Res Function(Page) _then) = _$PageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'drm_data') String? drmData
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
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = null,Object? drmData = freezed,}) {
  return _then(_self.copyWith(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,drmData: freezed == drmData ? _self.drmData : drmData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Page].
extension PagePatterns on Page {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Page value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Page value)  $default,){
final _that = this;
switch (_that) {
case _Page():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Page value)?  $default,){
final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'drm_data')  String? drmData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.imageUrl,_that.drmData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'drm_data')  String? drmData)  $default,) {final _that = this;
switch (_that) {
case _Page():
return $default(_that.imageUrl,_that.drmData);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'drm_data')  String? drmData)?  $default,) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.imageUrl,_that.drmData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Page implements Page {
  const _Page({@JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'drm_data') this.drmData});
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

@override@JsonKey(name: 'image_url') final  String imageUrl;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Page&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.drmData, drmData) || other.drmData == drmData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,drmData);

@override
String toString() {
  return 'Page(imageUrl: $imageUrl, drmData: $drmData)';
}


}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) = __$PageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'drm_data') String? drmData
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
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? drmData = freezed,}) {
  return _then(_Page(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,drmData: freezed == drmData ? _self.drmData : drmData // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SearchResultManga {

 int get id; String get name;@JsonKey(name: 'cover_url') String get coverUrl;@JsonKey(name: 'newest_chapter_number') String? get newestChapterNumber;@JsonKey(name: 'newest_chapter_id') int? get newestChapterId;@JsonKey(name: 'newest_chapter_created_at') DateTime? get newestChapterCreatedAt;
/// Create a copy of SearchResultManga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultMangaCopyWith<SearchResultManga> get copyWith => _$SearchResultMangaCopyWithImpl<SearchResultManga>(this as SearchResultManga, _$identity);

  /// Serializes this SearchResultManga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'SearchResultManga(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class $SearchResultMangaCopyWith<$Res>  {
  factory $SearchResultMangaCopyWith(SearchResultManga value, $Res Function(SearchResultManga) _then) = _$SearchResultMangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime? newestChapterCreatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultManga].
extension SearchResultMangaPatterns on SearchResultManga {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultManga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultManga() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultManga value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultManga():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultManga value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultManga() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime? newestChapterCreatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultManga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime? newestChapterCreatedAt)  $default,) {final _that = this;
switch (_that) {
case _SearchResultManga():
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'cover_url')  String coverUrl, @JsonKey(name: 'newest_chapter_number')  String? newestChapterNumber, @JsonKey(name: 'newest_chapter_id')  int? newestChapterId, @JsonKey(name: 'newest_chapter_created_at')  DateTime? newestChapterCreatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultManga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl,_that.newestChapterNumber,_that.newestChapterId,_that.newestChapterCreatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultManga implements SearchResultManga {
  const _SearchResultManga({required this.id, required this.name, @JsonKey(name: 'cover_url') required this.coverUrl, @JsonKey(name: 'newest_chapter_number') required this.newestChapterNumber, @JsonKey(name: 'newest_chapter_id') required this.newestChapterId, @JsonKey(name: 'newest_chapter_created_at') required this.newestChapterCreatedAt});
  factory _SearchResultManga.fromJson(Map<String, dynamic> json) => _$SearchResultMangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String coverUrl;
@override@JsonKey(name: 'newest_chapter_number') final  String? newestChapterNumber;
@override@JsonKey(name: 'newest_chapter_id') final  int? newestChapterId;
@override@JsonKey(name: 'newest_chapter_created_at') final  DateTime? newestChapterCreatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultManga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.newestChapterNumber, newestChapterNumber) || other.newestChapterNumber == newestChapterNumber)&&(identical(other.newestChapterId, newestChapterId) || other.newestChapterId == newestChapterId)&&(identical(other.newestChapterCreatedAt, newestChapterCreatedAt) || other.newestChapterCreatedAt == newestChapterCreatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl,newestChapterNumber,newestChapterId,newestChapterCreatedAt);

@override
String toString() {
  return 'SearchResultManga(id: $id, name: $name, coverUrl: $coverUrl, newestChapterNumber: $newestChapterNumber, newestChapterId: $newestChapterId, newestChapterCreatedAt: $newestChapterCreatedAt)';
}


}

/// @nodoc
abstract mixin class _$SearchResultMangaCopyWith<$Res> implements $SearchResultMangaCopyWith<$Res> {
  factory _$SearchResultMangaCopyWith(_SearchResultManga value, $Res Function(_SearchResultManga) _then) = __$SearchResultMangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String coverUrl,@JsonKey(name: 'newest_chapter_number') String? newestChapterNumber,@JsonKey(name: 'newest_chapter_id') int? newestChapterId,@JsonKey(name: 'newest_chapter_created_at') DateTime? newestChapterCreatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = null,Object? newestChapterNumber = freezed,Object? newestChapterId = freezed,Object? newestChapterCreatedAt = freezed,}) {
  return _then(_SearchResultManga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,newestChapterNumber: freezed == newestChapterNumber ? _self.newestChapterNumber : newestChapterNumber // ignore: cast_nullable_to_non_nullable
as String?,newestChapterId: freezed == newestChapterId ? _self.newestChapterId : newestChapterId // ignore: cast_nullable_to_non_nullable
as int?,newestChapterCreatedAt: freezed == newestChapterCreatedAt ? _self.newestChapterCreatedAt : newestChapterCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Metadata {

@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'per_page') int get perPage;
/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataCopyWith<Metadata> get copyWith => _$MetadataCopyWithImpl<Metadata>(this as Metadata, _$identity);

  /// Serializes this Metadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metadata&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPages,perPage);

@override
String toString() {
  return 'Metadata(totalPages: $totalPages, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $MetadataCopyWith<$Res>  {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) _then) = _$MetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'per_page') int perPage
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalPages = null,Object? perPage = null,}) {
  return _then(_self.copyWith(
totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Metadata].
extension MetadataPatterns on Metadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metadata value)  $default,){
final _that = this;
switch (_that) {
case _Metadata():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metadata value)?  $default,){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'per_page')  int perPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.totalPages,_that.perPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'per_page')  int perPage)  $default,) {final _that = this;
switch (_that) {
case _Metadata():
return $default(_that.totalPages,_that.perPage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'per_page')  int perPage)?  $default,) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.totalPages,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metadata implements Metadata {
  const _Metadata({@JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'per_page') required this.perPage});
  factory _Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

@override@JsonKey(name: 'total_pages') final  int totalPages;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metadata&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPages,perPage);

@override
String toString() {
  return 'Metadata(totalPages: $totalPages, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$MetadataCopyWith<$Res> implements $MetadataCopyWith<$Res> {
  factory _$MetadataCopyWith(_Metadata value, $Res Function(_Metadata) _then) = __$MetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'per_page') int perPage
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalPages = null,Object? perPage = null,}) {
  return _then(_Metadata(
totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [SearchResultResponse].
extension SearchResultResponsePatterns on SearchResultResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<SearchResultManga> data, @JsonKey(name: '_metadata')  Metadata meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<SearchResultManga> data, @JsonKey(name: '_metadata')  Metadata meta)  $default,) {final _that = this;
switch (_that) {
case _SearchResultResponse():
return $default(_that.data,_that.meta);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data')  List<SearchResultManga> data, @JsonKey(name: '_metadata')  Metadata meta)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
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


/// Adds pattern-matching-related methods to [MangaTagResponse].
extension MangaTagResponsePatterns on MangaTagResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaTagResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaTagResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaTagResponse value)  $default,){
final _that = this;
switch (_that) {
case _MangaTagResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaTagResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MangaTagResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MangaListData data, @JsonKey(name: '_metadata')  Metadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaTagResponse() when $default != null:
return $default(_that.data,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MangaListData data, @JsonKey(name: '_metadata')  Metadata metadata)  $default,) {final _that = this;
switch (_that) {
case _MangaTagResponse():
return $default(_that.data,_that.metadata);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MangaListData data, @JsonKey(name: '_metadata')  Metadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _MangaTagResponse() when $default != null:
return $default(_that.data,_that.metadata);case _:
  return null;

}
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


/// Adds pattern-matching-related methods to [MangaListData].
extension MangaListDataPatterns on MangaListData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaListData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaListData value)  $default,){
final _that = this;
switch (_that) {
case _MangaListData():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaListData value)?  $default,){
final _that = this;
switch (_that) {
case _MangaListData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Manga> mangas,  Tag tag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaListData() when $default != null:
return $default(_that.mangas,_that.tag);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Manga> mangas,  Tag tag)  $default,) {final _that = this;
switch (_that) {
case _MangaListData():
return $default(_that.mangas,_that.tag);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Manga> mangas,  Tag tag)?  $default,) {final _that = this;
switch (_that) {
case _MangaListData() when $default != null:
return $default(_that.mangas,_that.tag);case _:
  return null;

}
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
mixin _$Manga {

 int get id; String get name;@JsonKey(name: 'cover_url') String? get coverUrl;
/// Create a copy of Manga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaCopyWith<Manga> get copyWith => _$MangaCopyWithImpl<Manga>(this as Manga, _$identity);

  /// Serializes this Manga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl);

@override
String toString() {
  return 'Manga(id: $id, name: $name, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $MangaCopyWith<$Res>  {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) _then) = _$MangaCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String? coverUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Manga].
extension MangaPatterns on Manga {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Manga value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Manga value)  $default,){
final _that = this;
switch (_that) {
case _Manga():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Manga value)?  $default,){
final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String? coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'cover_url')  String? coverUrl)  $default,) {final _that = this;
switch (_that) {
case _Manga():
return $default(_that.id,_that.name,_that.coverUrl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'cover_url')  String? coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _Manga() when $default != null:
return $default(_that.id,_that.name,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manga implements Manga {
  const _Manga({required this.id, required this.name, @JsonKey(name: 'cover_url') this.coverUrl});
  factory _Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manga&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverUrl);

@override
String toString() {
  return 'Manga(id: $id, name: $name, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$MangaCopyWith(_Manga value, $Res Function(_Manga) _then) = __$MangaCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'cover_url') String? coverUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverUrl = freezed,}) {
  return _then(_Manga(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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


/// Adds pattern-matching-related methods to [Comment].
extension CommentPatterns on Comment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comment value)  $default,){
final _that = this;
switch (_that) {
case _Comment():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comment value)?  $default,){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  CommentUser user, @JsonKey(name: 'processed_content')  String processedContent, @JsonKey(name: 'is_shadow_removed')  bool isShadowRemoved, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'replied_ids')  List<int> repliedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.user,_that.processedContent,_that.isShadowRemoved,_that.createdAt,_that.repliedIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  CommentUser user, @JsonKey(name: 'processed_content')  String processedContent, @JsonKey(name: 'is_shadow_removed')  bool isShadowRemoved, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'replied_ids')  List<int> repliedIds)  $default,) {final _that = this;
switch (_that) {
case _Comment():
return $default(_that.id,_that.user,_that.processedContent,_that.isShadowRemoved,_that.createdAt,_that.repliedIds);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  CommentUser user, @JsonKey(name: 'processed_content')  String processedContent, @JsonKey(name: 'is_shadow_removed')  bool isShadowRemoved, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'replied_ids')  List<int> repliedIds)?  $default,) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.user,_that.processedContent,_that.isShadowRemoved,_that.createdAt,_that.repliedIds);case _:
  return null;

}
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


/// Adds pattern-matching-related methods to [CommentUser].
extension CommentUserPatterns on CommentUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentUser value)  $default,){
final _that = this;
switch (_that) {
case _CommentUser():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentUser value)?  $default,){
final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  List<dynamic> teams,  String level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that.id,_that.username,_that.teams,_that.level);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  List<dynamic> teams,  String level)  $default,) {final _that = this;
switch (_that) {
case _CommentUser():
return $default(_that.id,_that.username,_that.teams,_that.level);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  List<dynamic> teams,  String level)?  $default,) {final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that.id,_that.username,_that.teams,_that.level);case _:
  return null;

}
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


/// Adds pattern-matching-related methods to [CommentsResponse].
extension CommentsResponsePatterns on CommentsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CommentsResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Comment> data,  int? total,  int? page, @JsonKey(name: 'page_size')  int? pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Comment> data,  int? total,  int? page, @JsonKey(name: 'page_size')  int? pageSize)  $default,) {final _that = this;
switch (_that) {
case _CommentsResponse():
return $default(_that.data,_that.total,_that.page,_that.pageSize);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Comment> data,  int? total,  int? page, @JsonKey(name: 'page_size')  int? pageSize)?  $default,) {final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.pageSize);case _:
  return null;

}
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
