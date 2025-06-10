// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'eiga_category.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/shared/filter.dart';

/// dart_eval wrapper binding for [EigaCategory]
class $EigaCategory implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_category.dart',
      'EigaCategory.',
      $EigaCategory.$new,
    );

    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_category.dart',
      'EigaCategory.createFakeData',
      $EigaCategory.$createFakeData,
    );
  }

  /// Compile-time type specification of [$EigaCategory]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_category.dart',
    'EigaCategory',
  );

  /// Compile-time type declaration of [$EigaCategory]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$EigaCategory]
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
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'url',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'description',
              BridgeTypeAnnotation(
                BridgeTypeRef(CoreTypes.string),
                nullable: true,
              ),
              true,
            ),
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
            BridgeParameter(
              'filters',
              BridgeTypeAnnotation(
                BridgeTypeRef(CoreTypes.list),
                nullable: true,
              ),
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
      'name': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'url': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'description': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string), nullable: true),
        isStatic: false,
      ),
      'filters': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list), nullable: true),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [EigaCategory.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $EigaCategory.wrap(
      EigaCategory(
        name: args[0]!.$value,
        url: args[1]!.$value,
        description: args[2]?.$value,
        items: (args[3]!.$reified as List).cast(),
        page: args[4]!.$value,
        totalItems: args[5]!.$value,
        totalPages: args[6]!.$value,
        filters: (args[7]?.$reified as List?)?.cast(),
      ),
    );
  }

  /// Wrapper for the [EigaCategory.createFakeData] constructor
  static $Value? $createFakeData(
    Runtime runtime,
    $Value? thisValue,
    List<$Value?> args,
  ) {
    return $EigaCategory.wrap(EigaCategory.createFakeData());
  }

  final $Instance _superclass;

  @override
  final EigaCategory $value;

  @override
  EigaCategory get $reified => $value;

  /// Wrap a [EigaCategory] in a [$EigaCategory]
  $EigaCategory.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'name':
        final _name = $value.name;
        return $String(_name);

      case 'url':
        final _url = $value.url;
        return $String(_url);

      case 'description':
        final _description = $value.description;
        return _description == null ? $null() : $String(_description);

      case 'filters':
        final _filters = $value.filters;
        return _filters == null
            ? $null()
            : $List.view(_filters, (e) => $Filter.wrap(e));
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
