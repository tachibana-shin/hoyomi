// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralSettings {

 bool get mangaReadLazyPage; DateTime? get lastCheckUpdateApp; double? get brightnessApp; int get pollingIntervalComic; bool get showListEpisodeWithGrid; List<String>? get sortComicService; List<String>? get sortEigaService; List<String>? get sortLibraryService; String? get lastTabActiveApp; List<String> get newsKeywordComic; List<String> get newsKeywordEiga;
/// Create a copy of GeneralSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralSettingsCopyWith<GeneralSettings> get copyWith => _$GeneralSettingsCopyWithImpl<GeneralSettings>(this as GeneralSettings, _$identity);

  /// Serializes this GeneralSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralSettings&&(identical(other.mangaReadLazyPage, mangaReadLazyPage) || other.mangaReadLazyPage == mangaReadLazyPage)&&(identical(other.lastCheckUpdateApp, lastCheckUpdateApp) || other.lastCheckUpdateApp == lastCheckUpdateApp)&&(identical(other.brightnessApp, brightnessApp) || other.brightnessApp == brightnessApp)&&(identical(other.pollingIntervalComic, pollingIntervalComic) || other.pollingIntervalComic == pollingIntervalComic)&&(identical(other.showListEpisodeWithGrid, showListEpisodeWithGrid) || other.showListEpisodeWithGrid == showListEpisodeWithGrid)&&const DeepCollectionEquality().equals(other.sortComicService, sortComicService)&&const DeepCollectionEquality().equals(other.sortEigaService, sortEigaService)&&const DeepCollectionEquality().equals(other.sortLibraryService, sortLibraryService)&&(identical(other.lastTabActiveApp, lastTabActiveApp) || other.lastTabActiveApp == lastTabActiveApp)&&const DeepCollectionEquality().equals(other.newsKeywordComic, newsKeywordComic)&&const DeepCollectionEquality().equals(other.newsKeywordEiga, newsKeywordEiga));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mangaReadLazyPage,lastCheckUpdateApp,brightnessApp,pollingIntervalComic,showListEpisodeWithGrid,const DeepCollectionEquality().hash(sortComicService),const DeepCollectionEquality().hash(sortEigaService),const DeepCollectionEquality().hash(sortLibraryService),lastTabActiveApp,const DeepCollectionEquality().hash(newsKeywordComic),const DeepCollectionEquality().hash(newsKeywordEiga));

@override
String toString() {
  return 'GeneralSettings(mangaReadLazyPage: $mangaReadLazyPage, lastCheckUpdateApp: $lastCheckUpdateApp, brightnessApp: $brightnessApp, pollingIntervalComic: $pollingIntervalComic, showListEpisodeWithGrid: $showListEpisodeWithGrid, sortComicService: $sortComicService, sortEigaService: $sortEigaService, sortLibraryService: $sortLibraryService, lastTabActiveApp: $lastTabActiveApp, newsKeywordComic: $newsKeywordComic, newsKeywordEiga: $newsKeywordEiga)';
}


}

/// @nodoc
abstract mixin class $GeneralSettingsCopyWith<$Res>  {
  factory $GeneralSettingsCopyWith(GeneralSettings value, $Res Function(GeneralSettings) _then) = _$GeneralSettingsCopyWithImpl;
@useResult
$Res call({
 bool mangaReadLazyPage, DateTime? lastCheckUpdateApp, double? brightnessApp, int pollingIntervalComic, bool showListEpisodeWithGrid, List<String>? sortComicService, List<String>? sortEigaService, List<String>? sortLibraryService, String? lastTabActiveApp, List<String> newsKeywordComic, List<String> newsKeywordEiga
});




}
/// @nodoc
class _$GeneralSettingsCopyWithImpl<$Res>
    implements $GeneralSettingsCopyWith<$Res> {
  _$GeneralSettingsCopyWithImpl(this._self, this._then);

  final GeneralSettings _self;
  final $Res Function(GeneralSettings) _then;

/// Create a copy of GeneralSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mangaReadLazyPage = null,Object? lastCheckUpdateApp = freezed,Object? brightnessApp = freezed,Object? pollingIntervalComic = null,Object? showListEpisodeWithGrid = null,Object? sortComicService = freezed,Object? sortEigaService = freezed,Object? sortLibraryService = freezed,Object? lastTabActiveApp = freezed,Object? newsKeywordComic = null,Object? newsKeywordEiga = null,}) {
  return _then(_self.copyWith(
mangaReadLazyPage: null == mangaReadLazyPage ? _self.mangaReadLazyPage : mangaReadLazyPage // ignore: cast_nullable_to_non_nullable
as bool,lastCheckUpdateApp: freezed == lastCheckUpdateApp ? _self.lastCheckUpdateApp : lastCheckUpdateApp // ignore: cast_nullable_to_non_nullable
as DateTime?,brightnessApp: freezed == brightnessApp ? _self.brightnessApp : brightnessApp // ignore: cast_nullable_to_non_nullable
as double?,pollingIntervalComic: null == pollingIntervalComic ? _self.pollingIntervalComic : pollingIntervalComic // ignore: cast_nullable_to_non_nullable
as int,showListEpisodeWithGrid: null == showListEpisodeWithGrid ? _self.showListEpisodeWithGrid : showListEpisodeWithGrid // ignore: cast_nullable_to_non_nullable
as bool,sortComicService: freezed == sortComicService ? _self.sortComicService : sortComicService // ignore: cast_nullable_to_non_nullable
as List<String>?,sortEigaService: freezed == sortEigaService ? _self.sortEigaService : sortEigaService // ignore: cast_nullable_to_non_nullable
as List<String>?,sortLibraryService: freezed == sortLibraryService ? _self.sortLibraryService : sortLibraryService // ignore: cast_nullable_to_non_nullable
as List<String>?,lastTabActiveApp: freezed == lastTabActiveApp ? _self.lastTabActiveApp : lastTabActiveApp // ignore: cast_nullable_to_non_nullable
as String?,newsKeywordComic: null == newsKeywordComic ? _self.newsKeywordComic : newsKeywordComic // ignore: cast_nullable_to_non_nullable
as List<String>,newsKeywordEiga: null == newsKeywordEiga ? _self.newsKeywordEiga : newsKeywordEiga // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeneralSettings implements GeneralSettings {
  const _GeneralSettings({this.mangaReadLazyPage = false, this.lastCheckUpdateApp = null, this.brightnessApp = null, this.pollingIntervalComic = 60 * 60 * 3, this.showListEpisodeWithGrid = false, final  List<String>? sortComicService = null, final  List<String>? sortEigaService = null, final  List<String>? sortLibraryService = null, this.lastTabActiveApp = null, final  List<String> newsKeywordComic = const ['manga'], final  List<String> newsKeywordEiga = const ['anime']}): _sortComicService = sortComicService,_sortEigaService = sortEigaService,_sortLibraryService = sortLibraryService,_newsKeywordComic = newsKeywordComic,_newsKeywordEiga = newsKeywordEiga;
  factory _GeneralSettings.fromJson(Map<String, dynamic> json) => _$GeneralSettingsFromJson(json);

@override@JsonKey() final  bool mangaReadLazyPage;
@override@JsonKey() final  DateTime? lastCheckUpdateApp;
@override@JsonKey() final  double? brightnessApp;
@override@JsonKey() final  int pollingIntervalComic;
@override@JsonKey() final  bool showListEpisodeWithGrid;
 final  List<String>? _sortComicService;
@override@JsonKey() List<String>? get sortComicService {
  final value = _sortComicService;
  if (value == null) return null;
  if (_sortComicService is EqualUnmodifiableListView) return _sortComicService;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _sortEigaService;
@override@JsonKey() List<String>? get sortEigaService {
  final value = _sortEigaService;
  if (value == null) return null;
  if (_sortEigaService is EqualUnmodifiableListView) return _sortEigaService;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _sortLibraryService;
@override@JsonKey() List<String>? get sortLibraryService {
  final value = _sortLibraryService;
  if (value == null) return null;
  if (_sortLibraryService is EqualUnmodifiableListView) return _sortLibraryService;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String? lastTabActiveApp;
 final  List<String> _newsKeywordComic;
@override@JsonKey() List<String> get newsKeywordComic {
  if (_newsKeywordComic is EqualUnmodifiableListView) return _newsKeywordComic;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newsKeywordComic);
}

 final  List<String> _newsKeywordEiga;
@override@JsonKey() List<String> get newsKeywordEiga {
  if (_newsKeywordEiga is EqualUnmodifiableListView) return _newsKeywordEiga;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newsKeywordEiga);
}


/// Create a copy of GeneralSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralSettingsCopyWith<_GeneralSettings> get copyWith => __$GeneralSettingsCopyWithImpl<_GeneralSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneralSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralSettings&&(identical(other.mangaReadLazyPage, mangaReadLazyPage) || other.mangaReadLazyPage == mangaReadLazyPage)&&(identical(other.lastCheckUpdateApp, lastCheckUpdateApp) || other.lastCheckUpdateApp == lastCheckUpdateApp)&&(identical(other.brightnessApp, brightnessApp) || other.brightnessApp == brightnessApp)&&(identical(other.pollingIntervalComic, pollingIntervalComic) || other.pollingIntervalComic == pollingIntervalComic)&&(identical(other.showListEpisodeWithGrid, showListEpisodeWithGrid) || other.showListEpisodeWithGrid == showListEpisodeWithGrid)&&const DeepCollectionEquality().equals(other._sortComicService, _sortComicService)&&const DeepCollectionEquality().equals(other._sortEigaService, _sortEigaService)&&const DeepCollectionEquality().equals(other._sortLibraryService, _sortLibraryService)&&(identical(other.lastTabActiveApp, lastTabActiveApp) || other.lastTabActiveApp == lastTabActiveApp)&&const DeepCollectionEquality().equals(other._newsKeywordComic, _newsKeywordComic)&&const DeepCollectionEquality().equals(other._newsKeywordEiga, _newsKeywordEiga));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mangaReadLazyPage,lastCheckUpdateApp,brightnessApp,pollingIntervalComic,showListEpisodeWithGrid,const DeepCollectionEquality().hash(_sortComicService),const DeepCollectionEquality().hash(_sortEigaService),const DeepCollectionEquality().hash(_sortLibraryService),lastTabActiveApp,const DeepCollectionEquality().hash(_newsKeywordComic),const DeepCollectionEquality().hash(_newsKeywordEiga));

@override
String toString() {
  return 'GeneralSettings(mangaReadLazyPage: $mangaReadLazyPage, lastCheckUpdateApp: $lastCheckUpdateApp, brightnessApp: $brightnessApp, pollingIntervalComic: $pollingIntervalComic, showListEpisodeWithGrid: $showListEpisodeWithGrid, sortComicService: $sortComicService, sortEigaService: $sortEigaService, sortLibraryService: $sortLibraryService, lastTabActiveApp: $lastTabActiveApp, newsKeywordComic: $newsKeywordComic, newsKeywordEiga: $newsKeywordEiga)';
}


}

/// @nodoc
abstract mixin class _$GeneralSettingsCopyWith<$Res> implements $GeneralSettingsCopyWith<$Res> {
  factory _$GeneralSettingsCopyWith(_GeneralSettings value, $Res Function(_GeneralSettings) _then) = __$GeneralSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool mangaReadLazyPage, DateTime? lastCheckUpdateApp, double? brightnessApp, int pollingIntervalComic, bool showListEpisodeWithGrid, List<String>? sortComicService, List<String>? sortEigaService, List<String>? sortLibraryService, String? lastTabActiveApp, List<String> newsKeywordComic, List<String> newsKeywordEiga
});




}
/// @nodoc
class __$GeneralSettingsCopyWithImpl<$Res>
    implements _$GeneralSettingsCopyWith<$Res> {
  __$GeneralSettingsCopyWithImpl(this._self, this._then);

  final _GeneralSettings _self;
  final $Res Function(_GeneralSettings) _then;

/// Create a copy of GeneralSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mangaReadLazyPage = null,Object? lastCheckUpdateApp = freezed,Object? brightnessApp = freezed,Object? pollingIntervalComic = null,Object? showListEpisodeWithGrid = null,Object? sortComicService = freezed,Object? sortEigaService = freezed,Object? sortLibraryService = freezed,Object? lastTabActiveApp = freezed,Object? newsKeywordComic = null,Object? newsKeywordEiga = null,}) {
  return _then(_GeneralSettings(
mangaReadLazyPage: null == mangaReadLazyPage ? _self.mangaReadLazyPage : mangaReadLazyPage // ignore: cast_nullable_to_non_nullable
as bool,lastCheckUpdateApp: freezed == lastCheckUpdateApp ? _self.lastCheckUpdateApp : lastCheckUpdateApp // ignore: cast_nullable_to_non_nullable
as DateTime?,brightnessApp: freezed == brightnessApp ? _self.brightnessApp : brightnessApp // ignore: cast_nullable_to_non_nullable
as double?,pollingIntervalComic: null == pollingIntervalComic ? _self.pollingIntervalComic : pollingIntervalComic // ignore: cast_nullable_to_non_nullable
as int,showListEpisodeWithGrid: null == showListEpisodeWithGrid ? _self.showListEpisodeWithGrid : showListEpisodeWithGrid // ignore: cast_nullable_to_non_nullable
as bool,sortComicService: freezed == sortComicService ? _self._sortComicService : sortComicService // ignore: cast_nullable_to_non_nullable
as List<String>?,sortEigaService: freezed == sortEigaService ? _self._sortEigaService : sortEigaService // ignore: cast_nullable_to_non_nullable
as List<String>?,sortLibraryService: freezed == sortLibraryService ? _self._sortLibraryService : sortLibraryService // ignore: cast_nullable_to_non_nullable
as List<String>?,lastTabActiveApp: freezed == lastTabActiveApp ? _self.lastTabActiveApp : lastTabActiveApp // ignore: cast_nullable_to_non_nullable
as String?,newsKeywordComic: null == newsKeywordComic ? _self._newsKeywordComic : newsKeywordComic // ignore: cast_nullable_to_non_nullable
as List<String>,newsKeywordEiga: null == newsKeywordEiga ? _self._newsKeywordEiga : newsKeywordEiga // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
