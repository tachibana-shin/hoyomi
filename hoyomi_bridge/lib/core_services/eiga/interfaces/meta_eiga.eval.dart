// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'meta_eiga.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [Season]
class $Season implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
        'Season.',
        $Season.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
        'Season.fromJson',
        $Season.$fromJson);
  }

  /// Compile-time type specification of [$Season]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
    'Season',
  );

  /// Compile-time type declaration of [$Season]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Season]
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
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
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
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [Season.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Season.wrap(
      Season(name: args[0]!.$value, eigaId: args[1]!.$value),
    );
  }

  /// Wrapper for the [Season.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Season.wrap(
      Season.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final Season $value;

  @override
  Season get $reified => $value;

  /// Wrap a [Season] in a [$Season]
  $Season.wrap(this.$value) : _superclass = $Object($value);

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

/// dart_eval wrapper binding for [MetaEiga]
class $MetaEiga implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
        'MetaEiga.',
        $MetaEiga.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
        'MetaEiga.fromJson',
        $MetaEiga.$fromJson);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
        'MetaEiga.createFakeData',
        $MetaEiga.$createFakeData);
  }

  /// Compile-time type specification of [$MetaEiga]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
    'MetaEiga',
  );

  /// Compile-time type declaration of [$MetaEiga]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$MetaEiga]
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
              'poster',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/o_image.dart',
                      'OImage')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'description',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'rate',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.double),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'countRate',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'countSub',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'countDub',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'duration',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'yearOf',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'views',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'seasons',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'genres',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'quality',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'authors',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'countries',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'language',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'studios',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list),
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
              'movieSeason',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/genre.dart',
                      'Genre')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'trailer',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'fake',
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

  /// Wrapper for the [MetaEiga.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaEiga.wrap(
      MetaEiga(
          name: args[0]!.$value,
          originalName: args[1]?.$value,
          image: args[2]!.$value,
          poster: args[3]?.$value,
          description: args[4]!.$value,
          rate: args[5]?.$value,
          countRate: args[6]?.$value,
          countSub: args[7]?.$value,
          countDub: args[8]?.$value,
          duration: args[9]?.$value,
          yearOf: args[10]?.$value,
          views: args[11]?.$value,
          seasons: (args[12]!.$reified as List).cast(),
          genres: (args[13]!.$reified as List).cast(),
          quality: args[14]?.$value,
          authors: (args[15]?.$reified as List?)?.cast(),
          countries: (args[16]?.$reified as List?)?.cast(),
          language: args[17]?.$value,
          studios: (args[18]?.$reified as List?)?.cast(),
          status: args[19]!.$value,
          movieSeason: args[20]?.$value,
          trailer: args[21]?.$value,
          fake: args[22]?.$value),
    );
  }

  /// Wrapper for the [MetaEiga.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaEiga.wrap(
      MetaEiga.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  /// Wrapper for the [MetaEiga.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $MetaEiga.wrap(
      MetaEiga.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final MetaEiga $value;

  @override
  MetaEiga get $reified => $value;

  /// Wrap a [MetaEiga] in a [$MetaEiga]
  $MetaEiga.wrap(this.$value) : _superclass = $Object($value);

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
