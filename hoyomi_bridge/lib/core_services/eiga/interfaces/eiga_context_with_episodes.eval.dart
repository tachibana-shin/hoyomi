// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_context_with_episodes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [EigaContextWithEpisodes]
class $EigaContextWithEpisodes implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_context_with_episodes.dart',
        'EigaContextWithEpisodes.',
        $EigaContextWithEpisodes.$new);
  }

  /// Compile-time type specification of [$EigaContextWithEpisodes]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_context_with_episodes.dart',
    'EigaContextWithEpisodes',
  );

  /// Compile-time type declaration of [$EigaContextWithEpisodes]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaContextWithEpisodes]
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
              'season',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
                      'Season')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'episodes',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
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

  /// Wrapper for the [EigaContextWithEpisodes.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaContextWithEpisodes.wrap(
      EigaContextWithEpisodes(
          eigaId: args[0]!.$value,
          metaEiga: args[1]!.$value,
          season: args[2]?.$value,
          episodes: (args[3]!.$reified as List).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final EigaContextWithEpisodes $value;

  @override
  EigaContextWithEpisodes get $reified => $value;

  /// Wrap a [EigaContextWithEpisodes] in a [$EigaContextWithEpisodes]
  $EigaContextWithEpisodes.wrap(this.$value) : _superclass = $Object($value);

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
