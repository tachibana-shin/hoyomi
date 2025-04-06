// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComicComment _$ComicCommentFromJson(Map<String, dynamic> json) {
  return _ComicComment.fromJson(json);
}

/// @nodoc
mixin _$ComicComment {
  String get id => throw _privateConstructorUsedError;
  String get comicId => throw _privateConstructorUsedError;
  String? get chapterId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OImage get photoUrl => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timeAgo => throw _privateConstructorUsedError;
  int? get countLike => throw _privateConstructorUsedError;
  int? get countDislike => throw _privateConstructorUsedError;
  int get countReply => throw _privateConstructorUsedError;
  bool get canDelete => throw _privateConstructorUsedError;
  bool? get like => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComicCommentCopyWith<ComicComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicCommentCopyWith<$Res> {
  factory $ComicCommentCopyWith(
          ComicComment value, $Res Function(ComicComment) then) =
      _$ComicCommentCopyWithImpl<$Res, ComicComment>;
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
class _$ComicCommentCopyWithImpl<$Res, $Val extends ComicComment>
    implements $ComicCommentCopyWith<$Res> {
  _$ComicCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as OImage,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countLike: freezed == countLike
          ? _value.countLike
          : countLike // ignore: cast_nullable_to_non_nullable
              as int?,
      countDislike: freezed == countDislike
          ? _value.countDislike
          : countDislike // ignore: cast_nullable_to_non_nullable
              as int?,
      countReply: null == countReply
          ? _value.countReply
          : countReply // ignore: cast_nullable_to_non_nullable
              as int,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res> get photoUrl {
    return $OImageCopyWith<$Res>(_value.photoUrl, (value) {
      return _then(_value.copyWith(photoUrl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComicCommentImplCopyWith<$Res>
    implements $ComicCommentCopyWith<$Res> {
  factory _$$ComicCommentImplCopyWith(
          _$ComicCommentImpl value, $Res Function(_$ComicCommentImpl) then) =
      __$$ComicCommentImplCopyWithImpl<$Res>;
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
class __$$ComicCommentImplCopyWithImpl<$Res>
    extends _$ComicCommentCopyWithImpl<$Res, _$ComicCommentImpl>
    implements _$$ComicCommentImplCopyWith<$Res> {
  __$$ComicCommentImplCopyWithImpl(
      _$ComicCommentImpl _value, $Res Function(_$ComicCommentImpl) _then)
      : super(_value, _then);

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
    return _then(_$ComicCommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as OImage,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timeAgo: null == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      countLike: freezed == countLike
          ? _value.countLike
          : countLike // ignore: cast_nullable_to_non_nullable
              as int?,
      countDislike: freezed == countDislike
          ? _value.countDislike
          : countDislike // ignore: cast_nullable_to_non_nullable
              as int?,
      countReply: null == countReply
          ? _value.countReply
          : countReply // ignore: cast_nullable_to_non_nullable
              as int,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComicCommentImpl implements _ComicComment {
  const _$ComicCommentImpl(
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

  factory _$ComicCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComicCommentImplFromJson(json);

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

  @override
  String toString() {
    return 'ComicComment(id: $id, comicId: $comicId, chapterId: $chapterId, userId: $userId, name: $name, photoUrl: $photoUrl, content: $content, timeAgo: $timeAgo, countLike: $countLike, countDislike: $countDislike, countReply: $countReply, canDelete: $canDelete, like: $like)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComicCommentImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComicCommentImplCopyWith<_$ComicCommentImpl> get copyWith =>
      __$$ComicCommentImplCopyWithImpl<_$ComicCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComicCommentImplToJson(
      this,
    );
  }
}

abstract class _ComicComment implements ComicComment {
  const factory _ComicComment(
      {required final String id,
      required final String comicId,
      final String? chapterId,
      required final String userId,
      required final String name,
      required final OImage photoUrl,
      required final String content,
      required final DateTime timeAgo,
      final int? countLike,
      final int? countDislike,
      required final int countReply,
      final bool canDelete,
      final bool? like}) = _$ComicCommentImpl;

  factory _ComicComment.fromJson(Map<String, dynamic> json) =
      _$ComicCommentImpl.fromJson;

  @override
  String get id;
  @override
  String get comicId;
  @override
  String? get chapterId;
  @override
  String get userId;
  @override
  String get name;
  @override
  OImage get photoUrl;
  @override
  String get content;
  @override
  DateTime get timeAgo;
  @override
  int? get countLike;
  @override
  int? get countDislike;
  @override
  int get countReply;
  @override
  bool get canDelete;
  @override
  bool? get like;
  @override
  @JsonKey(ignore: true)
  _$$ComicCommentImplCopyWith<_$ComicCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
