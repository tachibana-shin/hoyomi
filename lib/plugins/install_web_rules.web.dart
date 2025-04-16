// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:hoyomi/core_services/interfaces/web_rule.dart';

import 'dart:js_util';
// ignore: depend_on_referenced_packages
import 'package:js/js.dart';

@JS('_installWebRules')
external Object _installWebRules(
    String rules); // or Map<String, dynamic> if applicable

Future<void> installWebRules(List<WebRule> rules) async {
  await promiseToFuture<void>(_installWebRules(jsonEncode(rules)));
}
