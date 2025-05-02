// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Comic {

 String get name; String get comicId; String? get originalName; OImage get image; ComicChapter? get lastChap; DateTime? get timeAgo; String? get notice; bool get pending; DateTime? get preRelease; double? get rate; String? get description;
/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCopyWith<Comic> get copyWith => _$ComicCopyWithImpl<Comic>(this as Comic, _$identity);

  /// Serializes this Comic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comic&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastChap, lastChap) || other.lastChap == lastChap)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comicId,originalName,image,lastChap,timeAgo,notice,pending,preRelease,rate,description);

@override
String toString() {
  return 'Comic(name: $name, comicId: $comicId, originalName: $originalName, image: $image, lastChap: $lastChap, timeAgo: $timeAgo, notice: $notice, pending: $pending, preRelease: $preRelease, rate: $rate, description: $description)';
}


}

/// @nodoc
abstract mixin class $ComicCopyWith<$Res>  {
  factory $ComicCopyWith(Comic value, $Res Function(Comic) _then) = _$ComicCopyWithImpl;
@useResult
$Res call({
 String name, String comicId, String? originalName, OImage image, ComicChapter? lastChap, DateTime? timeAgo, String? notice, bool pending, DateTime? preRelease, double? rate, String? description
});


$OImageCopyWith<$Res> get image;$ComicChapterCopyWith<$Res>? get lastChap;

}
/// @nodoc
class _$ComicCopyWithImpl<$Res>
    implements $ComicCopyWith<$Res> {
  _$ComicCopyWithImpl(this._self, this._then);

  final Comic _self;
  final $Res Function(Comic) _then;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? comicId = null,Object? originalName = freezed,Object? image = null,Object? lastChap = freezed,Object? timeAgo = freezed,Object? notice = freezed,Object? pending = null,Object? preRelease = freezed,Object? rate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastChap: freezed == lastChap ? _self.lastChap : lastChap // ignore: cast_nullable_to_non_nullable
as ComicChapter?,timeAgo: freezed == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as DateTime?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as bool,preRelease: freezed == preRelease ? _self.preRelease : preRelease // ignore: cast_nullable_to_non_nullable
as DateTime?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get lastChap {
    if (_self.lastChap == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.lastChap!, (value) {
    return _then(_self.copyWith(lastChap: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Comic implements Comic {
  const _Comic({required this.name, required this.comicId, this.originalName, required this.image, this.lastChap, this.timeAgo, this.notice, this.pending = false, this.preRelease, this.rate, this.description});
  factory _Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

@override final  String name;
@override final  String comicId;
@override final  String? originalName;
@override final  OImage image;
@override final  ComicChapter? lastChap;
@override final  DateTime? timeAgo;
@override final  String? notice;
@override@JsonKey() final  bool pending;
@override final  DateTime? preRelease;
@override final  double? rate;
@override final  String? description;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCopyWith<_Comic> get copyWith => __$ComicCopyWithImpl<_Comic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comic&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastChap, lastChap) || other.lastChap == lastChap)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comicId,originalName,image,lastChap,timeAgo,notice,pending,preRelease,rate,description);

@override
String toString() {
  return 'Comic(name: $name, comicId: $comicId, originalName: $originalName, image: $image, lastChap: $lastChap, timeAgo: $timeAgo, notice: $notice, pending: $pending, preRelease: $preRelease, rate: $rate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ComicCopyWith<$Res> implements $ComicCopyWith<$Res> {
  factory _$ComicCopyWith(_Comic value, $Res Function(_Comic) _then) = __$ComicCopyWithImpl;
@override @useResult
$Res call({
 String name, String comicId, String? originalName, OImage image, ComicChapter? lastChap, DateTime? timeAgo, String? notice, bool pending, DateTime? preRelease, double? rate, String? description
});


@override $OImageCopyWith<$Res> get image;@override $ComicChapterCopyWith<$Res>? get lastChap;

}
/// @nodoc
class __$ComicCopyWithImpl<$Res>
    implements _$ComicCopyWith<$Res> {
  __$ComicCopyWithImpl(this._self, this._then);

  final _Comic _self;
  final $Res Function(_Comic) _then;

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? comicId = null,Object? originalName = freezed,Object? image = null,Object? lastChap = freezed,Object? timeAgo = freezed,Object? notice = freezed,Object? pending = null,Object? preRelease = freezed,Object? rate = freezed,Object? description = freezed,}) {
  return _then(_Comic(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastChap: freezed == lastChap ? _self.lastChap : lastChap // ignore: cast_nullable_to_non_nullable
as ComicChapter?,timeAgo: freezed == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as DateTime?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as bool,preRelease: freezed == preRelease ? _self.preRelease : preRelease // ignore: cast_nullable_to_non_nullable
as DateTime?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get lastChap {
    if (_self.lastChap == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.lastChap!, (value) {
    return _then(_self.copyWith(lastChap: value));
  });
}
}

// dart format on
