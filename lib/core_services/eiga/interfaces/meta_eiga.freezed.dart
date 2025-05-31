// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_eiga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Season {

 String get name; String get eigaId;
/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonCopyWith<Season> get copyWith => _$SeasonCopyWithImpl<Season>(this as Season, _$identity);

  /// Serializes this Season to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Season&&(identical(other.name, name) || other.name == name)&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,eigaId);

@override
String toString() {
  return 'Season(name: $name, eigaId: $eigaId)';
}


}

/// @nodoc
abstract mixin class $SeasonCopyWith<$Res>  {
  factory $SeasonCopyWith(Season value, $Res Function(Season) _then) = _$SeasonCopyWithImpl;
@useResult
$Res call({
 String name, String eigaId
});




}
/// @nodoc
class _$SeasonCopyWithImpl<$Res>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._self, this._then);

  final Season _self;
  final $Res Function(Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? eigaId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Season implements Season {
  const _Season({required this.name, required this.eigaId});
  factory _Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

@override final  String name;
@override final  String eigaId;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonCopyWith<_Season> get copyWith => __$SeasonCopyWithImpl<_Season>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Season&&(identical(other.name, name) || other.name == name)&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,eigaId);

@override
String toString() {
  return 'Season(name: $name, eigaId: $eigaId)';
}


}

/// @nodoc
abstract mixin class _$SeasonCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$SeasonCopyWith(_Season value, $Res Function(_Season) _then) = __$SeasonCopyWithImpl;
@override @useResult
$Res call({
 String name, String eigaId
});




}
/// @nodoc
class __$SeasonCopyWithImpl<$Res>
    implements _$SeasonCopyWith<$Res> {
  __$SeasonCopyWithImpl(this._self, this._then);

  final _Season _self;
  final $Res Function(_Season) _then;

/// Create a copy of Season
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? eigaId = null,}) {
  return _then(_Season(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MetaEiga {

 String get name; String? get originalName; OImage get image; OImage? get poster; String get description; double? get rate; int? get countRate; int? get countSub; int? get countDub; String? get duration; int? get yearOf; int? get views; List<Season> get seasons; List<Genre> get genres; String? get quality; List<Genre>? get authors; List<Genre>? get countries; String? get language; List<Genre>? get studios; StatusEnum get status; Genre? get movieSeason; String? get trailer; bool get fake;
/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<MetaEiga> get copyWith => _$MetaEigaCopyWithImpl<MetaEiga>(this as MetaEiga, _$identity);

  /// Serializes this MetaEiga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaEiga&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.description, description) || other.description == description)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.countRate, countRate) || other.countRate == countRate)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.yearOf, yearOf) || other.yearOf == yearOf)&&(identical(other.views, views) || other.views == views)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.quality, quality) || other.quality == quality)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.countries, countries)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.studios, studios)&&(identical(other.status, status) || other.status == status)&&(identical(other.movieSeason, movieSeason) || other.movieSeason == movieSeason)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&(identical(other.fake, fake) || other.fake == fake));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,originalName,image,poster,description,rate,countRate,countSub,countDub,duration,yearOf,views,const DeepCollectionEquality().hash(seasons),const DeepCollectionEquality().hash(genres),quality,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(countries),language,const DeepCollectionEquality().hash(studios),status,movieSeason,trailer,fake]);

@override
String toString() {
  return 'MetaEiga(name: $name, originalName: $originalName, image: $image, poster: $poster, description: $description, rate: $rate, countRate: $countRate, countSub: $countSub, countDub: $countDub, duration: $duration, yearOf: $yearOf, views: $views, seasons: $seasons, genres: $genres, quality: $quality, authors: $authors, countries: $countries, language: $language, studios: $studios, status: $status, movieSeason: $movieSeason, trailer: $trailer, fake: $fake)';
}


}

/// @nodoc
abstract mixin class $MetaEigaCopyWith<$Res>  {
  factory $MetaEigaCopyWith(MetaEiga value, $Res Function(MetaEiga) _then) = _$MetaEigaCopyWithImpl;
@useResult
$Res call({
 String name, String? originalName, OImage image, OImage? poster, String description, double? rate, int? countRate, int? countSub, int? countDub, String? duration, int? yearOf, int? views, List<Season> seasons, List<Genre> genres, String? quality, List<Genre>? authors, List<Genre>? countries, String? language, List<Genre>? studios, StatusEnum status, Genre? movieSeason, String? trailer, bool fake
});


$OImageCopyWith<$Res> get image;$OImageCopyWith<$Res>? get poster;$GenreCopyWith<$Res>? get movieSeason;

}
/// @nodoc
class _$MetaEigaCopyWithImpl<$Res>
    implements $MetaEigaCopyWith<$Res> {
  _$MetaEigaCopyWithImpl(this._self, this._then);

  final MetaEiga _self;
  final $Res Function(MetaEiga) _then;

/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? originalName = freezed,Object? image = null,Object? poster = freezed,Object? description = null,Object? rate = freezed,Object? countRate = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? duration = freezed,Object? yearOf = freezed,Object? views = freezed,Object? seasons = null,Object? genres = null,Object? quality = freezed,Object? authors = freezed,Object? countries = freezed,Object? language = freezed,Object? studios = freezed,Object? status = null,Object? movieSeason = freezed,Object? trailer = freezed,Object? fake = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as OImage?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,countRate: freezed == countRate ? _self.countRate : countRate // ignore: cast_nullable_to_non_nullable
as int?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,yearOf: freezed == yearOf ? _self.yearOf : yearOf // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,seasons: null == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<Genre>?,countries: freezed == countries ? _self.countries : countries // ignore: cast_nullable_to_non_nullable
as List<Genre>?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,studios: freezed == studios ? _self.studios : studios // ignore: cast_nullable_to_non_nullable
as List<Genre>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusEnum,movieSeason: freezed == movieSeason ? _self.movieSeason : movieSeason // ignore: cast_nullable_to_non_nullable
as Genre?,trailer: freezed == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String?,fake: null == fake ? _self.fake : fake // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res>? get movieSeason {
    if (_self.movieSeason == null) {
    return null;
  }

  return $GenreCopyWith<$Res>(_self.movieSeason!, (value) {
    return _then(_self.copyWith(movieSeason: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MetaEiga implements MetaEiga {
  const _MetaEiga({required this.name, this.originalName, required this.image, this.poster, required this.description, this.rate, this.countRate, this.countSub, this.countDub, this.duration, this.yearOf, this.views, required final  List<Season> seasons, required final  List<Genre> genres, this.quality, final  List<Genre>? authors, final  List<Genre>? countries, this.language, final  List<Genre>? studios, required this.status, this.movieSeason, this.trailer, this.fake = false}): _seasons = seasons,_genres = genres,_authors = authors,_countries = countries,_studios = studios;
  factory _MetaEiga.fromJson(Map<String, dynamic> json) => _$MetaEigaFromJson(json);

@override final  String name;
@override final  String? originalName;
@override final  OImage image;
@override final  OImage? poster;
@override final  String description;
@override final  double? rate;
@override final  int? countRate;
@override final  int? countSub;
@override final  int? countDub;
@override final  String? duration;
@override final  int? yearOf;
@override final  int? views;
 final  List<Season> _seasons;
@override List<Season> get seasons {
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasons);
}

 final  List<Genre> _genres;
@override List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override final  String? quality;
 final  List<Genre>? _authors;
@override List<Genre>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Genre>? _countries;
@override List<Genre>? get countries {
  final value = _countries;
  if (value == null) return null;
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? language;
 final  List<Genre>? _studios;
@override List<Genre>? get studios {
  final value = _studios;
  if (value == null) return null;
  if (_studios is EqualUnmodifiableListView) return _studios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  StatusEnum status;
@override final  Genre? movieSeason;
@override final  String? trailer;
@override@JsonKey() final  bool fake;

/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaEigaCopyWith<_MetaEiga> get copyWith => __$MetaEigaCopyWithImpl<_MetaEiga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaEigaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaEiga&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.description, description) || other.description == description)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.countRate, countRate) || other.countRate == countRate)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.yearOf, yearOf) || other.yearOf == yearOf)&&(identical(other.views, views) || other.views == views)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.quality, quality) || other.quality == quality)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._countries, _countries)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._studios, _studios)&&(identical(other.status, status) || other.status == status)&&(identical(other.movieSeason, movieSeason) || other.movieSeason == movieSeason)&&(identical(other.trailer, trailer) || other.trailer == trailer)&&(identical(other.fake, fake) || other.fake == fake));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,originalName,image,poster,description,rate,countRate,countSub,countDub,duration,yearOf,views,const DeepCollectionEquality().hash(_seasons),const DeepCollectionEquality().hash(_genres),quality,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_countries),language,const DeepCollectionEquality().hash(_studios),status,movieSeason,trailer,fake]);

@override
String toString() {
  return 'MetaEiga(name: $name, originalName: $originalName, image: $image, poster: $poster, description: $description, rate: $rate, countRate: $countRate, countSub: $countSub, countDub: $countDub, duration: $duration, yearOf: $yearOf, views: $views, seasons: $seasons, genres: $genres, quality: $quality, authors: $authors, countries: $countries, language: $language, studios: $studios, status: $status, movieSeason: $movieSeason, trailer: $trailer, fake: $fake)';
}


}

/// @nodoc
abstract mixin class _$MetaEigaCopyWith<$Res> implements $MetaEigaCopyWith<$Res> {
  factory _$MetaEigaCopyWith(_MetaEiga value, $Res Function(_MetaEiga) _then) = __$MetaEigaCopyWithImpl;
@override @useResult
$Res call({
 String name, String? originalName, OImage image, OImage? poster, String description, double? rate, int? countRate, int? countSub, int? countDub, String? duration, int? yearOf, int? views, List<Season> seasons, List<Genre> genres, String? quality, List<Genre>? authors, List<Genre>? countries, String? language, List<Genre>? studios, StatusEnum status, Genre? movieSeason, String? trailer, bool fake
});


@override $OImageCopyWith<$Res> get image;@override $OImageCopyWith<$Res>? get poster;@override $GenreCopyWith<$Res>? get movieSeason;

}
/// @nodoc
class __$MetaEigaCopyWithImpl<$Res>
    implements _$MetaEigaCopyWith<$Res> {
  __$MetaEigaCopyWithImpl(this._self, this._then);

  final _MetaEiga _self;
  final $Res Function(_MetaEiga) _then;

/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? originalName = freezed,Object? image = null,Object? poster = freezed,Object? description = null,Object? rate = freezed,Object? countRate = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? duration = freezed,Object? yearOf = freezed,Object? views = freezed,Object? seasons = null,Object? genres = null,Object? quality = freezed,Object? authors = freezed,Object? countries = freezed,Object? language = freezed,Object? studios = freezed,Object? status = null,Object? movieSeason = freezed,Object? trailer = freezed,Object? fake = null,}) {
  return _then(_MetaEiga(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as OImage?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,countRate: freezed == countRate ? _self.countRate : countRate // ignore: cast_nullable_to_non_nullable
as int?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,yearOf: freezed == yearOf ? _self.yearOf : yearOf // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,seasons: null == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<Season>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,quality: freezed == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Genre>?,countries: freezed == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<Genre>?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,studios: freezed == studios ? _self._studios : studios // ignore: cast_nullable_to_non_nullable
as List<Genre>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusEnum,movieSeason: freezed == movieSeason ? _self.movieSeason : movieSeason // ignore: cast_nullable_to_non_nullable
as Genre?,trailer: freezed == trailer ? _self.trailer : trailer // ignore: cast_nullable_to_non_nullable
as String?,fake: null == fake ? _self.fake : fake // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}/// Create a copy of MetaEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res>? get movieSeason {
    if (_self.movieSeason == null) {
    return null;
  }

  return $GenreCopyWith<$Res>(_self.movieSeason!, (value) {
    return _then(_self.copyWith(movieSeason: value));
  });
}
}

// dart format on
