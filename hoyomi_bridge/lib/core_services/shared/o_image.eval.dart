// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'o_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [OImage]
class $OImage implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.',
        $OImage.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.fromJson',
        $OImage.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.from',
        $OImage.$from);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.createFakeData',
        $OImage.$createFakeData);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.fake*g',
        $OImage.$fake);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/o_image.dart',
        'OImage.blank*g',
        $OImage.$blank);
  }

  /// Compile-time type specification of [$OImage]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/o_image.dart',
    'OImage',
  );

  /// Compile-time type declaration of [$OImage]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$OImage]
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
              'src',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'headers',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/headers.dart',
                      'Headers')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'extra',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
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
      'from': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'src',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
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
      'fake': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'blank': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [OImage.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OImage.wrap(
      OImage(
          src: args[0]!.$value,
          headers: args[1]?.$value,
          extra: args[2]?.$value),
    );
  }

  /// Wrapper for the [OImage.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OImage.wrap(
      OImage.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [OImage.from] constructor
  static $Value? $from(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OImage.wrap(
      OImage.from(args[0]!.$value),
    );
  }

  /// Wrapper for the [OImage.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $OImage.wrap(
      OImage.createFakeData(),
    );
  }

  /// Wrapper for the [OImage.fake] getter
  static $Value? $fake(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = OImage.fake;
    return $String(value);
  }

  /// Wrapper for the [OImage.blank] getter
  static $Value? $blank(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = OImage.blank;
    return $String(value);
  }

  final $Instance _superclass;

  @override
  final OImage $value;

  @override
  OImage get $reified => $value;

  /// Wrap a [OImage] in a [$OImage]
  $OImage.wrap(this.$value) : _superclass = $Object($value);

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
