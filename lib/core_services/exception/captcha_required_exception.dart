import 'package:hoyomi/core_services/service.dart';

class CaptchaRequiredException implements Exception {
  final String? message = "Captcha required";
  final Service service;

  CaptchaRequiredException(this.service);
}
