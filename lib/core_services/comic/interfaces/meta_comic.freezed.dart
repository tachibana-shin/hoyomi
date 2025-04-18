// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaComic _$MetaComicFromJson(Map<String, dynamic> json) {
  return _MetaComic.fromJson(json);
}

/// @nodoc
mixin _$MetaComic {
  String get name => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  OImage get image => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get translator => throw _privateConstructorUsedError;
  StatusEnum get status => throw _privateConstructorUsedError;
  int? get views => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  RateValue? get rate => throw _privateConstructorUsedError;
  List<Genre> get genres => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ComicChapter> get chapters => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;
  bool get fake => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaComicCopyWith<MetaComic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaComicCopyWith<$Res> {
  factory $MetaComicCopyWith(MetaComic value, $Res Function(MetaComic) then) =
      _$MetaComicCopyWithImpl<$Res, MetaComic>;
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
      bool fake});

  $OImageCopyWith<$Res> get image;
  $RateValueCopyWith<$Res>? get rate;
}

/// @nodoc
class _$MetaComicCopyWithImpl<$Res, $Val extends MetaComic>
    implements $MetaComicCopyWith<$Res> {
  _$MetaComicCopyWithImpl(this._value, this._then);

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
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      translator: freezed == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateValue?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ComicChapter>,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $RateValueCopyWith<$Res>? get rate {
    if (_value.rate == null) {
      return null;
    }

    return $RateValueCopyWith<$Res>(_value.rate!, (value) {
      return _then(_value.copyWith(rate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaComicImplCopyWith<$Res>
    implements $MetaComicCopyWith<$Res> {
  factory _$$MetaComicImplCopyWith(
          _$MetaComicImpl value, $Res Function(_$MetaComicImpl) then) =
      __$$MetaComicImplCopyWithImpl<$Res>;
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
      bool fake});

  @override
  $OImageCopyWith<$Res> get image;
  @override
  $RateValueCopyWith<$Res>? get rate;
}

/// @nodoc
class __$$MetaComicImplCopyWithImpl<$Res>
    extends _$MetaComicCopyWithImpl<$Res, _$MetaComicImpl>
    implements _$$MetaComicImplCopyWith<$Res> {
  __$$MetaComicImplCopyWithImpl(
      _$MetaComicImpl _value, $Res Function(_$MetaComicImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$MetaComicImpl(
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
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      translator: freezed == translator
          ? _value.translator
          : translator // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as RateValue?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ComicChapter>,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fake: null == fake
          ? _value.fake
          : fake // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaComicImpl implements _MetaComic {
  const _$MetaComicImpl(
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
      this.fake = false})
      : _genres = genres,
        _chapters = chapters;

  factory _$MetaComicImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaComicImplFromJson(json);

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
  String toString() {
    return 'MetaComic(name: $name, originalName: $originalName, image: $image, author: $author, translator: $translator, status: $status, views: $views, likes: $likes, rate: $rate, genres: $genres, description: $description, chapters: $chapters, lastModified: $lastModified, fake: $fake)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaComicImpl &&
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
            (identical(other.fake, fake) || other.fake == fake));
  }

  @JsonKey(ignore: true)
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
      fake);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaComicImplCopyWith<_$MetaComicImpl> get copyWith =>
      __$$MetaComicImplCopyWithImpl<_$MetaComicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaComicImplToJson(
      this,
    );
  }
}

abstract class _MetaComic implements MetaComic {
  const factory _MetaComic(
      {required final String name,
      final String? originalName,
      required final OImage image,
      final String? author,
      final String? translator,
      required final StatusEnum status,
      final int? views,
      final int? likes,
      final RateValue? rate,
      required final List<Genre> genres,
      required final String description,
      required final List<ComicChapter> chapters,
      required final DateTime lastModified,
      final bool fake}) = _$MetaComicImpl;

  factory _MetaComic.fromJson(Map<String, dynamic> json) =
      _$MetaComicImpl.fromJson;

  @override
  String get name;
  @override
  String? get originalName;
  @override
  OImage get image;
  @override
  String? get author;
  @override
  String? get translator;
  @override
  StatusEnum get status;
  @override
  int? get views;
  @override
  int? get likes;
  @override
  RateValue? get rate;
  @override
  List<Genre> get genres;
  @override
  String get description;
  @override
  List<ComicChapter> get chapters;
  @override
  DateTime get lastModified;
  @override
  bool get fake;
  @override
  @JsonKey(ignore: true)
  _$$MetaComicImplCopyWith<_$MetaComicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
