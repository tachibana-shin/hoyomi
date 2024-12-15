import 'package:honyomi/core_services/book/interfaces/base_comments.dart';
import 'package:honyomi/core_services/book/interfaces/basic_comment.dart';
import 'package:honyomi/core_services/book/interfaces/basic_user.dart';

abstract class AuthService {
  String get signInUrl;
  Future<BasicUser> getUser({String? cookie});
  Future<bool> isLiked({required String bookId});
  Future<bool> setLike({required String bookId, required bool value});

// for comment system
  Future<BaseComments> Function(
      {required String bookId,
      String? chapterId,
      BasicComment? parent,
      int? page})? get getComments;

  Future<void> Function(
      {required String bookId,
      String? chapterId,
      BasicComment? parent,
      required BasicComment comment})? get deleteComment;

  Future<bool> Function(
      {required String bookId,
      String? chapterId,
      BasicComment? parent,
      required BasicComment comment,
      required bool value})? get setLikeComment;
}
