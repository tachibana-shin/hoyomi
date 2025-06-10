// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [ComicHistory]
class $ComicHistory implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_history.dart',
        'ComicHistory.',
        $ComicHistory.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_history.dart',
        'ComicHistory.createFakeData',
        $ComicHistory.$createFakeData);
  }

  /// Compile-time type specification of [$ComicHistory]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_history.dart',
    'ComicHistory',
  );

  /// Compile-time type declaration of [$ComicHistory]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicHistory]
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
              'sourceId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'item',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
                  'Comic'))),
              false,
            ),
            BridgeParameter(
              'watchUpdatedAt',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
              false,
            ),
            BridgeParameter(
              'lastChapter',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
                  'ComicChapter'))),
              false,
            ),
            BridgeParameter(
              'watchPage',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/watch_page.dart',
                  'WatchPage'))),
              false,
            ),
          ],
          params: [],
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

  /// Wrapper for the [ComicHistory.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicHistory.wrap(
      ComicHistory(
          sourceId: args[0]!.$value,
          item: args[1]!.$value,
          watchUpdatedAt: args[2]!.$value,
          lastChapter: args[3]!.$value,
          watchPage: args[4]!.$value),
    );
  }

  /// Wrapper for the [ComicHistory.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicHistory.wrap(
      ComicHistory.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final ComicHistory $value;

  @override
  ComicHistory get $reified => $value;

  /// Wrap a [ComicHistory] in a [$ComicHistory]
  $ComicHistory.wrap(this.$value) : _superclass = $Object($value);

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
