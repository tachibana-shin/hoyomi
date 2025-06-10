// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'field_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [FieldInput]
class $FieldInput implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/setting/field_input.dart',
        'FieldInput.',
        $FieldInput.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/setting/field_input.dart',
        'FieldInput.fromJson',
        $FieldInput.$fromJson);
  }

  /// Compile-time type specification of [$FieldInput]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/setting/field_input.dart',
    'FieldInput',
  );

  /// Compile-time type declaration of [$FieldInput]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$FieldInput]
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
              'key',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'description',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'placeholder',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'defaultValue',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'maxLines',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              true,
            ),
            BridgeParameter(
              'appear',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
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

  /// Wrapper for the [FieldInput.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $FieldInput.wrap(
      FieldInput(
          name: args[0]!.$value,
          key: args[1]!.$value,
          description: args[2]?.$value,
          placeholder: args[3]!.$value,
          defaultValue: args[4]!.$value,
          maxLines: args[5]?.$value,
          appear: args[6]?.$value),
    );
  }

  /// Wrapper for the [FieldInput.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $FieldInput.wrap(
      FieldInput.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final FieldInput $value;

  @override
  FieldInput get $reified => $value;

  /// Wrap a [FieldInput] in a [$FieldInput]
  $FieldInput.wrap(this.$value) : _superclass = $Object($value);

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
