// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'bridger.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:dart_eval/stdlib/async.dart';

/// dart_eval wrapper binding for [Bridger]
class $Bridger implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {}

  /// Compile-time type specification of [$Bridger]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/bridger.dart',
    'Bridger',
  );

  /// Compile-time type declaration of [$Bridger]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Bridger]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: true,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'fetch': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'cookie',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'query',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
                      'UrlSearchParams')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'body',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'headers',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/headers.dart',
                      'Headers')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'notify',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'headless',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'cache',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'url',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
    },
    getters: {
      'baseUrl': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    setters: {},
    fields: {},
    wrap: true,
  );

  final $Instance _superclass;

  @override
  final Bridger $value;

  @override
  Bridger get $reified => $value;

  /// Wrap a [Bridger] in a [$Bridger]
  $Bridger.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'baseUrl':
        final _baseUrl = $value.baseUrl;
        return $String(_baseUrl);
      case 'fetch':
        return __fetch;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __fetch = $Function(_fetch);
  static $Value? _fetch(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $Bridger;
    final result = self.$value.fetch(args[0]!.$value,
        cookie: args[1]?.$value,
        query: args[2]?.$value,
        body: (args[3]?.$reified as Map?)?.cast(),
        headers: args[4]?.$value,
        notify: args[5]?.$value ?? true,
        headless: args[6]?.$value ?? false,
        cache: args[7]?.$value ?? true);
    return $Future.wrap(result.then((e) => $String(e)));
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
