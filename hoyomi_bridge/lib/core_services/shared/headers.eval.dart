// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'headers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [Headers]
class $Headers implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/headers.dart',
        'Headers.',
        $Headers.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/headers.dart',
        'Headers.fromMap',
        $Headers.$fromMap);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/headers.dart',
        'Headers.fromJson',
        $Headers.$fromJson);
  }

  /// Compile-time type specification of [$Headers]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/headers.dart',
    'Headers',
  );

  /// Compile-time type declaration of [$Headers]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Headers]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '_': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'headers',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              true,
            ),
          ],
          params: [],
        ),
        isFactory: true,
      ),
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'initial',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map),
                  nullable: true),
              false,
            ),
          ],
        ),
        isFactory: true,
      ),
      'fromMap': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'map',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              false,
            ),
          ],
        ),
        isFactory: true,
      ),
      'fromJson': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'json',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              false,
            ),
          ],
        ),
        isFactory: true,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [Headers.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Headers.wrap(
      Headers((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [Headers.fromMap] constructor
  static $Value? $fromMap(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Headers.wrap(
      Headers.fromMap((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [Headers.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Headers.wrap(
      Headers.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final Headers $value;

  @override
  Headers get $reified => $value;

  /// Wrap a [Headers] in a [$Headers]
  $Headers.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
