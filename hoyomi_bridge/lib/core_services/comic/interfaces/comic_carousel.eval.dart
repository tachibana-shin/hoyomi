// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_carousel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [ComicCarousel]
class $ComicCarousel implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_carousel.dart',
        'ComicCarousel.',
        $ComicCarousel.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_carousel.dart',
        'ComicCarousel.fromJson',
        $ComicCarousel.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_carousel.dart',
        'ComicCarousel.createFakeData',
        $ComicCarousel.$createFakeData);
  }

  /// Compile-time type specification of [$ComicCarousel]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_carousel.dart',
    'ComicCarousel',
  );

  /// Compile-time type declaration of [$ComicCarousel]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicCarousel]
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
              'items',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'aspectRatio',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.double)),
              false,
            ),
            BridgeParameter(
              'maxHeightBuilder',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.double)),
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

  /// Wrapper for the [ComicCarousel.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicCarousel.wrap(
      ComicCarousel(
          items: (args[0]!.$reified as List).cast(),
          aspectRatio: args[1]!.$value,
          maxHeightBuilder: args[2]!.$value),
    );
  }

  /// Wrapper for the [ComicCarousel.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicCarousel.wrap(
      ComicCarousel.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [ComicCarousel.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicCarousel.wrap(
      ComicCarousel.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final ComicCarousel $value;

  @override
  ComicCarousel get $reified => $value;

  /// Wrap a [ComicCarousel] in a [$ComicCarousel]
  $ComicCarousel.wrap(this.$value) : _superclass = $Object($value);

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
