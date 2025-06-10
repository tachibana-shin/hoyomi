// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'url_search_params.dart';
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [UrlSearchParams]
class $UrlSearchParams implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
        'UrlSearchParams.',
        $UrlSearchParams.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
        'UrlSearchParams.fromJson',
        $UrlSearchParams.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
        'UrlSearchParams.fromQuery',
        $UrlSearchParams.$fromQuery);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
        'UrlSearchParams.fromMap',
        $UrlSearchParams.$fromMap);
  }

  /// Compile-time type specification of [$UrlSearchParams]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
    'UrlSearchParams',
  );

  /// Compile-time type declaration of [$UrlSearchParams]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$UrlSearchParams]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'params',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              true,
            ),
          ],
          params: [],
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
      'fromQuery': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'query',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
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
              'params',
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

  /// Wrapper for the [UrlSearchParams.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $UrlSearchParams.wrap(
      UrlSearchParams(params: (args[0]?.$reified ?? const {} as Map?)?.cast()),
    );
  }

  /// Wrapper for the [UrlSearchParams.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $UrlSearchParams.wrap(
      UrlSearchParams.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [UrlSearchParams.fromQuery] constructor
  static $Value? $fromQuery(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $UrlSearchParams.wrap(
      UrlSearchParams.fromQuery(args[0]!.$value),
    );
  }

  /// Wrapper for the [UrlSearchParams.fromMap] constructor
  static $Value? $fromMap(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $UrlSearchParams.wrap(
      UrlSearchParams.fromMap((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final UrlSearchParams $value;

  @override
  UrlSearchParams get $reified => $value;

  /// Wrap a [UrlSearchParams] in a [$UrlSearchParams]
  $UrlSearchParams.wrap(this.$value) : _superclass = $Object($value);

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
