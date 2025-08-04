// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicFollow {

 String get sourceId; Comic get item; DateTime? get updatedAt; ComicChapter? get lastChapter;
/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicFollowCopyWith<ComicFollow> get copyWith => _$ComicFollowCopyWithImpl<ComicFollow>(this as ComicFollow, _$identity);

  /// Serializes this ComicFollow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicFollow&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,updatedAt,lastChapter);

@override
String toString() {
  return 'ComicFollow(sourceId: $sourceId, item: $item, updatedAt: $updatedAt, lastChapter: $lastChapter)';
}


}

/// @nodoc
abstract mixin class $ComicFollowCopyWith<$Res>  {
  factory $ComicFollowCopyWith(ComicFollow value, $Res Function(ComicFollow) _then) = _$ComicFollowCopyWithImpl;
@useResult
$Res call({
 String sourceId, Comic item, DateTime? updatedAt, ComicChapter? lastChapter
});


$ComicCopyWith<$Res> get item;$ComicChapterCopyWith<$Res>? get lastChapter;

}
/// @nodoc
class _$ComicFollowCopyWithImpl<$Res>
    implements $ComicFollowCopyWith<$Res> {
  _$ComicFollowCopyWithImpl(this._self, this._then);

  final ComicFollow _self;
  final $Res Function(ComicFollow) _then;

/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? item = null,Object? updatedAt = freezed,Object? lastChapter = freezed,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Comic,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as ComicChapter?,
  ));
}
/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCopyWith<$Res> get item {
  
  return $ComicCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get lastChapter {
    if (_self.lastChapter == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.lastChapter!, (value) {
    return _then(_self.copyWith(lastChapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicFollow].
extension ComicFollowPatterns on ComicFollow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicFollow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicFollow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicFollow value)  $default,){
final _that = this;
switch (_that) {
case _ComicFollow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicFollow value)?  $default,){
final _that = this;
switch (_that) {
case _ComicFollow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sourceId,  Comic item,  DateTime? updatedAt,  ComicChapter? lastChapter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicFollow() when $default != null:
return $default(_that.sourceId,_that.item,_that.updatedAt,_that.lastChapter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sourceId,  Comic item,  DateTime? updatedAt,  ComicChapter? lastChapter)  $default,) {final _that = this;
switch (_that) {
case _ComicFollow():
return $default(_that.sourceId,_that.item,_that.updatedAt,_that.lastChapter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sourceId,  Comic item,  DateTime? updatedAt,  ComicChapter? lastChapter)?  $default,) {final _that = this;
switch (_that) {
case _ComicFollow() when $default != null:
return $default(_that.sourceId,_that.item,_that.updatedAt,_that.lastChapter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicFollow implements ComicFollow {
  const _ComicFollow({required this.sourceId, required this.item, this.updatedAt, this.lastChapter});
  factory _ComicFollow.fromJson(Map<String, dynamic> json) => _$ComicFollowFromJson(json);

@override final  String sourceId;
@override final  Comic item;
@override final  DateTime? updatedAt;
@override final  ComicChapter? lastChapter;

/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicFollowCopyWith<_ComicFollow> get copyWith => __$ComicFollowCopyWithImpl<_ComicFollow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicFollowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicFollow&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.item, item) || other.item == item)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,item,updatedAt,lastChapter);

@override
String toString() {
  return 'ComicFollow(sourceId: $sourceId, item: $item, updatedAt: $updatedAt, lastChapter: $lastChapter)';
}


}

/// @nodoc
abstract mixin class _$ComicFollowCopyWith<$Res> implements $ComicFollowCopyWith<$Res> {
  factory _$ComicFollowCopyWith(_ComicFollow value, $Res Function(_ComicFollow) _then) = __$ComicFollowCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, Comic item, DateTime? updatedAt, ComicChapter? lastChapter
});


@override $ComicCopyWith<$Res> get item;@override $ComicChapterCopyWith<$Res>? get lastChapter;

}
/// @nodoc
class __$ComicFollowCopyWithImpl<$Res>
    implements _$ComicFollowCopyWith<$Res> {
  __$ComicFollowCopyWithImpl(this._self, this._then);

  final _ComicFollow _self;
  final $Res Function(_ComicFollow) _then;

/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? item = null,Object? updatedAt = freezed,Object? lastChapter = freezed,}) {
  return _then(_ComicFollow(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Comic,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as ComicChapter?,
  ));
}

/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCopyWith<$Res> get item {
  
  return $ComicCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ComicFollow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<$Res>? get lastChapter {
    if (_self.lastChapter == null) {
    return null;
  }

  return $ComicChapterCopyWith<$Res>(_self.lastChapter!, (value) {
    return _then(_self.copyWith(lastChapter: value));
  });
}
}

// dart format on
