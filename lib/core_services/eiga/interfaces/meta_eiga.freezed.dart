// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_eiga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Season _$SeasonFromJson(Map<String, dynamic> json) {
  return _Season.fromJson(json);
}

/// @nodoc
mixin _$Season {
  String get name => throw _privateConstructorUsedError;
  String get eigaId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonCopyWith<Season> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonCopyWith<$Res> {
  factory $SeasonCopyWith(Season value, $Res Function(Season) then) =
      _$SeasonCopyWithImpl<$Res, Season>;
  @useResult
  $Res call({String name, String eigaId});
}

/// @nodoc
class _$SeasonCopyWithImpl<$Res, $Val extends Season>
    implements $SeasonCopyWith<$Res> {
  _$SeasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? eigaId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonImplCopyWith<$Res> implements $SeasonCopyWith<$Res> {
  factory _$$SeasonImplCopyWith(
          _$SeasonImpl value, $Res Function(_$SeasonImpl) then) =
      __$$SeasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String eigaId});
}

/// @nodoc
class __$$SeasonImplCopyWithImpl<$Res>
    extends _$SeasonCopyWithImpl<$Res, _$SeasonImpl>
    implements _$$SeasonImplCopyWith<$Res> {
  __$$SeasonImplCopyWithImpl(
      _$SeasonImpl _value, $Res Function(_$SeasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? eigaId = null,
  }) {
    return _then(_$SeasonImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonImpl implements _Season {
  const _$SeasonImpl({required this.name, required this.eigaId});

  factory _$SeasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonImplFromJson(json);

  @override
  final String name;
  @override
  final String eigaId;

  @override
  String toString() {
    return 'Season(name: $name, eigaId: $eigaId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, eigaId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      __$$SeasonImplCopyWithImpl<_$SeasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonImplToJson(
      this,
    );
  }
}

abstract class _Season implements Season {
  const factory _Season(
      {required final String name,
      required final String eigaId}) = _$SeasonImpl;

  factory _Season.fromJson(Map<String, dynamic> json) = _$SeasonImpl.fromJson;

  @override
  String get name;
  @override
  String get eigaId;
  @override
  @JsonKey(ignore: true)
  _$$SeasonImplCopyWith<_$SeasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaEiga _$MetaEigaFromJson(Map<String, dynamic> json) {
  return _MetaEiga.fromJson(json);
}

/// @nodoc
mixin _$MetaEiga {
  String get name => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  OImage get image => throw _privateConstructorUsedError;
  OImage? get poster => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  int? get countRate => throw _privateConstructorUsedError;
  int? get countSub => throw _privateConstructorUsedError;
  int? get countDub => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  int? get yearOf => throw _privateConstructorUsedError;
  int? get views => throw _privateConstructorUsedError;
  List<Season> get seasons => throw _privateConstructorUsedError;
  List<Genre> get genres => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;
  List<Genre>? get authors => throw _privateConstructorUsedError;
  List<Genre>? get countries => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  List<Genre>? get studios => throw _privateConstructorUsedError;
  Genre? get movieSeason => throw _privateConstructorUsedError;
  String? get trailer => throw _privateConstructorUsedError;
  bool get fake => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaEigaCopyWith<MetaEiga> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaEigaCopyWith<$Res> {
  factory $MetaEigaCopyWith(MetaEiga value, $Res Function(MetaEiga) then) =
      _$MetaEigaCopyWithImpl<$Res, MetaEiga>;
  @useResult
  $Res call(
      {String name,
      String? originalName,
      OImage image,
      OImage? poster,
      String description,
      double? rate,
      int? countRate,
      int? countSub,
      int? countDub,
      String? duration,
      int? yearOf,
      int? views,
      List<Season> seasons,
      List<Genre> genres,
      String? quality,
      List<Genre>? authors,
      List<Genre>? countries,
      String? language,
      List<Genre>? studios,
      Genre? movieSeason,
      String? trailer,
      bool fake});

  $OImageCopyWith<$Res> get image;
  $OImageCopyWith<$Res>? get poster;
  $GenreCopyWith<$Res>? get movieSeason;
}

/// @nodoc
class _$MetaEigaCopyWithImpl<$Res, $Val extends MetaEiga>
    implements $MetaEigaCopyWith<$Res> {
  _$MetaEigaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? poster = freezed,
    Object? description = null,
    Object? rate = freezed,
    Object? countRate = freezed,
    Object? countSub = freezed,
    Object? countDub = freezed,
    Object? duration = freezed,
    Object? yearOf = freezed,
    Object? views = freezed,
    Object? seasons = null,
    Object? genres = null,
    Object? quality = freezed,
    Object? authors = freezed,
    Object? countries = freezed,
    Object? language = freezed,
    Object? studios = freezed,
    Object? movieSeason = freezed,
    Object? trailer = freezed,
    Object? fake = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OImage?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      countRate: freezed == countRate
          ? _value.countRate
          : countRate // ignore: cast_nullable_to_non_nullable
              as int?,
      countSub: freezed == countSub
          ? _value.countSub
          : countSub // ignore: cast_nullable_to_non_nullable
              as int?,
      countDub: freezed == countDub
          ? _value.countDub
          : countDub // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOf: freezed == yearOf
          ? _value.yearOf
          : yearOf // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      countries: freezed == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      studios: freezed == studios
          ? _value.studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      movieSeason: freezed == movieSeason
          ? _value.movieSeason
          : movieSeason // ignore: cast_nullable_to_non_nullable
              as Genre?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as String?,
      fake: null == fake
          ? _value.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get image {
    return $OImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get poster {
    if (_value.poster == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_value.poster!, (value) {
      return _then(_value.copyWith(poster: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GenreCopyWith<$Res>? get movieSeason {
    if (_value.movieSeason == null) {
      return null;
    }

    return $GenreCopyWith<$Res>(_value.movieSeason!, (value) {
      return _then(_value.copyWith(movieSeason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaEigaImplCopyWith<$Res>
    implements $MetaEigaCopyWith<$Res> {
  factory _$$MetaEigaImplCopyWith(
          _$MetaEigaImpl value, $Res Function(_$MetaEigaImpl) then) =
      __$$MetaEigaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? originalName,
      OImage image,
      OImage? poster,
      String description,
      double? rate,
      int? countRate,
      int? countSub,
      int? countDub,
      String? duration,
      int? yearOf,
      int? views,
      List<Season> seasons,
      List<Genre> genres,
      String? quality,
      List<Genre>? authors,
      List<Genre>? countries,
      String? language,
      List<Genre>? studios,
      Genre? movieSeason,
      String? trailer,
      bool fake});

  @override
  $OImageCopyWith<$Res> get image;
  @override
  $OImageCopyWith<$Res>? get poster;
  @override
  $GenreCopyWith<$Res>? get movieSeason;
}

/// @nodoc
class __$$MetaEigaImplCopyWithImpl<$Res>
    extends _$MetaEigaCopyWithImpl<$Res, _$MetaEigaImpl>
    implements _$$MetaEigaImplCopyWith<$Res> {
  __$$MetaEigaImplCopyWithImpl(
      _$MetaEigaImpl _value, $Res Function(_$MetaEigaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? poster = freezed,
    Object? description = null,
    Object? rate = freezed,
    Object? countRate = freezed,
    Object? countSub = freezed,
    Object? countDub = freezed,
    Object? duration = freezed,
    Object? yearOf = freezed,
    Object? views = freezed,
    Object? seasons = null,
    Object? genres = null,
    Object? quality = freezed,
    Object? authors = freezed,
    Object? countries = freezed,
    Object? language = freezed,
    Object? studios = freezed,
    Object? movieSeason = freezed,
    Object? trailer = freezed,
    Object? fake = null,
  }) {
    return _then(_$MetaEigaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OImage?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      countRate: freezed == countRate
          ? _value.countRate
          : countRate // ignore: cast_nullable_to_non_nullable
              as int?,
      countSub: freezed == countSub
          ? _value.countSub
          : countSub // ignore: cast_nullable_to_non_nullable
              as int?,
      countDub: freezed == countDub
          ? _value.countDub
          : countDub // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      yearOf: freezed == yearOf
          ? _value.yearOf
          : yearOf // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      countries: freezed == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      studios: freezed == studios
          ? _value._studios
          : studios // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      movieSeason: freezed == movieSeason
          ? _value.movieSeason
          : movieSeason // ignore: cast_nullable_to_non_nullable
              as Genre?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as String?,
      fake: null == fake
          ? _value.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaEigaImpl implements _MetaEiga {
  const _$MetaEigaImpl(
      {required this.name,
      this.originalName,
      required this.image,
      this.poster,
      required this.description,
      this.rate,
      this.countRate,
      this.countSub,
      this.countDub,
      this.duration,
      this.yearOf,
      this.views,
      required final List<Season> seasons,
      required final List<Genre> genres,
      this.quality,
      final List<Genre>? authors,
      final List<Genre>? countries,
      this.language,
      final List<Genre>? studios,
      this.movieSeason,
      this.trailer,
      this.fake = false})
      : _seasons = seasons,
        _genres = genres,
        _authors = authors,
        _countries = countries,
        _studios = studios;

  factory _$MetaEigaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaEigaImplFromJson(json);

  @override
  final String name;
  @override
  final String? originalName;
  @override
  final OImage image;
  @override
  final OImage? poster;
  @override
  final String description;
  @override
  final double? rate;
  @override
  final int? countRate;
  @override
  final int? countSub;
  @override
  final int? countDub;
  @override
  final String? duration;
  @override
  final int? yearOf;
  @override
  final int? views;
  final List<Season> _seasons;
  @override
  List<Season> get seasons {
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seasons);
  }

  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final String? quality;
  final List<Genre>? _authors;
  @override
  List<Genre>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Genre>? _countries;
  @override
  List<Genre>? get countries {
    final value = _countries;
    if (value == null) return null;
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? language;
  final List<Genre>? _studios;
  @override
  List<Genre>? get studios {
    final value = _studios;
    if (value == null) return null;
    if (_studios is EqualUnmodifiableListView) return _studios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Genre? movieSeason;
  @override
  final String? trailer;
  @override
  @JsonKey()
  final bool fake;

  @override
  String toString() {
    return 'MetaEiga(name: $name, originalName: $originalName, image: $image, poster: $poster, description: $description, rate: $rate, countRate: $countRate, countSub: $countSub, countDub: $countDub, duration: $duration, yearOf: $yearOf, views: $views, seasons: $seasons, genres: $genres, quality: $quality, authors: $authors, countries: $countries, language: $language, studios: $studios, movieSeason: $movieSeason, trailer: $trailer, fake: $fake)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaEigaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.countRate, countRate) ||
                other.countRate == countRate) &&
            (identical(other.countSub, countSub) ||
                other.countSub == countSub) &&
            (identical(other.countDub, countDub) ||
                other.countDub == countDub) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.yearOf, yearOf) || other.yearOf == yearOf) &&
            (identical(other.views, views) || other.views == views) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._studios, _studios) &&
            (identical(other.movieSeason, movieSeason) ||
                other.movieSeason == movieSeason) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            (identical(other.fake, fake) || other.fake == fake));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        originalName,
        image,
        poster,
        description,
        rate,
        countRate,
        countSub,
        countDub,
        duration,
        yearOf,
        views,
        const DeepCollectionEquality().hash(_seasons),
        const DeepCollectionEquality().hash(_genres),
        quality,
        const DeepCollectionEquality().hash(_authors),
        const DeepCollectionEquality().hash(_countries),
        language,
        const DeepCollectionEquality().hash(_studios),
        movieSeason,
        trailer,
        fake
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaEigaImplCopyWith<_$MetaEigaImpl> get copyWith =>
      __$$MetaEigaImplCopyWithImpl<_$MetaEigaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaEigaImplToJson(
      this,
    );
  }
}

abstract class _MetaEiga implements MetaEiga {
  const factory _MetaEiga(
      {required final String name,
      final String? originalName,
      required final OImage image,
      final OImage? poster,
      required final String description,
      final double? rate,
      final int? countRate,
      final int? countSub,
      final int? countDub,
      final String? duration,
      final int? yearOf,
      final int? views,
      required final List<Season> seasons,
      required final List<Genre> genres,
      final String? quality,
      final List<Genre>? authors,
      final List<Genre>? countries,
      final String? language,
      final List<Genre>? studios,
      final Genre? movieSeason,
      final String? trailer,
      final bool fake}) = _$MetaEigaImpl;

  factory _MetaEiga.fromJson(Map<String, dynamic> json) =
      _$MetaEigaImpl.fromJson;

  @override
  String get name;
  @override
  String? get originalName;
  @override
  OImage get image;
  @override
  OImage? get poster;
  @override
  String get description;
  @override
  double? get rate;
  @override
  int? get countRate;
  @override
  int? get countSub;
  @override
  int? get countDub;
  @override
  String? get duration;
  @override
  int? get yearOf;
  @override
  int? get views;
  @override
  List<Season> get seasons;
  @override
  List<Genre> get genres;
  @override
  String? get quality;
  @override
  List<Genre>? get authors;
  @override
  List<Genre>? get countries;
  @override
  String? get language;
  @override
  List<Genre>? get studios;
  @override
  Genre? get movieSeason;
  @override
  String? get trailer;
  @override
  bool get fake;
  @override
  @JsonKey(ignore: true)
  _$$MetaEigaImplCopyWith<_$MetaEigaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
