import 'package:hoyomi/core_services/base_auth_service.dart';
import 'package:hoyomi/core_services/book/interfaces/base_comments.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_comment.dart';

abstract class BookAuthService extends BaseAuthService {
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
