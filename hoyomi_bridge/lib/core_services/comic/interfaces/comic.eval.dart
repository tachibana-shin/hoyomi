// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [Comic]
class $Comic implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
        'Comic.',
        $Comic.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
        'Comic.fromJson',
        $Comic.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
        'Comic.fromMeta',
        $Comic.$fromMeta);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
        'Comic.createFakeData',
        $Comic.$createFakeData);
  }

  /// Compile-time type specification of [$Comic]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
    'Comic',
  );

  /// Compile-time type declaration of [$Comic]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Comic]
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
              'comicId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'originalName',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'image',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/shared/o_image.dart',
                  'OImage'))),
              false,
            ),
            BridgeParameter(
              'lastChap',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
                      'ComicChapter')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'lastUpdate',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'notice',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'pending',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'preRelease',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'rate',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.double),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'description',
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
      'fromMeta': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'comic',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
                  'MetaComic'))),
              false,
            ),
          ],
          params: [
            BridgeParameter(
              'comicId',
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
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [Comic.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Comic.wrap(
      Comic(
          name: args[0]!.$value,
          comicId: args[1]!.$value,
          originalName: args[2]?.$value,
          image: args[3]!.$value,
          lastChap: args[4]?.$value,
          lastUpdate: args[5]?.$value,
          notice: args[6]?.$value,
          pending: args[7]?.$value,
          preRelease: args[8]?.$value,
          rate: args[9]?.$value,
          description: args[10]?.$value),
    );
  }

  /// Wrapper for the [Comic.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Comic.wrap(
      Comic.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [Comic.fromMeta] constructor
  static $Value? $fromMeta(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Comic.wrap(
      Comic.fromMeta(args[0]!.$value, comic: args[1]!.$value),
    );
  }

  /// Wrapper for the [Comic.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Comic.wrap(
      Comic.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final Comic $value;

  @override
  Comic get $reified => $value;

  /// Wrap a [Comic] in a [$Comic]
  $Comic.wrap(this.$value) : _superclass = $Object($value);

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
