// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'opening_ending.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [DurationRange]
class $DurationRange implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
        'DurationRange.',
        $DurationRange.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
        'DurationRange.fromJson',
        $DurationRange.$fromJson);
  }

  /// Compile-time type specification of [$DurationRange]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
    'DurationRange',
  );

  /// Compile-time type declaration of [$DurationRange]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$DurationRange]
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
              'start',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.duration)),
              false,
            ),
            BridgeParameter(
              'end',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.duration)),
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

  /// Wrapper for the [DurationRange.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $DurationRange.wrap(
      DurationRange(start: args[0]!.$value, end: args[1]!.$value),
    );
  }

  /// Wrapper for the [DurationRange.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $DurationRange.wrap(
      DurationRange.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final DurationRange $value;

  @override
  DurationRange get $reified => $value;

  /// Wrap a [DurationRange] in a [$DurationRange]
  $DurationRange.wrap(this.$value) : _superclass = $Object($value);

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

/// dart_eval wrapper binding for [OpeningEnding]
class $OpeningEnding implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
        'OpeningEnding.',
        $OpeningEnding.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
        'OpeningEnding.fromJson',
        $OpeningEnding.$fromJson);
  }

  /// Compile-time type specification of [$OpeningEnding]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
    'OpeningEnding',
  );

  /// Compile-time type declaration of [$OpeningEnding]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$OpeningEnding]
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
              'opening',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
                      'DurationRange')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'ending',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.dart',
                      'DurationRange')),
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
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [OpeningEnding.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OpeningEnding.wrap(
      OpeningEnding(opening: args[0]?.$value, ending: args[1]?.$value),
    );
  }

  /// Wrapper for the [OpeningEnding.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OpeningEnding.wrap(
      OpeningEnding.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final OpeningEnding $value;

  @override
  OpeningEnding get $reified => $value;

  /// Wrap a [OpeningEnding] in a [$OpeningEnding]
  $OpeningEnding.wrap(this.$value) : _superclass = $Object($value);

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
