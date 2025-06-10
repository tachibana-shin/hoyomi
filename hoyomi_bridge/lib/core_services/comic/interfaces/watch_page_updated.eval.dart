// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'watch_page_updated.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [WatchPageUpdated]
class $WatchPageUpdated implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/watch_page_updated.dart',
        'WatchPageUpdated.',
        $WatchPageUpdated.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/watch_page_updated.dart',
        'WatchPageUpdated.fromJson',
        $WatchPageUpdated.$fromJson);
  }

  /// Compile-time type specification of [$WatchPageUpdated]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/watch_page_updated.dart',
    'WatchPageUpdated',
  );

  /// Compile-time type declaration of [$WatchPageUpdated]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$WatchPageUpdated]
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
              'currentPage',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
            BridgeParameter(
              'totalPage',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
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

  /// Wrapper for the [WatchPageUpdated.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $WatchPageUpdated.wrap(
      WatchPageUpdated(
          currentPage: args[0]!.$value,
          totalPage: args[1]!.$value,
          updatedAt: args[2]!.$value),
    );
  }

  /// Wrapper for the [WatchPageUpdated.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $WatchPageUpdated.wrap(
      WatchPageUpdated.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final WatchPageUpdated $value;

  @override
  WatchPageUpdated get $reified => $value;

  /// Wrap a [WatchPageUpdated] in a [$WatchPageUpdated]
  $WatchPageUpdated.wrap(this.$value) : _superclass = $Object($value);

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
