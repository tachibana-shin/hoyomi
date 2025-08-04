// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicComment {

 String get id; String? get chapterId; String get userId; String get name; OImage? get photoUrl; String get content; DateTime get timeAgo; int? get countLike; int? get countDislike; int get countReply; bool get canDelete; bool? get like; List<ComicComment>? get replies;
/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCommentCopyWith<ComicComment> get copyWith => _$ComicCommentCopyWithImpl<ComicComment>(this as ComicComment, _$identity);

  /// Serializes this ComicComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicComment&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.countLike, countLike) || other.countLike == countLike)&&(identical(other.countDislike, countDislike) || other.countDislike == countDislike)&&(identical(other.countReply, countReply) || other.countReply == countReply)&&(identical(other.canDelete, canDelete) || other.canDelete == canDelete)&&(identical(other.like, like) || other.like == like)&&const DeepCollectionEquality().equals(other.replies, replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterId,userId,name,photoUrl,content,timeAgo,countLike,countDislike,countReply,canDelete,like,const DeepCollectionEquality().hash(replies));

@override
String toString() {
  return 'ComicComment(id: $id, chapterId: $chapterId, userId: $userId, name: $name, photoUrl: $photoUrl, content: $content, timeAgo: $timeAgo, countLike: $countLike, countDislike: $countDislike, countReply: $countReply, canDelete: $canDelete, like: $like, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $ComicCommentCopyWith<$Res>  {
  factory $ComicCommentCopyWith(ComicComment value, $Res Function(ComicComment) _then) = _$ComicCommentCopyWithImpl;
@useResult
$Res call({
 String id, String? chapterId, String userId, String name, OImage? photoUrl, String content, DateTime timeAgo, int? countLike, int? countDislike, int countReply, bool canDelete, bool? like, List<ComicComment>? replies
});


$OImageCopyWith<$Res>? get photoUrl;

}
/// @nodoc
class _$ComicCommentCopyWithImpl<$Res>
    implements $ComicCommentCopyWith<$Res> {
  _$ComicCommentCopyWithImpl(this._self, this._then);

  final ComicComment _self;
  final $Res Function(ComicComment) _then;

/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterId = freezed,Object? userId = null,Object? name = null,Object? photoUrl = freezed,Object? content = null,Object? timeAgo = null,Object? countLike = freezed,Object? countDislike = freezed,Object? countReply = null,Object? canDelete = null,Object? like = freezed,Object? replies = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as OImage?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as DateTime,countLike: freezed == countLike ? _self.countLike : countLike // ignore: cast_nullable_to_non_nullable
as int?,countDislike: freezed == countDislike ? _self.countDislike : countDislike // ignore: cast_nullable_to_non_nullable
as int?,countReply: null == countReply ? _self.countReply : countReply // ignore: cast_nullable_to_non_nullable
as int,canDelete: null == canDelete ? _self.canDelete : canDelete // ignore: cast_nullable_to_non_nullable
as bool,like: freezed == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as bool?,replies: freezed == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<ComicComment>?,
  ));
}
/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get photoUrl {
    if (_self.photoUrl == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.photoUrl!, (value) {
    return _then(_self.copyWith(photoUrl: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicComment].
extension ComicCommentPatterns on ComicComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicComment value)  $default,){
final _that = this;
switch (_that) {
case _ComicComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicComment value)?  $default,){
final _that = this;
switch (_that) {
case _ComicComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? chapterId,  String userId,  String name,  OImage? photoUrl,  String content,  DateTime timeAgo,  int? countLike,  int? countDislike,  int countReply,  bool canDelete,  bool? like,  List<ComicComment>? replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicComment() when $default != null:
return $default(_that.id,_that.chapterId,_that.userId,_that.name,_that.photoUrl,_that.content,_that.timeAgo,_that.countLike,_that.countDislike,_that.countReply,_that.canDelete,_that.like,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? chapterId,  String userId,  String name,  OImage? photoUrl,  String content,  DateTime timeAgo,  int? countLike,  int? countDislike,  int countReply,  bool canDelete,  bool? like,  List<ComicComment>? replies)  $default,) {final _that = this;
switch (_that) {
case _ComicComment():
return $default(_that.id,_that.chapterId,_that.userId,_that.name,_that.photoUrl,_that.content,_that.timeAgo,_that.countLike,_that.countDislike,_that.countReply,_that.canDelete,_that.like,_that.replies);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? chapterId,  String userId,  String name,  OImage? photoUrl,  String content,  DateTime timeAgo,  int? countLike,  int? countDislike,  int countReply,  bool canDelete,  bool? like,  List<ComicComment>? replies)?  $default,) {final _that = this;
switch (_that) {
case _ComicComment() when $default != null:
return $default(_that.id,_that.chapterId,_that.userId,_that.name,_that.photoUrl,_that.content,_that.timeAgo,_that.countLike,_that.countDislike,_that.countReply,_that.canDelete,_that.like,_that.replies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicComment implements ComicComment {
  const _ComicComment({required this.id, this.chapterId, required this.userId, required this.name, required this.photoUrl, required this.content, required this.timeAgo, this.countLike, this.countDislike, required this.countReply, this.canDelete = false, this.like, final  List<ComicComment>? replies}): _replies = replies;
  factory _ComicComment.fromJson(Map<String, dynamic> json) => _$ComicCommentFromJson(json);

@override final  String id;
@override final  String? chapterId;
@override final  String userId;
@override final  String name;
@override final  OImage? photoUrl;
@override final  String content;
@override final  DateTime timeAgo;
@override final  int? countLike;
@override final  int? countDislike;
@override final  int countReply;
@override@JsonKey() final  bool canDelete;
@override final  bool? like;
 final  List<ComicComment>? _replies;
@override List<ComicComment>? get replies {
  final value = _replies;
  if (value == null) return null;
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCommentCopyWith<_ComicComment> get copyWith => __$ComicCommentCopyWithImpl<_ComicComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicComment&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.countLike, countLike) || other.countLike == countLike)&&(identical(other.countDislike, countDislike) || other.countDislike == countDislike)&&(identical(other.countReply, countReply) || other.countReply == countReply)&&(identical(other.canDelete, canDelete) || other.canDelete == canDelete)&&(identical(other.like, like) || other.like == like)&&const DeepCollectionEquality().equals(other._replies, _replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterId,userId,name,photoUrl,content,timeAgo,countLike,countDislike,countReply,canDelete,like,const DeepCollectionEquality().hash(_replies));

@override
String toString() {
  return 'ComicComment(id: $id, chapterId: $chapterId, userId: $userId, name: $name, photoUrl: $photoUrl, content: $content, timeAgo: $timeAgo, countLike: $countLike, countDislike: $countDislike, countReply: $countReply, canDelete: $canDelete, like: $like, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$ComicCommentCopyWith<$Res> implements $ComicCommentCopyWith<$Res> {
  factory _$ComicCommentCopyWith(_ComicComment value, $Res Function(_ComicComment) _then) = __$ComicCommentCopyWithImpl;
@override @useResult
$Res call({
 String id, String? chapterId, String userId, String name, OImage? photoUrl, String content, DateTime timeAgo, int? countLike, int? countDislike, int countReply, bool canDelete, bool? like, List<ComicComment>? replies
});


@override $OImageCopyWith<$Res>? get photoUrl;

}
/// @nodoc
class __$ComicCommentCopyWithImpl<$Res>
    implements _$ComicCommentCopyWith<$Res> {
  __$ComicCommentCopyWithImpl(this._self, this._then);

  final _ComicComment _self;
  final $Res Function(_ComicComment) _then;

/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterId = freezed,Object? userId = null,Object? name = null,Object? photoUrl = freezed,Object? content = null,Object? timeAgo = null,Object? countLike = freezed,Object? countDislike = freezed,Object? countReply = null,Object? canDelete = null,Object? like = freezed,Object? replies = freezed,}) {
  return _then(_ComicComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as OImage?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timeAgo: null == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as DateTime,countLike: freezed == countLike ? _self.countLike : countLike // ignore: cast_nullable_to_non_nullable
as int?,countDislike: freezed == countDislike ? _self.countDislike : countDislike // ignore: cast_nullable_to_non_nullable
as int?,countReply: null == countReply ? _self.countReply : countReply // ignore: cast_nullable_to_non_nullable
as int,canDelete: null == canDelete ? _self.canDelete : canDelete // ignore: cast_nullable_to_non_nullable
as bool,like: freezed == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as bool?,replies: freezed == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<ComicComment>?,
  ));
}

/// Create a copy of ComicComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get photoUrl {
    if (_self.photoUrl == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.photoUrl!, (value) {
    return _then(_self.copyWith(photoUrl: value));
  });
}
}

// dart format on
