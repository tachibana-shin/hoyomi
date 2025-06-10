// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'watch_time_updated.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [WatchTimeUpdated]
class $WatchTimeUpdated implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/watch_time_updated.dart',
        'WatchTimeUpdated.',
        $WatchTimeUpdated.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/watch_time_updated.dart',
        'WatchTimeUpdated.fromJson',
        $WatchTimeUpdated.$fromJson);
  }

  /// Compile-time type specification of [$WatchTimeUpdated]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/watch_time_updated.dart',
    'WatchTimeUpdated',
  );

  /// Compile-time type declaration of [$WatchTimeUpdated]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$WatchTimeUpdated]
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
              'position',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.duration)),
              false,
            ),
            BridgeParameter(
              'duration',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.duration)),
              false,
            ),
            BridgeParameter(
              'updatedAt',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
              false,
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
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [WatchTimeUpdated.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $WatchTimeUpdated.wrap(
      WatchTimeUpdated(
          position: args[0]!.$value,
          duration: args[1]!.$value,
          updatedAt: args[2]!.$value),
    );
  }

  /// Wrapper for the [WatchTimeUpdated.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $WatchTimeUpdated.wrap(
      WatchTimeUpdated.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final WatchTimeUpdated $value;

  @override
  WatchTimeUpdated get $reified => $value;

  /// Wrap a [WatchTimeUpdated] in a [$WatchTimeUpdated]
  $WatchTimeUpdated.wrap(this.$value) : _superclass = $Object($value);

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
