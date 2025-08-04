// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get name; String get comicId; String? get originalName; OImage get image; ComicChapter? get lastChap; DateTime? get lastUpdate; String? get notice; bool get pending; DateTime? get preRelease; double? get rate; String? get description;
/// Create a copy of Comic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCopyWith<Comic> get copyWith => _$ComicCopyWithImpl<Comic>(this as Comic, _$identity);

  /// Serializes this Comic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comic&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastChap, lastChap) || other.lastChap == lastChap)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comicId,originalName,image,lastChap,lastUpdate,notice,pending,preRelease,rate,description);

@override
String toString() {
  return 'Comic(name: $name, comicId: $comicId, originalName: $originalName, image: $image, lastChap: $lastChap, lastUpdate: $lastUpdate, notice: $notice, pending: $pending, preRelease: $preRelease, rate: $rate, description: $description)';
}


}

/// @nodoc
abstract mixin class $ComicCopyWith<$Res>  {
  factory $ComicCopyWith(Comic value, $Res Function(Comic) _then) = _$ComicCopyWithImpl;
@useResult
$Res call({
 String name, String comicId, String? originalName, OImage image, ComicChapter? lastChap, DateTime? lastUpdate, String? notice, bool pending, DateTime? preRelease, double? rate, String? description
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? comicId = null,Object? originalName = freezed,Object? image = null,Object? lastChap = freezed,Object? lastUpdate = freezed,Object? notice = freezed,Object? pending = null,Object? preRelease = freezed,Object? rate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastChap: freezed == lastChap ? _self.lastChap : lastChap // ignore: cast_nullable_to_non_nullable
as ComicChapter?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [Comic].
extension ComicPatterns on Comic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comic value)  $default,){
final _that = this;
switch (_that) {
case _Comic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comic value)?  $default,){
final _that = this;
switch (_that) {
case _Comic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String comicId,  String? originalName,  OImage image,  ComicChapter? lastChap,  DateTime? lastUpdate,  String? notice,  bool pending,  DateTime? preRelease,  double? rate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comic() when $default != null:
return $default(_that.name,_that.comicId,_that.originalName,_that.image,_that.lastChap,_that.lastUpdate,_that.notice,_that.pending,_that.preRelease,_that.rate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String comicId,  String? originalName,  OImage image,  ComicChapter? lastChap,  DateTime? lastUpdate,  String? notice,  bool pending,  DateTime? preRelease,  double? rate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Comic():
return $default(_that.name,_that.comicId,_that.originalName,_that.image,_that.lastChap,_that.lastUpdate,_that.notice,_that.pending,_that.preRelease,_that.rate,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String comicId,  String? originalName,  OImage image,  ComicChapter? lastChap,  DateTime? lastUpdate,  String? notice,  bool pending,  DateTime? preRelease,  double? rate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Comic() when $default != null:
return $default(_that.name,_that.comicId,_that.originalName,_that.image,_that.lastChap,_that.lastUpdate,_that.notice,_that.pending,_that.preRelease,_that.rate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Comic implements Comic {
  const _Comic({required this.name, required this.comicId, this.originalName, required this.image, this.lastChap, this.lastUpdate, this.notice, this.pending = false, this.preRelease, this.rate, this.description});
  factory _Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

@override final  String name;
@override final  String comicId;
@override final  String? originalName;
@override final  OImage image;
@override final  ComicChapter? lastChap;
@override final  DateTime? lastUpdate;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comic&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastChap, lastChap) || other.lastChap == lastChap)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,comicId,originalName,image,lastChap,lastUpdate,notice,pending,preRelease,rate,description);

@override
String toString() {
  return 'Comic(name: $name, comicId: $comicId, originalName: $originalName, image: $image, lastChap: $lastChap, lastUpdate: $lastUpdate, notice: $notice, pending: $pending, preRelease: $preRelease, rate: $rate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ComicCopyWith<$Res> implements $ComicCopyWith<$Res> {
  factory _$ComicCopyWith(_Comic value, $Res Function(_Comic) _then) = __$ComicCopyWithImpl;
@override @useResult
$Res call({
 String name, String comicId, String? originalName, OImage image, ComicChapter? lastChap, DateTime? lastUpdate, String? notice, bool pending, DateTime? preRelease, double? rate, String? description
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? comicId = null,Object? originalName = freezed,Object? image = null,Object? lastChap = freezed,Object? lastUpdate = freezed,Object? notice = freezed,Object? pending = null,Object? preRelease = freezed,Object? rate = freezed,Object? description = freezed,}) {
  return _then(_Comic(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastChap: freezed == lastChap ? _self.lastChap : lastChap // ignore: cast_nullable_to_non_nullable
as ComicChapter?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
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
