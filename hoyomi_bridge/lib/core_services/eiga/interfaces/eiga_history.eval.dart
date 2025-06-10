// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [EigaHistory]
class $EigaHistory implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_history.dart',
        'EigaHistory.',
        $EigaHistory.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_history.dart',
        'EigaHistory.createFakeData',
        $EigaHistory.$createFakeData);
  }

  /// Compile-time type specification of [$EigaHistory]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_history.dart',
    'EigaHistory',
  );

  /// Compile-time type declaration of [$EigaHistory]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaHistory]
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
              'sourceId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'item',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga.dart',
                  'Eiga'))),
              false,
            ),
            BridgeParameter(
              'watchUpdatedAt',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
              false,
            ),
            BridgeParameter(
              'lastEpisode',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                  'EigaEpisode'))),
              false,
            ),
            BridgeParameter(
              'watchTime',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/watch_time.dart',
                  'WatchTime'))),
              false,
            ),
          ],
          params: [],
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

  /// Wrapper for the [EigaHistory.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaHistory.wrap(
      EigaHistory(
          sourceId: args[0]!.$value,
          item: args[1]!.$value,
          watchUpdatedAt: args[2]!.$value,
          lastEpisode: args[3]!.$value,
          watchTime: args[4]!.$value),
    );
  }

  /// Wrapper for the [EigaHistory.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaHistory.wrap(
      EigaHistory.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final EigaHistory $value;

  @override
  EigaHistory get $reified => $value;

  /// Wrap a [EigaHistory] in a [$EigaHistory]
  $EigaHistory.wrap(this.$value) : _superclass = $Object($value);

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
