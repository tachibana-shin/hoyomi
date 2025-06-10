// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaComic {
  String get name;
  String? get originalName;
  OImage get image;
  String? get author;
  String? get translator;
  StatusEnum get status;
  int? get views;
  int? get likes;
  RateValue? get rate;
  List<Genre> get genres;
  String get description;
  List<ComicChapter> get chapters;
  DateTime get lastModified;
  bool get fake;
  bool get offlineMode;

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetaComicCopyWith<MetaComic> get copyWith =>
      _$MetaComicCopyWithImpl<MetaComic>(this as MetaComic, _$identity);

  /// Serializes this MetaComic to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetaComic &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.chapters, chapters) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.fake, fake) || other.fake == fake) &&
            (identical(other.offlineMode, offlineMode) ||
                other.offlineMode == offlineMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      originalName,
      image,
      author,
      translator,
      status,
      views,
      likes,
      rate,
      const DeepCollectionEquality().hash(genres),
      description,
      const DeepCollectionEquality().hash(chapters),
      lastModified,
      fake,
      offlineMode);

  @override
  String toString() {
    return 'MetaComic(name: $name, originalName: $originalName, image: $image, author: $author, translator: $translator, status: $status, views: $views, likes: $likes, rate: $rate, genres: $genres, description: $description, chapters: $chapters, lastModified: $lastModified, fake: $fake, offlineMode: $offlineMode)';
  }
}

/// @nodoc
abstract mixin class $MetaComicCopyWith<$Res> {
  factory $MetaComicCopyWith(MetaComic value, $Res Function(MetaComic) _then) =
      _$MetaComicCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String? originalName,
      OImage image,
      String? author,
      String? translator,
      StatusEnum status,
      int? views,
      int? likes,
      RateValue? rate,
      List<Genre> genres,
      String description,
      List<ComicChapter> chapters,
      DateTime lastModified,
      bool fake,
      bool offlineMode});

  $OImageCopyWith<$Res> get image;
  $RateValueCopyWith<$Res>? get rate;
}

/// @nodoc
class _$MetaComicCopyWithImpl<$Res> implements $MetaComicCopyWith<$Res> {
  _$MetaComicCopyWithImpl(this._self, this._then);

  final MetaComic _self;
  final $Res Function(MetaComic) _then;

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? author = freezed,
    Object? translator = freezed,
    Object? status = null,
    Object? views = freezed,
    Object? likes = freezed,
    Object? rate = freezed,
    Object? genres = null,
    Object? description = null,
    Object? chapters = null,
    Object? lastModified = null,
    Object? fake = null,
    Object? offlineMode = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _self.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      translator: freezed == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      views: freezed == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateValue?,
      genres: null == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _self.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ComicChapter>,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fake: null == fake
          ? _self.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineMode: null == offlineMode
          ? _self.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get image {
    return $OImageCopyWith<$Res>(_self.image, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RateValueCopyWith<$Res>? get rate {
    if (_self.rate == null) {
      return null;
    }

    return $RateValueCopyWith<$Res>(_self.rate!, (value) {
      return _then(_self.copyWith(rate: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MetaComic implements MetaComic {
  const _MetaComic(
      {required this.name,
      this.originalName,
      required this.image,
      this.author,
      this.translator,
      required this.status,
      this.views,
      this.likes,
      this.rate,
      required final List<Genre> genres,
      required this.description,
      required final List<ComicChapter> chapters,
      required this.lastModified,
      this.fake = false,
      this.offlineMode = false})
      : _genres = genres,
        _chapters = chapters;
  factory _MetaComic.fromJson(Map<String, dynamic> json) =>
      _$MetaComicFromJson(json);

  @override
  final String name;
  @override
  final String? originalName;
  @override
  final OImage image;
  @override
  final String? author;
  @override
  final String? translator;
  @override
  final StatusEnum status;
  @override
  final int? views;
  @override
  final int? likes;
  @override
  final RateValue? rate;
  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final String description;
  final List<ComicChapter> _chapters;
  @override
  List<ComicChapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  final DateTime lastModified;
  @override
  @JsonKey()
  final bool fake;
  @override
  @JsonKey()
  final bool offlineMode;

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MetaComicCopyWith<_MetaComic> get copyWith =>
      __$MetaComicCopyWithImpl<_MetaComic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MetaComicToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MetaComic &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.translator, translator) ||
                other.translator == translator) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.fake, fake) || other.fake == fake) &&
            (identical(other.offlineMode, offlineMode) ||
                other.offlineMode == offlineMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      originalName,
      image,
      author,
      translator,
      status,
      views,
      likes,
      rate,
      const DeepCollectionEquality().hash(_genres),
      description,
      const DeepCollectionEquality().hash(_chapters),
      lastModified,
      fake,
      offlineMode);

  @override
  String toString() {
    return 'MetaComic(name: $name, originalName: $originalName, image: $image, author: $author, translator: $translator, status: $status, views: $views, likes: $likes, rate: $rate, genres: $genres, description: $description, chapters: $chapters, lastModified: $lastModified, fake: $fake, offlineMode: $offlineMode)';
  }
}

/// @nodoc
abstract mixin class _$MetaComicCopyWith<$Res>
    implements $MetaComicCopyWith<$Res> {
  factory _$MetaComicCopyWith(
          _MetaComic value, $Res Function(_MetaComic) _then) =
      __$MetaComicCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String? originalName,
      OImage image,
      String? author,
      String? translator,
      StatusEnum status,
      int? views,
      int? likes,
      RateValue? rate,
      List<Genre> genres,
      String description,
      List<ComicChapter> chapters,
      DateTime lastModified,
      bool fake,
      bool offlineMode});

  @override
  $OImageCopyWith<$Res> get image;
  @override
  $RateValueCopyWith<$Res>? get rate;
}

/// @nodoc
class __$MetaComicCopyWithImpl<$Res> implements _$MetaComicCopyWith<$Res> {
  __$MetaComicCopyWithImpl(this._self, this._then);

  final _MetaComic _self;
  final $Res Function(_MetaComic) _then;

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? originalName = freezed,
    Object? image = null,
    Object? author = freezed,
    Object? translator = freezed,
    Object? status = null,
    Object? views = freezed,
    Object? likes = freezed,
    Object? rate = freezed,
    Object? genres = null,
    Object? description = null,
    Object? chapters = null,
    Object? lastModified = null,
    Object? fake = null,
    Object? offlineMode = null,
  }) {
    return _then(_MetaComic(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _self.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      translator: freezed == translator
          ? _self.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      views: freezed == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateValue?,
      genres: null == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _self._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ComicChapter>,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fake: null == fake
          ? _self.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineMode: null == offlineMode
          ? _self.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get image {
    return $OImageCopyWith<$Res>(_self.image, (value) {
      return _then(_self.copyWith(image: value));
    });
  }

  /// Create a copy of MetaComic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RateValueCopyWith<$Res>? get rate {
    if (_self.rate == null) {
      return null;
    }

    return $RateValueCopyWith<$Res>(_self.rate!, (value) {
      return _then(_self.copyWith(rate: value));
    });
  }
}

// dart format on
