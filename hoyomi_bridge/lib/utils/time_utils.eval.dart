// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'time_utils.dart';
import 'package:intl/intl.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [TimeUtils]
class $TimeUtils implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:hoyomi_bridge/utils/time_utils.dart',
        'TimeUtils.convertTimeAgoToUtc', $TimeUtils.$convertTimeAgoToUtc);
  }

  /// Compile-time type specification of [$TimeUtils]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/utils/time_utils.dart',
    'TimeUtils',
  );

  /// Compile-time type declaration of [$TimeUtils]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$TimeUtils]
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
      'convertTimeAgoToUtc': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'timeAgo',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
        isStatic: true,
      ),
    },
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [TimeUtils.convertTimeAgoToUtc] method
  static $Value? $convertTimeAgoToUtc(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = TimeUtils.convertTimeAgoToUtc(args[0]!.$value);
    return $DateTime.wrap(value);
  }

  final $Instance _superclass;

  @override
  final TimeUtils $value;

  @override
  TimeUtils get $reified => $value;

  /// Wrap a [TimeUtils] in a [$TimeUtils]
  $TimeUtils.wrap(this.$value) : _superclass = $Object($value);

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
