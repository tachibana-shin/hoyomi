// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_follow.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart';

/// dart_eval wrapper binding for [EigaFollow]
class $EigaFollow implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_follow.dart',
        'EigaFollow.',
        $EigaFollow.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_follow.dart',
        'EigaFollow.createFakeData',
        $EigaFollow.$createFakeData);
  }

  /// Compile-time type specification of [$EigaFollow]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_follow.dart',
    'EigaFollow',
  );

  /// Compile-time type declaration of [$EigaFollow]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaFollow]
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
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga.dart',
                  'Eiga'))),
              false,
            ),
            BridgeParameter(
              'updatedAt',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'lastEpisode',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                      'EigaEpisode')),
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
            'package:hoyomi_bridge/core_services/eiga/interfaces/eiga.dart',
            'Eiga'))),
        isStatic: false,
      ),
      'updatedAt': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime), nullable: true),
        isStatic: false,
      ),
      'lastEpisode': BridgeFieldDef(
        BridgeTypeAnnotation(
            BridgeTypeRef(BridgeTypeSpec(
                'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                'EigaEpisode')),
            nullable: true),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [EigaFollow.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaFollow.wrap(
      EigaFollow(
          sourceId: args[0]!.$value,
          item: args[1]!.$value,
          updatedAt: args[2]?.$value,
          lastEpisode: args[3]?.$value),
    );
  }

  /// Wrapper for the [EigaFollow.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaFollow.wrap(
      EigaFollow.createFakeData(),
    );
  }

  final $Instance _superclass;

  @override
  final EigaFollow $value;

  @override
  EigaFollow get $reified => $value;

  /// Wrap a [EigaFollow] in a [$EigaFollow]
  $EigaFollow.wrap(this.$value) : _superclass = $Object($value);

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
        return $Eiga.wrap(_item);

      case 'updatedAt':
        final _updatedAt = $value.updatedAt;
        return _updatedAt == null ? $null() : $DateTime.wrap(_updatedAt);

      case 'lastEpisode':
        final _lastEpisode = $value.lastEpisode;
        return _lastEpisode == null ? $null() : $EigaEpisode.wrap(_lastEpisode);
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
