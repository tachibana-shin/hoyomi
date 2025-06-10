// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_comments.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:dart_eval/dart_eval_extensions.dart';

/// dart_eval wrapper binding for [ComicComments]
class $ComicComments implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/comic/interfaces/comic_comments.dart',
      'ComicComments.',
      $ComicComments.$new,
    );

    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/comic/interfaces/comic_comments.dart',
      'ComicComments.createFakeData',
      $ComicComments.$createFakeData,
    );
  }

  /// Compile-time type specification of [$ComicComments]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_comments.dart',
    'ComicComments',
  );

  /// Compile-time type declaration of [$ComicComments]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicComments]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
      $extends: BridgeTypeRef(
        BridgeTypeSpec(
          'package:hoyomi_bridge/core_services/shared/paginate.dart',
          'Paginate',
        ),
      ),
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
              'page',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
            BridgeParameter(
              'totalItems',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
            BridgeParameter(
              'totalPages',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
          ],
          params: [],
        ),
        isFactory: false,
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

  /// Wrapper for the [ComicComments.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicComments.wrap(
      ComicComments(
        items: (args[0]!.$reified as List).cast(),
        page: args[1]!.$value,
        totalItems: args[2]!.$value,
        totalPages: args[3]!.$value,
      ),
    );
  }

  /// Wrapper for the [ComicComments.createFakeData] constructor
  static $Value? $createFakeData(
    Runtime runtime,
    $Value? thisValue,
    List<$Value?> args,
  ) {
    return $ComicComments.wrap(ComicComments.createFakeData());
  }

  final $Instance _superclass;

  @override
  final ComicComments $value;

  @override
  ComicComments get $reified => $value;

  /// Wrap a [ComicComments] in a [$ComicComments]
  $ComicComments.wrap(this.$value) : _superclass = $Object($value);

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
