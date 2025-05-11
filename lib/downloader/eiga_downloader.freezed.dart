// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_downloader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadedEiga implements DiagnosticableTreeMixin {

 MetaEiga get meta; List<LoadedEpisode> get episodes;
/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedEigaCopyWith<LoadedEiga> get copyWith => _$LoadedEigaCopyWithImpl<LoadedEiga>(this as LoadedEiga, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedEiga'))
    ..add(DiagnosticsProperty('meta', meta))..add(DiagnosticsProperty('episodes', episodes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedEiga&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}


@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(episodes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedEiga(meta: $meta, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $LoadedEigaCopyWith<$Res>  {
  factory $LoadedEigaCopyWith(LoadedEiga value, $Res Function(LoadedEiga) _then) = _$LoadedEigaCopyWithImpl;
@useResult
$Res call({
 MetaEiga meta, List<LoadedEpisode> episodes
});


$MetaEigaCopyWith<$Res> get meta;

}
/// @nodoc
class _$LoadedEigaCopyWithImpl<$Res>
    implements $LoadedEigaCopyWith<$Res> {
  _$LoadedEigaCopyWithImpl(this._self, this._then);

  final LoadedEiga _self;
  final $Res Function(LoadedEiga) _then;

/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = null,Object? episodes = null,}) {
  return _then(_self.copyWith(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaEiga,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<LoadedEpisode>,
  ));
}
/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get meta {
  
  return $MetaEigaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc


class _LoadedEiga with DiagnosticableTreeMixin implements LoadedEiga {
  const _LoadedEiga({required this.meta, required final  List<LoadedEpisode> episodes}): _episodes = episodes;
  

@override final  MetaEiga meta;
 final  List<LoadedEpisode> _episodes;
@override List<LoadedEpisode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}


/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedEigaCopyWith<_LoadedEiga> get copyWith => __$LoadedEigaCopyWithImpl<_LoadedEiga>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedEiga'))
    ..add(DiagnosticsProperty('meta', meta))..add(DiagnosticsProperty('episodes', episodes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedEiga&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}


@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_episodes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedEiga(meta: $meta, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$LoadedEigaCopyWith<$Res> implements $LoadedEigaCopyWith<$Res> {
  factory _$LoadedEigaCopyWith(_LoadedEiga value, $Res Function(_LoadedEiga) _then) = __$LoadedEigaCopyWithImpl;
@override @useResult
$Res call({
 MetaEiga meta, List<LoadedEpisode> episodes
});


@override $MetaEigaCopyWith<$Res> get meta;

}
/// @nodoc
class __$LoadedEigaCopyWithImpl<$Res>
    implements _$LoadedEigaCopyWith<$Res> {
  __$LoadedEigaCopyWithImpl(this._self, this._then);

  final _LoadedEiga _self;
  final $Res Function(_LoadedEiga) _then;

/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = null,Object? episodes = null,}) {
  return _then(_LoadedEiga(
meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaEiga,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<LoadedEpisode>,
  ));
}

/// Create a copy of LoadedEiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get meta {
  
  return $MetaEigaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc
mixin _$LoadedEpisode implements DiagnosticableTreeMixin {

 String get id; String get episodeId; int get pageCount; int get count; int get doneAt; List<LoadedPage> get pages; Ref<DownloaderEpisodeReturn>? get progress;
/// Create a copy of LoadedEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedEpisodeCopyWith<LoadedEpisode> get copyWith => _$LoadedEpisodeCopyWithImpl<LoadedEpisode>(this as LoadedEpisode, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedEpisode'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('episodeId', episodeId))..add(DiagnosticsProperty('pageCount', pageCount))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('doneAt', doneAt))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.count, count) || other.count == count)&&(identical(other.doneAt, doneAt) || other.doneAt == doneAt)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,id,episodeId,pageCount,count,doneAt,const DeepCollectionEquality().hash(pages),progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedEpisode(id: $id, episodeId: $episodeId, pageCount: $pageCount, count: $count, doneAt: $doneAt, pages: $pages, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $LoadedEpisodeCopyWith<$Res>  {
  factory $LoadedEpisodeCopyWith(LoadedEpisode value, $Res Function(LoadedEpisode) _then) = _$LoadedEpisodeCopyWithImpl;
@useResult
$Res call({
 String id, String episodeId, int pageCount, int count, int doneAt, List<LoadedPage> pages, Ref<DownloaderEpisodeReturn>? progress
});




}
/// @nodoc
class _$LoadedEpisodeCopyWithImpl<$Res>
    implements $LoadedEpisodeCopyWith<$Res> {
  _$LoadedEpisodeCopyWithImpl(this._self, this._then);

  final LoadedEpisode _self;
  final $Res Function(LoadedEpisode) _then;

/// Create a copy of LoadedEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? episodeId = null,Object? pageCount = null,Object? count = null,Object? doneAt = null,Object? pages = null,Object? progress = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,doneAt: null == doneAt ? _self.doneAt : doneAt // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<LoadedPage>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Ref<DownloaderEpisodeReturn>?,
  ));
}

}


/// @nodoc


class _LoadedEpisode with DiagnosticableTreeMixin implements LoadedEpisode {
  const _LoadedEpisode({required this.id, required this.episodeId, required this.pageCount, required this.count, required this.doneAt, required final  List<LoadedPage> pages, required this.progress}): _pages = pages;
  

@override final  String id;
@override final  String episodeId;
@override final  int pageCount;
@override final  int count;
@override final  int doneAt;
 final  List<LoadedPage> _pages;
@override List<LoadedPage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override final  Ref<DownloaderEpisodeReturn>? progress;

/// Create a copy of LoadedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedEpisodeCopyWith<_LoadedEpisode> get copyWith => __$LoadedEpisodeCopyWithImpl<_LoadedEpisode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedEpisode'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('episodeId', episodeId))..add(DiagnosticsProperty('pageCount', pageCount))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('doneAt', doneAt))..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedEpisode&&(identical(other.id, id) || other.id == id)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.count, count) || other.count == count)&&(identical(other.doneAt, doneAt) || other.doneAt == doneAt)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,id,episodeId,pageCount,count,doneAt,const DeepCollectionEquality().hash(_pages),progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedEpisode(id: $id, episodeId: $episodeId, pageCount: $pageCount, count: $count, doneAt: $doneAt, pages: $pages, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$LoadedEpisodeCopyWith<$Res> implements $LoadedEpisodeCopyWith<$Res> {
  factory _$LoadedEpisodeCopyWith(_LoadedEpisode value, $Res Function(_LoadedEpisode) _then) = __$LoadedEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String episodeId, int pageCount, int count, int doneAt, List<LoadedPage> pages, Ref<DownloaderEpisodeReturn>? progress
});




}
/// @nodoc
class __$LoadedEpisodeCopyWithImpl<$Res>
    implements _$LoadedEpisodeCopyWith<$Res> {
  __$LoadedEpisodeCopyWithImpl(this._self, this._then);

  final _LoadedEpisode _self;
  final $Res Function(_LoadedEpisode) _then;

/// Create a copy of LoadedEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? episodeId = null,Object? pageCount = null,Object? count = null,Object? doneAt = null,Object? pages = null,Object? progress = freezed,}) {
  return _then(_LoadedEpisode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,doneAt: null == doneAt ? _self.doneAt : doneAt // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<LoadedPage>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Ref<DownloaderEpisodeReturn>?,
  ));
}


}

/// @nodoc
mixin _$LoadedPage implements DiagnosticableTreeMixin {

 OImage get image; String get path; bool get downloaded;
/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedPageCopyWith<LoadedPage> get copyWith => _$LoadedPageCopyWithImpl<LoadedPage>(this as LoadedPage, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedPage'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('downloaded', downloaded));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedPage&&(identical(other.image, image) || other.image == image)&&(identical(other.path, path) || other.path == path)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded));
}


@override
int get hashCode => Object.hash(runtimeType,image,path,downloaded);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedPage(image: $image, path: $path, downloaded: $downloaded)';
}


}

/// @nodoc
abstract mixin class $LoadedPageCopyWith<$Res>  {
  factory $LoadedPageCopyWith(LoadedPage value, $Res Function(LoadedPage) _then) = _$LoadedPageCopyWithImpl;
@useResult
$Res call({
 OImage image, String path, bool downloaded
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
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? path = null,Object? downloaded = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,
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


/// @nodoc


class _LoadedPage with DiagnosticableTreeMixin implements LoadedPage {
  const _LoadedPage({required this.image, required this.path, required this.downloaded});
  

@override final  OImage image;
@override final  String path;
@override final  bool downloaded;

/// Create a copy of LoadedPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedPageCopyWith<_LoadedPage> get copyWith => __$LoadedPageCopyWithImpl<_LoadedPage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoadedPage'))
    ..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('downloaded', downloaded));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedPage&&(identical(other.image, image) || other.image == image)&&(identical(other.path, path) || other.path == path)&&(identical(other.downloaded, downloaded) || other.downloaded == downloaded));
}


@override
int get hashCode => Object.hash(runtimeType,image,path,downloaded);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoadedPage(image: $image, path: $path, downloaded: $downloaded)';
}


}

/// @nodoc
abstract mixin class _$LoadedPageCopyWith<$Res> implements $LoadedPageCopyWith<$Res> {
  factory _$LoadedPageCopyWith(_LoadedPage value, $Res Function(_LoadedPage) _then) = __$LoadedPageCopyWithImpl;
@override @useResult
$Res call({
 OImage image, String path, bool downloaded
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
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? path = null,Object? downloaded = null,}) {
  return _then(_LoadedPage(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,downloaded: null == downloaded ? _self.downloaded : downloaded // ignore: cast_nullable_to_non_nullable
as bool,
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
