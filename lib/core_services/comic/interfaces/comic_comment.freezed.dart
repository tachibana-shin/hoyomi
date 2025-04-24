// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  String get id;
  String get comicId;
  String? get chapterId;
  String get userId;
  String get name;
  OImage get photoUrl;
  String get content;
  DateTime get timeAgo;
  int? get countLike;
  int? get countDislike;
  int get countReply;
  bool get canDelete;
  bool? get like;

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComicCommentCopyWith<ComicComment> get copyWith =>
      _$ComicCommentCopyWithImpl<ComicComment>(
          this as ComicComment, _$identity);

  /// Serializes this ComicComment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComicComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comicId, comicId) || other.comicId == comicId) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo) &&
            (identical(other.countLike, countLike) ||
                other.countLike == countLike) &&
            (identical(other.countDislike, countDislike) ||
                other.countDislike == countDislike) &&
            (identical(other.countReply, countReply) ||
                other.countReply == countReply) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete) &&
            (identical(other.like, like) || other.like == like));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      comicId,
      chapterId,
      userId,
      name,
      photoUrl,
      content,
      timeAgo,
      countLike,
      countDislike,
      countReply,
      canDelete,
      like);

  @override
  String toString() {
    return 'ComicComment(id: $id, comicId: $comicId, chapterId: $chapterId, userId: $userId, name: $name, photoUrl: $photoUrl, content: $content, timeAgo: $timeAgo, countLike: $countLike, countDislike: $countDislike, countReply: $countReply, canDelete: $canDelete, like: $like)';
  }
}

/// @nodoc
abstract mixin class $ComicCommentCopyWith<$Res> {
  factory $ComicCommentCopyWith(
          ComicComment value, $Res Function(ComicComment) _then) =
      _$ComicCommentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String comicId,
      String? chapterId,
      String userId,
      String name,
      OImage photoUrl,
      String content,
      DateTime timeAgo,
      int? countLike,
      int? countDislike,
      int countReply,
      bool canDelete,
      bool? like});

  $OImageCopyWith<$Res> get photoUrl;
}

/// @nodoc
class _$ComicCommentCopyWithImpl<$Res> implements $ComicCommentCopyWith<$Res> {
  _$ComicCommentCopyWithImpl(this._self, this._then);

  final ComicComment _self;
  final $Res Function(ComicComment) _then;

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comicId = null,
    Object? chapterId = freezed,
    Object? userId = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? content = null,
    Object? timeAgo = null,
    Object? countLike = freezed,
    Object? countDislike = freezed,
    Object? countReply = null,
    Object? canDelete = null,
    Object? like = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _self.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _self.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as OImage,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _self.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countLike: freezed == countLike
          ? _self.countLike
          : countLike // ignore: cast_nullable_to_non_nullable
              as int?,
      countDislike: freezed == countDislike
          ? _self.countDislike
          : countDislike // ignore: cast_nullable_to_non_nullable
              as int?,
      countReply: null == countReply
          ? _self.countReply
          : countReply // ignore: cast_nullable_to_non_nullable
              as int,
      canDelete: null == canDelete
          ? _self.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      like: freezed == like
          ? _self.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get photoUrl {
    return $OImageCopyWith<$Res>(_self.photoUrl, (value) {
      return _then(_self.copyWith(photoUrl: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ComicComment implements ComicComment {
  const _ComicComment(
      {required this.id,
      required this.comicId,
      this.chapterId,
      required this.userId,
      required this.name,
      required this.photoUrl,
      required this.content,
      required this.timeAgo,
      this.countLike,
      this.countDislike,
      required this.countReply,
      this.canDelete = false,
      this.like});
  factory _ComicComment.fromJson(Map<String, dynamic> json) =>
      _$ComicCommentFromJson(json);

  @override
  final String id;
  @override
  final String comicId;
  @override
  final String? chapterId;
  @override
  final String userId;
  @override
  final String name;
  @override
  final OImage photoUrl;
  @override
  final String content;
  @override
  final DateTime timeAgo;
  @override
  final int? countLike;
  @override
  final int? countDislike;
  @override
  final int countReply;
  @override
  @JsonKey()
  final bool canDelete;
  @override
  final bool? like;

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComicCommentCopyWith<_ComicComment> get copyWith =>
      __$ComicCommentCopyWithImpl<_ComicComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ComicCommentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComicComment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comicId, comicId) || other.comicId == comicId) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo) &&
            (identical(other.countLike, countLike) ||
                other.countLike == countLike) &&
            (identical(other.countDislike, countDislike) ||
                other.countDislike == countDislike) &&
            (identical(other.countReply, countReply) ||
                other.countReply == countReply) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete) &&
            (identical(other.like, like) || other.like == like));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      comicId,
      chapterId,
      userId,
      name,
      photoUrl,
      content,
      timeAgo,
      countLike,
      countDislike,
      countReply,
      canDelete,
      like);

  @override
  String toString() {
    return 'ComicComment(id: $id, comicId: $comicId, chapterId: $chapterId, userId: $userId, name: $name, photoUrl: $photoUrl, content: $content, timeAgo: $timeAgo, countLike: $countLike, countDislike: $countDislike, countReply: $countReply, canDelete: $canDelete, like: $like)';
  }
}

/// @nodoc
abstract mixin class _$ComicCommentCopyWith<$Res>
    implements $ComicCommentCopyWith<$Res> {
  factory _$ComicCommentCopyWith(
          _ComicComment value, $Res Function(_ComicComment) _then) =
      __$ComicCommentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String comicId,
      String? chapterId,
      String userId,
      String name,
      OImage photoUrl,
      String content,
      DateTime timeAgo,
      int? countLike,
      int? countDislike,
      int countReply,
      bool canDelete,
      bool? like});

  @override
  $OImageCopyWith<$Res> get photoUrl;
}

/// @nodoc
class __$ComicCommentCopyWithImpl<$Res>
    implements _$ComicCommentCopyWith<$Res> {
  __$ComicCommentCopyWithImpl(this._self, this._then);

  final _ComicComment _self;
  final $Res Function(_ComicComment) _then;

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? comicId = null,
    Object? chapterId = freezed,
    Object? userId = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? content = null,
    Object? timeAgo = null,
    Object? countLike = freezed,
    Object? countDislike = freezed,
    Object? countReply = null,
    Object? canDelete = null,
    Object? like = freezed,
  }) {
    return _then(_ComicComment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _self.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _self.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as OImage,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _self.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countLike: freezed == countLike
          ? _self.countLike
          : countLike // ignore: cast_nullable_to_non_nullable
              as int?,
      countDislike: freezed == countDislike
          ? _self.countDislike
          : countDislike // ignore: cast_nullable_to_non_nullable
              as int?,
      countReply: null == countReply
          ? _self.countReply
          : countReply // ignore: cast_nullable_to_non_nullable
              as int,
      canDelete: null == canDelete
          ? _self.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      like: freezed == like
          ? _self.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of ComicComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get photoUrl {
    return $OImageCopyWith<$Res>(_self.photoUrl, (value) {
      return _then(_self.copyWith(photoUrl: value));
    });
  }
}

// dart format on
