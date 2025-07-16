export 'extensions/fetch.dart';
export 'extensions/rust_api.dart';

class JsRuntimeError implements Exception {
  final String message;
  final bool isUnimplemented;

  JsRuntimeError({required this.message, this.isUnimplemented = false});

  @override
  String toString() =>
      'JsRuntimeError: $message${isUnimplemented ? ' (unimplemented)' : ''}';
}

abstract class JsRuntime {
  Future<void> init();
  Future<dynamic> evalAsync(String code);
  Future<dynamic> evaluateAsync(String code, [String? name]);
  Future<dynamic> evalAsyncJson(String code, [String? msg]);
  Future<dynamic> evalFn(
    String functionName,
    List<dynamic> args, {
    bool base64 = false,
  });
  Future<void> dartSendMessage(String name, String data);
  Future<void> onMessage(String name, void Function(dynamic args) callback);
  void dispose();
}
