// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:hoyomi/core_services/interfaces/web_rule.dart';

import 'dart:js_interop';

@JS('_installWebRules')
external JSPromise _installWebRules(String rules);

Future<void> installWebRules(List<WebRule> rules) async {
  await _installWebRules(jsonEncode(rules)).toDart;
}
