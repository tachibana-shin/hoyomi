// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'status_enum.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [StatusEnum]
class $StatusEnum implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.',
        $StatusEnum.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.isValid',
        $StatusEnum.$isValid);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.ongoing*g',
        $StatusEnum.$ongoing);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.completed*g',
        $StatusEnum.$completed);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.canceled*g',
        $StatusEnum.$canceled);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.unknown*g',
        $StatusEnum.$unknown);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.onHiatus*g',
        $StatusEnum.$onHiatus);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.publishingFinished*g',
        $StatusEnum.$publishingFinished);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/status_enum.dart',
        'StatusEnum.values*g',
        $StatusEnum.$values);
  }

  /// Compile-time type specification of [$StatusEnum]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/status_enum.dart',
    'StatusEnum',
  );

  /// Compile-time type declaration of [$StatusEnum]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$StatusEnum]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
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
      'isValid': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [
            BridgeParameter(
              'value',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              false,
            ),
          ],
        ),
        isStatic: true,
      ),
    },
    getters: {},
    setters: {},
    fields: {
      'ongoing': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'completed': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'canceled': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'unknown': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'onHiatus': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'publishingFinished': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'values': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: true,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [StatusEnum.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $StatusEnum.wrap(
      StatusEnum(),
    );
  }

  /// Wrapper for the [StatusEnum.isValid] method
  static $Value? $isValid(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.isValid(args[0]!.$value);
    return $bool(value);
  }

  /// Wrapper for the [StatusEnum.ongoing] getter
  static $Value? $ongoing(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.ongoing;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.completed] getter
  static $Value? $completed(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.completed;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.canceled] getter
  static $Value? $canceled(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.canceled;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.unknown] getter
  static $Value? $unknown(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.unknown;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.onHiatus] getter
  static $Value? $onHiatus(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.onHiatus;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.publishingFinished] getter
  static $Value? $publishingFinished(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.publishingFinished;
    return $String(value);
  }

  /// Wrapper for the [StatusEnum.values] getter
  static $Value? $values(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = StatusEnum.values;
    return $List.view(value, (e) => $String(e));
  }

  final $Instance _superclass;

  @override
  final StatusEnum $value;

  @override
  StatusEnum get $reified => $value;

  /// Wrap a [StatusEnum] in a [$StatusEnum]
  $StatusEnum.wrap(this.$value) : _superclass = $Object($value);

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
