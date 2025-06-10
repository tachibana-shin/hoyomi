// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [EigaEpisode]
class $EigaEpisode implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
        'EigaEpisode.',
        $EigaEpisode.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
        'EigaEpisode.fromJson',
        $EigaEpisode.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
        'EigaEpisode.createFakeData',
        $EigaEpisode.$createFakeData);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
        'EigaEpisode.trailerId*g',
        $EigaEpisode.$trailerId);
  }

  /// Compile-time type specification of [$EigaEpisode]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
    'EigaEpisode',
  );

  /// Compile-time type declaration of [$EigaEpisode]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaEpisode]
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
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'episodeId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
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
              'description',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'extra',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'order',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
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
    fields: {
      'trailerId': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [EigaEpisode.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisode.wrap(
      EigaEpisode(
          name: args[0]!.$value,
          episodeId: args[1]!.$value,
          image: args[2]?.$value,
          description: args[3]?.$value,
          extra: args[4]?.$value,
          order: args[5]?.$value),
    );
  }

  /// Wrapper for the [EigaEpisode.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisode.wrap(
      EigaEpisode.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [EigaEpisode.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaEpisode.wrap(
      EigaEpisode.createFakeData(),
    );
  }

  /// Wrapper for the [EigaEpisode.trailerId] getter
  static $Value? $trailerId(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = EigaEpisode.trailerId;
    return $String(value);
  }

  final $Instance _superclass;

  @override
  final EigaEpisode $value;

  @override
  EigaEpisode get $reified => $value;

  /// Wrap a [EigaEpisode] in a [$EigaEpisode]
  $EigaEpisode.wrap(this.$value) : _superclass = $Object($value);

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
