// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'user_not_found_exception.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [UserNotFoundException]
class $UserNotFoundException implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/exception/user_not_found_exception.dart',
        'UserNotFoundException.',
        $UserNotFoundException.$new);
  }

  /// Compile-time type specification of [$UserNotFoundException]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/exception/user_not_found_exception.dart',
    'UserNotFoundException',
  );

  /// Compile-time type declaration of [$UserNotFoundException]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$UserNotFoundException]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
      $implements: [BridgeTypeRef(CoreTypes.exception)],
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'message',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'trace',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.stackTrace),
                  nullable: true),
              true,
            ),
          ],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'toString': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    getters: {},
    setters: {},
    fields: {
      'message': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'trace': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.stackTrace)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [UserNotFoundException.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $UserNotFoundException.wrap(
      UserNotFoundException(
          args[0]?.$value ?? 'User not found', args[1]?.$value),
    );
  }

  final $Instance _superclass;

  @override
  final UserNotFoundException $value;

  @override
  UserNotFoundException get $reified => $value;

  /// Wrap a [UserNotFoundException] in a [$UserNotFoundException]
  $UserNotFoundException.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'message':
        final _message = $value.message;
        return $String(_message);

      case 'trace':
        final _trace = $value.trace;
        return $StackTrace.wrap(_trace);
      case 'toString':
        return __toString;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __toString = $Function(_toString);
  static $Value? _toString(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $UserNotFoundException;
    final result = self.$value.toString();
    return $String(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
