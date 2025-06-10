// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'comic_category.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/dart_eval_extensions.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/shared/filter.dart';

/// dart_eval wrapper binding for [ComicCategory]
class $ComicCategory implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/comic/interfaces/comic_category.dart',
      'ComicCategory.',
      $ComicCategory.$new,
    );

    runtime.registerBridgeFunc(
      'package:hoyomi_bridge/core_services/comic/interfaces/comic_category.dart',
      'ComicCategory.createFakeData',
      $ComicCategory.$createFakeData,
    );
  }

  /// Compile-time type specification of [$ComicCategory]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/interfaces/comic_category.dart',
    'ComicCategory',
  );

  /// Compile-time type declaration of [$ComicCategory]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ComicCategory]
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

  /// Wrapper for the [ComicCategory.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ComicCategory.wrap(
      ComicCategory(
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

  /// Wrapper for the [ComicCategory.createFakeData] constructor
  static $Value? $createFakeData(
    Runtime runtime,
    $Value? thisValue,
    List<$Value?> args,
  ) {
    return $ComicCategory.wrap(ComicCategory.createFakeData());
  }

  final $Instance _superclass;

  @override
  final ComicCategory $value;

  @override
  ComicCategory get $reified => $value;

  /// Wrap a [ComicCategory] in a [$ComicCategory]
  $ComicCategory.wrap(this.$value) : _superclass = $Object($value);

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
