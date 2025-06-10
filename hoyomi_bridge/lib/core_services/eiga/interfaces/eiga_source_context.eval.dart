// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_source_context.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [EigaSourceContext]
class $EigaSourceContext implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_source_context.dart',
        'EigaSourceContext.',
        $EigaSourceContext.$new);
  }

  /// Compile-time type specification of [$EigaSourceContext]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_source_context.dart',
    'EigaSourceContext',
  );

  /// Compile-time type declaration of [$EigaSourceContext]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaSourceContext]
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
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'metaEiga',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
                  'MetaEiga'))),
              false,
            ),
            BridgeParameter(
              'episode',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                  'EigaEpisode'))),
              false,
            ),
            BridgeParameter(
              'source',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/source_video.dart',
                  'SourceVideo'))),
              false,
            ),
          ],
          params: [],
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

  /// Wrapper for the [EigaSourceContext.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaSourceContext.wrap(
      EigaSourceContext(
          eigaId: args[0]!.$value,
          metaEiga: args[1]!.$value,
          episode: args[2]!.$value,
          source: args[3]!.$value),
    );
  }

  final $Instance _superclass;

  @override
  final EigaSourceContext $value;

  @override
  EigaSourceContext get $reified => $value;

  /// Wrap a [EigaSourceContext] in a [$EigaSourceContext]
  $EigaSourceContext.wrap(this.$value) : _superclass = $Object($value);

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
