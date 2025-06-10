// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_follow.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/dart_eval_extensions.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart';

/// dart_eval wrapper binding for [ComicFollow]
class $ComicFollow implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_follow.dart',
        'ComicFollow.',
        $ComicFollow.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/comic/interfaces/comic_follow.dart',
        'ComicFollow.createFakeData',
        $ComicFollow.$createFakeData);
  }

  /// Compile-time type specification of [$ComicFollow]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_follow.dart',
    'ComicFollow',
  );

  /// Compile-time type declaration of [$ComicFollow]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicFollow]
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
              'updatedAt',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'lastChapter',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
                      'ComicChapter')),
                  nullable: true),
              true,
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
    fields: {
      'sourceId': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'item': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
            'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart',
            'Comic'))),
        isStatic: false,
      ),
      'updatedAt': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime), nullable: true),
        isStatic: false,
      ),
      'lastChapter': BridgeFieldDef(
        BridgeTypeAnnotation(
            BridgeTypeRef(BridgeTypeSpec(
                'package:hoyomi_bridge/core_services/comic/interfaces/comic_chapter.dart',
                'ComicChapter')),
            nullable: true),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [ComicFollow.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicFollow.wrap(
      ComicFollow(
          sourceId: args[0]!.$value,
          item: args[1]!.$value,
          updatedAt: args[2]?.$value,
          lastChapter: args[3]?.$value),
    );
  }

  /// Wrapper for the [ComicFollow.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicFollow.wrap(
      ComicFollow.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final ComicFollow $value;

  @override
  ComicFollow get $reified => $value;

  /// Wrap a [ComicFollow] in a [$ComicFollow]
  $ComicFollow.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'sourceId':
        final _sourceId = $value.sourceId;
        return $String(_sourceId);

      case 'item':
        final _item = $value.item;
        return $Comic.wrap(_item);

      case 'updatedAt':
        final _updatedAt = $value.updatedAt;
        return _updatedAt == null ? $null() : $DateTime.wrap(_updatedAt);

      case 'lastChapter':
        final _lastChapter = $value.lastChapter;
        return _lastChapter == null
            ? $null()
            : $ComicChapter.wrap(_lastChapter);
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
