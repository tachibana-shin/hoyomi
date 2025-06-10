// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'meta_comic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [MetaComic]
class $MetaComic implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
        'MetaComic.',
        $MetaComic.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
        'MetaComic.fromJson',
        $MetaComic.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
        'MetaComic.createFakeData',
        $MetaComic.$createFakeData);
  }

  /// Compile-time type specification of [$MetaComic]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
    'MetaComic',
  );

  /// Compile-time type declaration of [$MetaComic]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$MetaComic]
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
              'author',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'translator',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'status',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/shared/status_enum.dart',
                  'StatusEnum'))),
              false,
            ),
            BridgeParameter(
              'views',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'likes',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'rate',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/comic/interfaces/rate_value.dart',
                      'RateValue')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'genres',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'description',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'chapters',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'lastModified',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
              false,
            ),
            BridgeParameter(
              'fake',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'offlineMode',
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

  /// Wrapper for the [MetaComic.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaComic.wrap(
      MetaComic(
          name: args[0]!.$value,
          originalName: args[1]?.$value,
          image: args[2]!.$value,
          author: args[3]?.$value,
          translator: args[4]?.$value,
          status: args[5]!.$value,
          views: args[6]?.$value,
          likes: args[7]?.$value,
          rate: args[8]?.$value,
          genres: (args[9]!.$reified as List).cast(),
          description: args[10]!.$value,
          chapters: (args[11]!.$reified as List).cast(),
          lastModified: args[12]!.$value,
          fake: args[13]?.$value ?? false,
          offlineMode: args[14]?.$value ?? false),
    );
  }

  /// Wrapper for the [MetaComic.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaComic.wrap(
      MetaComic.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [MetaComic.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaComic.wrap(
      MetaComic.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final MetaComic $value;

  @override
  MetaComic get $reified => $value;

  /// Wrap a [MetaComic] in a [$MetaComic]
  $MetaComic.wrap(this.$value) : _superclass = $Object($value);

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
