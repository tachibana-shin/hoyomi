// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_downloader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadedComic implements DiagnosticableTreeMixin {

 MetaComic get meta; List<LoadedChapter> get chapters;
/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedComicCopyWith<LoadedComic> get copyWith => _$LoadedComicCopyWithImpl<LoadedComic>(this as LoadedComic, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedComic'))
    ..add(DiagnosticsProperty('meta', meta))..add(DiagnosticsProperty('chapters', chapters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedComic&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.chapters, chapters));
}


@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(chapters));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedComic(meta: $meta, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $LoadedComicCopyWith<$Res>  {
  factory $LoadedComicCopyWith(LoadedComic value, $Res Function(LoadedComic) _then) = _$LoadedComicCopyWithImpl;
@useResult
$Res call({
 MetaComic meta, List<LoadedChapter> chapters
});


$MetaComicCopyWith<$Res> get meta;

}
/// @nodoc
class _$LoadedComicCopyWithImpl<$Res>
    implements $LoadedComicCopyWith<$Res> {
  _$LoadedComicCopyWithImpl(this._self, this._then);

  final LoadedComic _self;
  final $Res Function(LoadedComic) _then;

/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = null,Object? chapters = null,}) {
  return _then(_self.copyWith(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaComic,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<LoadedChapter>,
  ));
}
/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaComicCopyWith<$Res> get meta {
  
  return $MetaComicCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoadedComic].
extension LoadedComicPatterns on LoadedComic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadedComic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadedComic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadedComic value)  $default,){
final _that = this;
switch (_that) {
case _LoadedComic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadedComic value)?  $default,){
final _that = this;
switch (_that) {
case _LoadedComic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaComic meta,  List<LoadedChapter> chapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadedComic() when $default != null:
return $default(_that.meta,_that.chapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaComic meta,  List<LoadedChapter> chapters)  $default,) {final _that = this;
switch (_that) {
case _LoadedComic():
return $default(_that.meta,_that.chapters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaComic meta,  List<LoadedChapter> chapters)?  $default,) {final _that = this;
switch (_that) {
case _LoadedComic() when $default != null:
return $default(_that.meta,_that.chapters);case _:
  return null;

}
}

}

/// @nodoc


class _LoadedComic with DiagnosticableTreeMixin implements LoadedComic {
  const _LoadedComic({required this.meta, required final  List<LoadedChapter> chapters}): _chapters = chapters;
  

@override final  MetaComic meta;
 final  List<LoadedChapter> _chapters;
@override List<LoadedChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}


/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedComicCopyWith<_LoadedComic> get copyWith => __$LoadedComicCopyWithImpl<_LoadedComic>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedComic'))
    ..add(DiagnosticsProperty('meta', meta))..add(DiagnosticsProperty('chapters', chapters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedComic&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}


@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_chapters));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedComic(meta: $meta, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class _$LoadedComicCopyWith<$Res> implements $LoadedComicCopyWith<$Res> {
  factory _$LoadedComicCopyWith(_LoadedComic value, $Res Function(_LoadedComic) _then) = __$LoadedComicCopyWithImpl;
@override @useResult
$Res call({
 MetaComic meta, List<LoadedChapter> chapters
});


@override $MetaComicCopyWith<$Res> get meta;

}
/// @nodoc
class __$LoadedComicCopyWithImpl<$Res>
    implements _$LoadedComicCopyWith<$Res> {
  __$LoadedComicCopyWithImpl(this._self, this._then);

  final _LoadedComic _self;
  final $Res Function(_LoadedComic) _then;

/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = null,Object? chapters = null,}) {
  return _then(_LoadedComic(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaComic,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<LoadedChapter>,
  ));
}

/// Create a copy of LoadedComic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaComicCopyWith<$Res> get meta {
  
  return $MetaComicCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc
mixin _$LoadedChapter implements DiagnosticableTreeMixin {

 String get id; String get chapterId; int get pageCount; int get count; int get doneAt; List<LoadedPage> get pages; Ref<DownloaderChapterReturn>? get progress;
/// Create a copy of LoadedChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedChapterCopyWith<LoadedChapter> get copyWith => _$LoadedChapterCopyWithImpl<LoadedChapter>(this as LoadedChapter, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedChapter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('chapterId', chapterId))..add(DiagnosticsProperty('pageCount', pageCount))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('doneAt', doneAt))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.count, count) || other.count == count)&&(identical(other.doneAt, doneAt) || other.doneAt == doneAt)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,id,chapterId,pageCount,count,doneAt,const DeepCollectionEquality().hash(pages),progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedChapter(id: $id, chapterId: $chapterId, pageCount: $pageCount, count: $count, doneAt: $doneAt, pages: $pages, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $LoadedChapterCopyWith<$Res>  {
  factory $LoadedChapterCopyWith(LoadedChapter value, $Res Function(LoadedChapter) _then) = _$LoadedChapterCopyWithImpl;
@useResult
$Res call({
 String id, String chapterId, int pageCount, int count, int doneAt, List<LoadedPage> pages, Ref<DownloaderChapterReturn>? progress
});




}
/// @nodoc
class _$LoadedChapterCopyWithImpl<$Res>
    implements $LoadedChapterCopyWith<$Res> {
  _$LoadedChapterCopyWithImpl(this._self, this._then);

  final LoadedChapter _self;
  final $Res Function(LoadedChapter) _then;

/// Create a copy of LoadedChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterId = null,Object? pageCount = null,Object? count = null,Object? doneAt = null,Object? pages = null,Object? progress = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,doneAt: null == doneAt ? _self.doneAt : doneAt // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<LoadedPage>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Ref<DownloaderChapterReturn>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoadedChapter].
extension LoadedChapterPatterns on LoadedChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadedChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadedChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadedChapter value)  $default,){
final _that = this;
switch (_that) {
case _LoadedChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadedChapter value)?  $default,){
final _that = this;
switch (_that) {
case _LoadedChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chapterId,  int pageCount,  int count,  int doneAt,  List<LoadedPage> pages,  Ref<DownloaderChapterReturn>? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadedChapter() when $default != null:
return $default(_that.id,_that.chapterId,_that.pageCount,_that.count,_that.doneAt,_that.pages,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chapterId,  int pageCount,  int count,  int doneAt,  List<LoadedPage> pages,  Ref<DownloaderChapterReturn>? progress)  $default,) {final _that = this;
switch (_that) {
case _LoadedChapter():
return $default(_that.id,_that.chapterId,_that.pageCount,_that.count,_that.doneAt,_that.pages,_that.progress);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chapterId,  int pageCount,  int count,  int doneAt,  List<LoadedPage> pages,  Ref<DownloaderChapterReturn>? progress)?  $default,) {final _that = this;
switch (_that) {
case _LoadedChapter() when $default != null:
return $default(_that.id,_that.chapterId,_that.pageCount,_that.count,_that.doneAt,_that.pages,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _LoadedChapter with DiagnosticableTreeMixin implements LoadedChapter {
  const _LoadedChapter({required this.id, required this.chapterId, required this.pageCount, required this.count, required this.doneAt, required final  List<LoadedPage> pages, required this.progress}): _pages = pages;
  

@override final  String id;
@override final  String chapterId;
@override final  int pageCount;
@override final  int count;
@override final  int doneAt;
 final  List<LoadedPage> _pages;
@override List<LoadedPage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override final  Ref<DownloaderChapterReturn>? progress;

/// Create a copy of LoadedChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedChapterCopyWith<_LoadedChapter> get copyWith => __$LoadedChapterCopyWithImpl<_LoadedChapter>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedChapter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('chapterId', chapterId))..add(DiagnosticsProperty('pageCount', pageCount))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('doneAt', doneAt))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.count, count) || other.count == count)&&(identical(other.doneAt, doneAt) || other.doneAt == doneAt)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,id,chapterId,pageCount,count,doneAt,const DeepCollectionEquality().hash(_pages),progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedChapter(id: $id, chapterId: $chapterId, pageCount: $pageCount, count: $count, doneAt: $doneAt, pages: $pages, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$LoadedChapterCopyWith<$Res> implements $LoadedChapterCopyWith<$Res> {
  factory _$LoadedChapterCopyWith(_LoadedChapter value, $Res Function(_LoadedChapter) _then) = __$LoadedChapterCopyWithImpl;
@override @useResult
$Res call({
 String id, String chapterId, int pageCount, int count, int doneAt, List<LoadedPage> pages, Ref<DownloaderChapterReturn>? progress
});




}
/// @nodoc
class __$LoadedChapterCopyWithImpl<$Res>
    implements _$LoadedChapterCopyWith<$Res> {
  __$LoadedChapterCopyWithImpl(this._self, this._then);

  final _LoadedChapter _self;
  final $Res Function(_LoadedChapter) _then;

/// Create a copy of LoadedChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterId = null,Object? pageCount = null,Object? count = null,Object? doneAt = null,Object? pages = null,Object? progress = freezed,}) {
  return _then(_LoadedChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,doneAt: null == doneAt ? _self.doneAt : doneAt // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<LoadedPage>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Ref<DownloaderChapterReturn>?,
  ));
}


}

/// @nodoc
mixin _$LoadedPage implements DiagnosticableTreeMixin {

 OImage get image; String get path; bool get downloaded; int get size;
/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedPageCopyWith<LoadedPage> get copyWith => _$LoadedPageCopyWithImpl<LoadedPage>(this as LoadedPage, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedPage'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('downloaded', downloaded))..add(DiagnosticsProperty('size', size));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedPage&&(identical(other.image, image) || other.image == image)&&(identical(other.path, path) || other.path == path)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,image,path,downloaded,size);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedPage(image: $image, path: $path, downloaded: $downloaded, size: $size)';
}


}

/// @nodoc
abstract mixin class $LoadedPageCopyWith<$Res>  {
  factory $LoadedPageCopyWith(LoadedPage value, $Res Function(LoadedPage) _then) = _$LoadedPageCopyWithImpl;
@useResult
$Res call({
 OImage image, String path, bool downloaded, int size
});


$OImageCopyWith<$Res> get image;

}
/// @nodoc
class _$LoadedPageCopyWithImpl<$Res>
    implements $LoadedPageCopyWith<$Res> {
  _$LoadedPageCopyWithImpl(this._self, this._then);

  final LoadedPage _self;
  final $Res Function(LoadedPage) _then;

/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? path = null,Object? downloaded = null,Object? size = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoadedPage].
extension LoadedPagePatterns on LoadedPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadedPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadedPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadedPage value)  $default,){
final _that = this;
switch (_that) {
case _LoadedPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadedPage value)?  $default,){
final _that = this;
switch (_that) {
case _LoadedPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OImage image,  String path,  bool downloaded,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadedPage() when $default != null:
return $default(_that.image,_that.path,_that.downloaded,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OImage image,  String path,  bool downloaded,  int size)  $default,) {final _that = this;
switch (_that) {
case _LoadedPage():
return $default(_that.image,_that.path,_that.downloaded,_that.size);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OImage image,  String path,  bool downloaded,  int size)?  $default,) {final _that = this;
switch (_that) {
case _LoadedPage() when $default != null:
return $default(_that.image,_that.path,_that.downloaded,_that.size);case _:
  return null;

}
}

}

/// @nodoc


class _LoadedPage with DiagnosticableTreeMixin implements LoadedPage {
  const _LoadedPage({required this.image, required this.path, required this.downloaded, required this.size});
  

@override final  OImage image;
@override final  String path;
@override final  bool downloaded;
@override final  int size;

/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedPageCopyWith<_LoadedPage> get copyWith => __$LoadedPageCopyWithImpl<_LoadedPage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedPage'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('downloaded', downloaded))..add(DiagnosticsProperty('size', size));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedPage&&(identical(other.image, image) || other.image == image)&&(identical(other.path, path) || other.path == path)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,image,path,downloaded,size);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedPage(image: $image, path: $path, downloaded: $downloaded, size: $size)';
}


}

/// @nodoc
abstract mixin class _$LoadedPageCopyWith<$Res> implements $LoadedPageCopyWith<$Res> {
  factory _$LoadedPageCopyWith(_LoadedPage value, $Res Function(_LoadedPage) _then) = __$LoadedPageCopyWithImpl;
@override @useResult
$Res call({
 OImage image, String path, bool downloaded, int size
});


@override $OImageCopyWith<$Res> get image;

}
/// @nodoc
class __$LoadedPageCopyWithImpl<$Res>
    implements _$LoadedPageCopyWith<$Res> {
  __$LoadedPageCopyWithImpl(this._self, this._then);

  final _LoadedPage _self;
  final $Res Function(_LoadedPage) _then;

/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? path = null,Object? downloaded = null,Object? size = null,}) {
  return _then(_LoadedPage(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of LoadedPage
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
