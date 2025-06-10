// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [ComicChapter]
class $ComicChapter implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
        'ComicChapter.',
        $ComicChapter.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
        'ComicChapter.fromJson',
        $ComicChapter.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
        'ComicChapter.createFakeData',
        $ComicChapter.$createFakeData);
  }

  /// Compile-time type specification of [$ComicChapter]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
    'ComicChapter',
  );

  /// Compile-time type declaration of [$ComicChapter]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicChapter]
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
              'fullName',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'chapterId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'time',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'extra',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'order',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
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
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [ComicChapter.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicChapter.wrap(
      ComicChapter(
          name: args[0]!.$value,
          fullName: args[1]?.$value,
          chapterId: args[2]!.$value,
          time: args[3]?.$value,
          extra: args[4]?.$value,
          order: args[5]?.$value),
    );
  }

  /// Wrapper for the [ComicChapter.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicChapter.wrap(
      ComicChapter.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [ComicChapter.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicChapter.wrap(
      ComicChapter.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final ComicChapter $value;

  @override
  ComicChapter get $reified => $value;

  /// Wrap a [ComicChapter] in a [$ComicChapter]
  $ComicChapter.wrap(this.$value) : _superclass = $Object($value);

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
