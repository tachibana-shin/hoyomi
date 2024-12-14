import 'package:honyomi/core_services/interfaces/base_comments.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';

abstract class AuthService {
  String get signInUrl;
  Future<BasicUser> getUser({String? cookie});
  Future<bool> isLiked({required String bookId});
  Future<bool> setLike({required String bookId, required bool value});

  Future<BaseComments> Function(
      {required String bookId,
      String? chapterId,
      String? parentId,
      int? page})? get getComments;
}
