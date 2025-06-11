// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'd_query.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:hoyomi_bridge/utils/d_query.eval.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [DQuery]
class $DQuery implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/utils/d_query.dart', 'DQuery.', $DQuery.$new);

    runtime.registerBridgeFunc('package:hoyomi_bridge/utils/d_query.dart',
        'DQuery.fromHtml', $DQuery.$fromHtml);

    runtime.registerBridgeFunc('package:hoyomi_bridge/utils/d_query.dart',
        'DQuery.fromDocument', $DQuery.$fromDocument);
  }

  /// Compile-time type specification of [$DQuery]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/utils/d_query.dart',
    'DQuery',
  );

  /// Compile-time type declaration of [$DQuery]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$DQuery]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              '_elements',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
          ],
        ),
        isFactory: false,
      ),
      'fromHtml': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'html',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
        isFactory: true,
      ),
    },
    methods: {
      'fromDocument': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(
              BridgeTypeRef.genericFunction(BridgeFunctionDef(
            returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
            params: [
              BridgeParameter(
                'selector',
                BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
                false,
              ),
            ],
            namedParams: [
              BridgeParameter(
                'single',
                BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
                true,
              ),
            ],
          ))),
          namedParams: [],
          params: [
            BridgeParameter(
              'document',
              BridgeTypeAnnotation(BridgeTypeRef(
                  BridgeTypeSpec('package:html/dom.dart', 'Document'))),
              false,
            ),
          ],
        ),
        isStatic: true,
      ),
      'attr': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [
            BridgeParameter(
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'attrRaw': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'prop': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'data': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [
            BridgeParameter(
              'name',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'val': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'html': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'text': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'textRaw': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
              nullable: true),
          namedParams: [],
          params: [],
        ),
      ),
      'className': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'parent': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'prev': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'next': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'first': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'last': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'eq': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'index',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
          ],
        ),
      ),
      'q': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [
            BridgeParameter(
              'single',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'selector',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'query': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [
            BridgeParameter(
              'single',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'selector',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'queryOne': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'selector',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'where': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'condition',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
                params: [
                  BridgeParameter(
                    'el',
                    BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                        'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
                    false,
                  ),
                ],
                namedParams: [],
              ))),
              false,
            ),
          ],
        ),
      ),
      'findOne': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'condition',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
                params: [
                  BridgeParameter(
                    'el',
                    BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                        'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
                    false,
                  ),
                ],
                namedParams: [],
              ))),
              false,
            ),
          ],
        ),
      ),
      'skip': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'count',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
          ],
        ),
      ),
      'take': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'count',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
          ],
        ),
      ),
      'reversed': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [],
        ),
      ),
      'contains': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'text',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'containsOne': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'text',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'each': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.voidType)),
          namedParams: [],
          params: [
            BridgeParameter(
              'callback',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                returns:
                    BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.voidType)),
                params: [
                  BridgeParameter(
                    'el',
                    BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                        'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
                    false,
                  ),
                ],
                namedParams: [],
              ))),
              false,
            ),
          ],
        ),
      ),
      'map': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
          namedParams: [],
          params: [
            BridgeParameter(
              'transform',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                returns: BridgeTypeAnnotation(BridgeTypeRef.ref('T')),
                params: [
                  BridgeParameter(
                    'el',
                    BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                        'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
                    false,
                  ),
                ],
                namedParams: [],
              ))),
              false,
            ),
          ],
        ),
      ),
      'toList': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
          namedParams: [],
          params: [],
        ),
      ),
      'get': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(
              BridgeTypeSpec('package:html/dom.dart', 'Element'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'index',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
          ],
        ),
      ),
      'nextAll': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'selector',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
          ],
        ),
      ),
      'prevAll': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'selector',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
          ],
        ),
      ),
      'children': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'index',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
          ],
        ),
      ),
    },
    getters: {
      'isEmpty': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'isNotEmpty': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'length': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    setters: {},
    fields: {
      '_elements': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [DQuery.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $DQuery.wrap(
      DQuery((args[0]!.$reified as List).cast()),
    );
  }

  /// Wrapper for the [DQuery.fromHtml] constructor
  static $Value? $fromHtml(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $DQuery.wrap(
      DQuery.fromHtml(args[0]!.$value),
    );
  }

  /// Wrapper for the [DQuery.fromDocument] method
  static $Value? $fromDocument(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = DQuery.fromDocument(args[0]!.$value);
    return $Function((runtime, target, args) {
      final funcResult = value(args[0]!.$value, single: args[1]!.$value);
      return $DQuery.wrap(funcResult);
    });
  }

  final $Instance _superclass;

  @override
  final DQuery $value;

  @override
  DQuery get $reified => $value;

  /// Wrap a [DQuery] in a [$DQuery]
  $DQuery.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'isEmpty':
        final _isEmpty = $value.isEmpty;
        return $bool(_isEmpty);

      case 'isNotEmpty':
        final _isNotEmpty = $value.isNotEmpty;
        return $bool(_isNotEmpty);

      case 'length':
        final _length = $value.length;
        return $int(_length);
      case 'attr':
        return __attr;

      case 'attrRaw':
        return __attrRaw;

      case 'prop':
        return __prop;

      case 'data':
        return __data;

      case 'val':
        return __val;

      case 'html':
        return __html;

      case 'text':
        return __text;

      case 'textRaw':
        return __textRaw;

      case 'className':
        return __className;

      case 'parent':
        return __parent;

      case 'prev':
        return __prev;

      case 'next':
        return __next;

      case 'first':
        return __first;

      case 'last':
        return __last;

      case 'eq':
        return __eq;

      case 'q':
        return __q;

      case 'query':
        return __query;

      case 'queryOne':
        return __queryOne;

      case 'where':
        return __where;

      case 'findOne':
        return __findOne;

      case 'skip':
        return __skip;

      case 'take':
        return __take;

      case 'reversed':
        return __reversed;

      case 'contains':
        return __contains;

      case 'containsOne':
        return __containsOne;

      case 'each':
        return __each;

      case 'map':
        return __map;

      case 'toList':
        return __toList;

      case 'get':
        return __get;

      case 'nextAll':
        return __nextAll;

      case 'prevAll':
        return __prevAll;

      case 'children':
        return __children;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __attr = $Function(_attr);
  static $Value? _attr(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.attr(args[0]!.$value);
    return $String(result);
  }

  static const $Function __attrRaw = $Function(_attrRaw);
  static $Value? _attrRaw(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.attrRaw(args[0]!.$value);
    return result == null ? $null() : $String(result);
  }

  static const $Function __prop = $Function(_prop);
  static $Value? _prop(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.prop(args[0]!.$value);
    return result == null ? $null() : $String(result);
  }

  static const $Function __data = $Function(_data);
  static $Value? _data(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.data(args[0]!.$value);
    return $String(result);
  }

  static const $Function __val = $Function(_val);
  static $Value? _val(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.val();
    return $String(result);
  }

  static const $Function __html = $Function(_html);
  static $Value? _html(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.html();
    return $String(result);
  }

  static const $Function __text = $Function(_text);
  static $Value? _text(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.text();
    return $String(result);
  }

  static const $Function __textRaw = $Function(_textRaw);
  static $Value? _textRaw(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.textRaw();
    return result == null ? $null() : $String(result);
  }

  static const $Function __className = $Function(_className);
  static $Value? _className(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.className();
    return $String(result);
  }

  static const $Function __parent = $Function(_parent);
  static $Value? _parent(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.parent();
    return $DQuery.wrap(result);
  }

  static const $Function __prev = $Function(_prev);
  static $Value? _prev(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.prev();
    return $DQuery.wrap(result);
  }

  static const $Function __next = $Function(_next);
  static $Value? _next(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.next();
    return $DQuery.wrap(result);
  }

  static const $Function __first = $Function(_first);
  static $Value? _first(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.first();
    return $DQuery.wrap(result);
  }

  static const $Function __last = $Function(_last);
  static $Value? _last(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.last();
    return $DQuery.wrap(result);
  }

  static const $Function __eq = $Function(_eq);
  static $Value? _eq(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.eq(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __q = $Function(_q);
  static $Value? _q(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result =
        self.$value.q(args[0]!.$value, single: args[1]?.$value ?? false);
    return $DQuery.wrap(result);
  }

  static const $Function __query = $Function(_query);
  static $Value? _query(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result =
        self.$value.query(args[0]!.$value, single: args[1]?.$value ?? false);
    return $DQuery.wrap(result);
  }

  static const $Function __queryOne = $Function(_queryOne);
  static $Value? _queryOne(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.queryOne(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __where = $Function(_where);
  static $Value? _where(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.where((el) {
      return (args[0] as EvalCallable)(runtime, null, [$DQuery.wrap(el)])
          ?.$value;
    });
    return $DQuery.wrap(result);
  }

  static const $Function __findOne = $Function(_findOne);
  static $Value? _findOne(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.findOne((el) {
      return (args[0] as EvalCallable)(runtime, null, [$DQuery.wrap(el)])
          ?.$value;
    });
    return $DQuery.wrap(result);
  }

  static const $Function __skip = $Function(_skip);
  static $Value? _skip(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.skip(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __take = $Function(_take);
  static $Value? _take(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.take(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __reversed = $Function(_reversed);
  static $Value? _reversed(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.reversed();
    return $DQuery.wrap(result);
  }

  static const $Function __contains = $Function(_contains);
  static $Value? _contains(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.contains(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __containsOne = $Function(_containsOne);
  static $Value? _containsOne(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.containsOne(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __each = $Function(_each);
  static $Value? _each(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    self.$value.each((el) {
      return (args[0] as EvalCallable)(runtime, null, [$DQuery.wrap(el)])
          ?.$value;
    });
    return null;
  }

  static const $Function __map = $Function(_map);
  static $Value? _map(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.map((el) {
      return (args[0] as EvalCallable)(runtime, null, [$DQuery.wrap(el)])
          ?.$value;
    });
    return $List.view(result, (e) => runtime.wrapAlways(e));
  }

  static const $Function __toList = $Function(_toList);
  static $Value? _toList(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.toList();
    return $List.view(result, (e) => $DQuery.wrap(e));
  }

  static const $Function __get = $Function(_get);
  static $Value? _get(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.get(args[0]!.$value);
    return runtime.wrapAlways(result);
  }

  static const $Function __nextAll = $Function(_nextAll);
  static $Value? _nextAll(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.nextAll(args[0]?.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __prevAll = $Function(_prevAll);
  static $Value? _prevAll(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.prevAll(args[0]?.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __children = $Function(_children);
  static $Value? _children(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DQuery;
    final result = self.$value.children(args[0]?.$value);
    return $DQuery.wrap(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
