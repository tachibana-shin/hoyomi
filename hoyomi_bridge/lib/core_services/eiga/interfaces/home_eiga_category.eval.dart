// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'home_eiga_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [HomeEigaCategory]
class $HomeEigaCategory implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/home_eiga_category.dart',
        'HomeEigaCategory.',
        $HomeEigaCategory.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/home_eiga_category.dart',
        'HomeEigaCategory.fromJson',
        $HomeEigaCategory.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/home_eiga_category.dart',
        'HomeEigaCategory.createFakeData',
        $HomeEigaCategory.$createFakeData);
  }

  /// Compile-time type specification of [$HomeEigaCategory]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/home_eiga_category.dart',
    'HomeEigaCategory',
  );

  /// Compile-time type declaration of [$HomeEigaCategory]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$HomeEigaCategory]
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
              'categoryId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'gridView',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'items',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
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

  /// Wrapper for the [HomeEigaCategory.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $HomeEigaCategory.wrap(
      HomeEigaCategory(
          name: args[0]!.$value,
          categoryId: args[1]?.$value,
          gridView: args[2]?.$value ?? false,
          items: (args[3]!.$reified as List).cast()),
    );
  }

  /// Wrapper for the [HomeEigaCategory.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $HomeEigaCategory.wrap(
      HomeEigaCategory.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [HomeEigaCategory.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $HomeEigaCategory.wrap(
      HomeEigaCategory.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final HomeEigaCategory $value;

  @override
  HomeEigaCategory get $reified => $value;

  /// Wrap a [HomeEigaCategory] in a [$HomeEigaCategory]
  $HomeEigaCategory.wrap(this.$value) : _superclass = $Object($value);

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
