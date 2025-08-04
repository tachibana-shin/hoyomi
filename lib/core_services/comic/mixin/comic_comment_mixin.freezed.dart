// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_comment_mixin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicCommentContext {

 String get comicId; MetaComic get metaComic; String? get chapterId; ComicChapter? get chapter; ComicComment? get parent;
/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCommentContextCopyWith<ComicCommentContext> get copyWith => _$ComicCommentContextCopyWithImpl<ComicCommentContext>(this as ComicCommentContext, _$identity);

  /// Serializes this ComicCommentContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicCommentContext&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.metaComic, metaComic) || other.metaComic == metaComic)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.parent, parent) || other.parent == parent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,metaComic,chapterId,chapter,parent);

@override
String toString() {
  return 'ComicCommentContext(comicId: $comicId, metaComic: $metaComic, chapterId: $chapterId, chapter: $chapter, parent: $parent)';
}


}

/// @nodoc
abstract mixin class $ComicCommentContextCopyWith<$Res>  {
  factory $ComicCommentContextCopyWith(ComicCommentContext value, $Res Function(ComicCommentContext) _then) = _$ComicCommentContextCopyWithImpl;
@useResult
$Res call({
 String comicId, MetaComic metaComic, String? chapterId, ComicChapter? chapter, ComicComment? parent
});


$MetaComicCopyWith<$Res> get metaComic;$ComicChapterCopyWith<$Res>? get chapter;$ComicCommentCopyWith<$Res>? get parent;

}
/// @nodoc
class _$ComicCommentContextCopyWithImpl<$Res>
    implements $ComicCommentContextCopyWith<$Res> {
  _$ComicCommentContextCopyWithImpl(this._self, this._then);

  final ComicCommentContext _self;
  final $Res Function(ComicCommentContext) _then;

/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comicId = null,Object? metaComic = null,Object? chapterId = freezed,Object? chapter = freezed,Object? parent = freezed,}) {
  return _then(_self.copyWith(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,metaComic: null == metaComic ? _self.metaComic : metaComic // ignore: cast_nullable_to_non_nullable
as MetaComic,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,chapter: freezed == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as ComicChapter?,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ComicComment?,
  ));
}
/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaComicCopyWith<$Res> get metaComic {
  
  return $MetaComicCopyWith<$Res>(_self.metaComic, (value) {
    return _then(_self.copyWith(metaComic: value));
  });
}/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get chapter {
    if (_self.chapter == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.chapter!, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCommentCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $ComicCommentCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicCommentContext].
extension ComicCommentContextPatterns on ComicCommentContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicCommentContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicCommentContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicCommentContext value)  $default,){
final _that = this;
switch (_that) {
case _ComicCommentContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicCommentContext value)?  $default,){
final _that = this;
switch (_that) {
case _ComicCommentContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String comicId,  MetaComic metaComic,  String? chapterId,  ComicChapter? chapter,  ComicComment? parent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicCommentContext() when $default != null:
return $default(_that.comicId,_that.metaComic,_that.chapterId,_that.chapter,_that.parent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String comicId,  MetaComic metaComic,  String? chapterId,  ComicChapter? chapter,  ComicComment? parent)  $default,) {final _that = this;
switch (_that) {
case _ComicCommentContext():
return $default(_that.comicId,_that.metaComic,_that.chapterId,_that.chapter,_that.parent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String comicId,  MetaComic metaComic,  String? chapterId,  ComicChapter? chapter,  ComicComment? parent)?  $default,) {final _that = this;
switch (_that) {
case _ComicCommentContext() when $default != null:
return $default(_that.comicId,_that.metaComic,_that.chapterId,_that.chapter,_that.parent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicCommentContext implements ComicCommentContext {
  const _ComicCommentContext({required this.comicId, required this.metaComic, this.chapterId, this.chapter, this.parent});
  factory _ComicCommentContext.fromJson(Map<String, dynamic> json) => _$ComicCommentContextFromJson(json);

@override final  String comicId;
@override final  MetaComic metaComic;
@override final  String? chapterId;
@override final  ComicChapter? chapter;
@override final  ComicComment? parent;

/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCommentContextCopyWith<_ComicCommentContext> get copyWith => __$ComicCommentContextCopyWithImpl<_ComicCommentContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicCommentContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicCommentContext&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.metaComic, metaComic) || other.metaComic == metaComic)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.parent, parent) || other.parent == parent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comicId,metaComic,chapterId,chapter,parent);

@override
String toString() {
  return 'ComicCommentContext(comicId: $comicId, metaComic: $metaComic, chapterId: $chapterId, chapter: $chapter, parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$ComicCommentContextCopyWith<$Res> implements $ComicCommentContextCopyWith<$Res> {
  factory _$ComicCommentContextCopyWith(_ComicCommentContext value, $Res Function(_ComicCommentContext) _then) = __$ComicCommentContextCopyWithImpl;
@override @useResult
$Res call({
 String comicId, MetaComic metaComic, String? chapterId, ComicChapter? chapter, ComicComment? parent
});


@override $MetaComicCopyWith<$Res> get metaComic;@override $ComicChapterCopyWith<$Res>? get chapter;@override $ComicCommentCopyWith<$Res>? get parent;

}
/// @nodoc
class __$ComicCommentContextCopyWithImpl<$Res>
    implements _$ComicCommentContextCopyWith<$Res> {
  __$ComicCommentContextCopyWithImpl(this._self, this._then);

  final _ComicCommentContext _self;
  final $Res Function(_ComicCommentContext) _then;

/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comicId = null,Object? metaComic = null,Object? chapterId = freezed,Object? chapter = freezed,Object? parent = freezed,}) {
  return _then(_ComicCommentContext(
comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,metaComic: null == metaComic ? _self.metaComic : metaComic // ignore: cast_nullable_to_non_nullable
as MetaComic,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,chapter: freezed == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as ComicChapter?,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as ComicComment?,
  ));
}

/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaComicCopyWith<$Res> get metaComic {
  
  return $MetaComicCopyWith<$Res>(_self.metaComic, (value) {
    return _then(_self.copyWith(metaComic: value));
  });
}/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get chapter {
    if (_self.chapter == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.chapter!, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}/// Create a copy of ComicCommentContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCommentCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $ComicCommentCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}

// dart format on
