// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [ComicHome]
class $ComicHome implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_home.dart',
        'ComicHome.',
        $ComicHome.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_home.dart',
        'ComicHome.fromJson',
        $ComicHome.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_home.dart',
        'ComicHome.createFakeData',
        $ComicHome.$createFakeData);
  }

  /// Compile-time type specification of [$ComicHome]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_home.dart',
    'ComicHome',
  );

  /// Compile-time type declaration of [$ComicHome]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicHome]
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
              'carousel',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/comic/interfaces/comic_carousel.dart',
                      'ComicCarousel')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'categories',
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

  /// Wrapper for the [ComicHome.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicHome.wrap(
      ComicHome(
          carousel: args[0]?.$value,
          categories: (args[1]!.$reified as List).cast()),
    );
  }

  /// Wrapper for the [ComicHome.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicHome.wrap(
      ComicHome.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [ComicHome.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicHome.wrap(
      ComicHome.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final ComicHome $value;

  @override
  ComicHome get $reified => $value;

  /// Wrap a [ComicHome] in a [$ComicHome]
  $ComicHome.wrap(this.$value) : _superclass = $Object($value);

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
