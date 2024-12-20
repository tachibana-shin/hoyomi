import 'package:honyomi/core_services/base_service.dart';

class CaptchaRequiredException implements Exception {
  final String? message = "Captcha required";
  final BaseService service;

  CaptchaRequiredException(this.service);
}
