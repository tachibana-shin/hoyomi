// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [Genre]
class $Genre implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/genre.dart',
        'Genre.',
        $Genre.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/genre.dart',
        'Genre.fromJson',
        $Genre.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/genre.dart',
        'Genre.createFakeData',
        $Genre.$createFakeData);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/genre.dart',
        'Genre.noId*g',
        $Genre.$noId);
  }

  /// Compile-time type specification of [$Genre]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/genre.dart',
    'Genre',
  );

  /// Compile-time type declaration of [$Genre]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Genre]
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
              'genreId',
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
              'image',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/o_image.dart',
                      'OImage')),
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
      'noId': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [Genre.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Genre.wrap(
      Genre(
          name: args[0]!.$value,
          genreId: args[1]!.$value,
          description: args[2]?.$value,
          image: args[3]?.$value),
    );
  }

  /// Wrapper for the [Genre.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Genre.wrap(
      Genre.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [Genre.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Genre.wrap(
      Genre.createFakeData(),
    );
  }

  /// Wrapper for the [Genre.noId] getter
  static $Value? $noId(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Genre.noId;
    return $String(value);
  }

  final $Instance _superclass;

  @override
  final Genre $value;

  @override
  Genre get $reified => $value;

  /// Wrap a [Genre] in a [$Genre]
  $Genre.wrap(this.$value) : _superclass = $Object($value);

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
