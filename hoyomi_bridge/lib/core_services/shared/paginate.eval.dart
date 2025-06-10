// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'paginate.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [Paginate]
class $Paginate implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/paginate.dart',
        'Paginate.',
        $Paginate.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/paginate.dart',
        'Paginate.createFakeData',
        $Paginate.$createFakeData);
  }

  /// Compile-time type specification of [$Paginate]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/paginate.dart',
    'Paginate',
  );

  /// Compile-time type declaration of [$Paginate]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Paginate]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
      generics: {'T': BridgeGenericParam()},
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
          params: [
            BridgeParameter(
              'item',
              BridgeTypeAnnotation(BridgeTypeRef.ref('T')),
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
    fields: {
      'items': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: false,
      ),
      'page': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
        isStatic: false,
      ),
      'totalItems': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
        isStatic: false,
      ),
      'totalPages': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [Paginate.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Paginate.wrap(
      Paginate(
          items: (args[0]!.$reified as List).cast(),
          page: args[1]!.$value,
          totalItems: args[2]!.$value,
          totalPages: args[3]!.$value),
    );
  }

  /// Wrapper for the [Paginate.createFakeData] constructor
  static $Value? $createFakeData(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Paginate.wrap(
      Paginate.createFakeData(args[0]!.$value),
    );
  }

  final $Instance _superclass;

  @override
  final Paginate $value;

  @override
  Paginate get $reified => $value;

  /// Wrap a [Paginate] in a [$Paginate]
  $Paginate.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'items':
        final _items = $value.items;
        return $List.view(_items, (e) => runtime.wrapAlways(e));

      case 'page':
        final _page = $value.page;
        return $int(_page);

      case 'totalItems':
        final _totalItems = $value.totalItems;
        return $int(_totalItems);

      case 'totalPages':
        final _totalPages = $value.totalPages;
        return $int(_totalPages);
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
