// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_episodes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [EigaEpisodes]
class $EigaEpisodes implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episodes.dart',
        'EigaEpisodes.',
        $EigaEpisodes.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episodes.dart',
        'EigaEpisodes.fromJson',
        $EigaEpisodes.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episodes.dart',
        'EigaEpisodes.createFakeData',
        $EigaEpisodes.$createFakeData);
  }

  /// Compile-time type specification of [$EigaEpisodes]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episodes.dart',
    'EigaEpisodes',
  );

  /// Compile-time type declaration of [$EigaEpisodes]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaEpisodes]
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
              'episodes',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'image',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/o_image.dart',
                      'OImage')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'poster',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/o_image.dart',
                      'OImage')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'schedule',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
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
      'createFakeData': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
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

  /// Wrapper for the [EigaEpisodes.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisodes.wrap(
      EigaEpisodes(
          episodes: (args[0]!.$reified as List).cast(),
          image: args[1]?.$value,
          poster: args[2]?.$value,
          schedule: args[3]?.$value),
    );
  }

  /// Wrapper for the [EigaEpisodes.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisodes.wrap(
      EigaEpisodes.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [EigaEpisodes.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisodes.wrap(
      EigaEpisodes.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final EigaEpisodes $value;

  @override
  EigaEpisodes get $reified => $value;

  /// Wrap a [EigaEpisodes] in a [$EigaEpisodes]
  $EigaEpisodes.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
