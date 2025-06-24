import 'package:flutter_js/flutter_js.dart';

export 'extensions/fetch.dart';

Future<JavascriptRuntime> getJsRuntime({
  bool forceJavascriptCoreOnAndroid = false,
  bool xhr = false,
  Map<String, dynamic>? extraArgs = const {},
}) async {
  final flutterJs = getJavascriptRuntime(
    forceJavascriptCoreOnAndroid: forceJavascriptCoreOnAndroid,
    xhr: xhr,
    extraArgs: extraArgs,
  );

  await flutterJs.enableHandlePromises();

  return flutterJs;
}
