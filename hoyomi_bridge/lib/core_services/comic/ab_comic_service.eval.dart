// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'ab_comic_service.dart';
import 'dart:typed_data';
import 'package:hoyomi_bridge/export.dart';
import 'package:hoyomi_bridge/core_services/service.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/comic_param.dart';
import 'package:dart_eval/stdlib/async.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/comic_home.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi_bridge/core_services/shared/o_image.dart';
import 'package:dart_eval/stdlib/typed_data.dart';
import 'package:hoyomi_bridge/core_services/comic/interfaces/comic.dart';

/// dart_eval wrapper binding for [ABComicService]
class $ABComicService implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {}

  /// Compile-time type specification of [$ABComicService]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/comic/ab_comic_service.dart',
    'ABComicService',
  );

  /// Compile-time type declaration of [$ABComicService]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ABComicService]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: true,
      $extends: BridgeTypeRef(BridgeTypeSpec(
          'package:hoyomi_bridge/core_services/service.dart', 'BaseService')),
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'getURL': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [
            BridgeParameter(
              'chapterId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'comicId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'parseURL': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/core_services/comic/interfaces/comic_param.dart',
              'ComicParam'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'url',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'home': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [],
        ),
      ),
      'getCategory': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'categoryId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'page',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
            BridgeParameter(
              'filters',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              false,
            ),
          ],
          params: [],
        ),
      ),
      'getDetails': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'comicId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'getPages': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'manga',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'chap',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'fetchPage': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'buffer',
              BridgeTypeAnnotation(BridgeTypeRef(TypedDataTypes.uint8List)),
              false,
            ),
            BridgeParameter(
              'source',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/shared/o_image.dart',
                  'OImage'))),
              false,
            ),
          ],
        ),
      ),
      'getSuggest': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'page',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'comic',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
                  'MetaComic'))),
              false,
            ),
          ],
        ),
      ),
      'search': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'keyword',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'page',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              false,
            ),
            BridgeParameter(
              'filters',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              false,
            ),
            BridgeParameter(
              'quick',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
          ],
          params: [],
        ),
      ),
      'getComicModes': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/core_services/comic/interfaces/comic_modes.dart',
              'ComicModes'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'comic',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/comic/interfaces/meta_comic.dart',
                  'MetaComic'))),
              false,
            ),
          ],
        ),
      ),
    },
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  final $Instance _superclass;

  @override
  final ABComicService $value;

  @override
  ABComicService get $reified => $value;

  /// Wrap a [ABComicService] in a [$ABComicService]
  $ABComicService.wrap(this.$value) : _superclass = $BaseService.wrap($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'getURL':
        return __getURL;

      case 'parseURL':
        return __parseURL;

      case 'home':
        return __home;

      case 'getCategory':
        return __getCategory;

      case 'getDetails':
        return __getDetails;

      case 'getPages':
        return __getPages;

      case 'fetchPage':
        return __fetchPage;

      case 'getSuggest':
        return __getSuggest;

      case 'search':
        return __search;

      case 'getComicModes':
        return __getComicModes;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __getURL = $Function(_getURL);
  static $Value? _getURL(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result =
        self.$value.getURL(args[0]!.$value, chapterId: args[1]?.$value);
    return $String(result);
  }

  static const $Function __parseURL = $Function(_parseURL);
  static $Value? _parseURL(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.parseURL(args[0]!.$value);
    return $ComicParam.wrap(result);
  }

  static const $Function __home = $Function(_home);
  static $Value? _home(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.home();
    return $Future.wrap(result.then((e) => $ComicHome.wrap(e)));
  }

  static const $Function __getCategory = $Function(_getCategory);
  static $Value? _getCategory(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.getCategory(
        categoryId: args[0]!.$value,
        page: args[1]!.$value,
        filters: (args[2]!.$reified as Map).cast());
    return $Future.wrap(result.then((e) => runtime.wrapAlways(e)));
  }

  static const $Function __getDetails = $Function(_getDetails);
  static $Value? _getDetails(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.getDetails(args[0]!.$value);
    return $Future.wrap(result.then((e) => $MetaComic.wrap(e)));
  }

  static const $Function __getPages = $Function(_getPages);
  static $Value? _getPages(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.getPages(args[0]!.$value, args[1]!.$value);
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $OImage.wrap(e))));
  }

  static const $Function __fetchPage = $Function(_fetchPage);
  static $Value? _fetchPage(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.fetchPage(args[0]!.$value, args[1]!.$value);
    return $Future.wrap(result.then((e) => $Uint8List.wrap(e)));
  }

  static const $Function __getSuggest = $Function(_getSuggest);
  static $Value? _getSuggest(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result =
        self.$value.getSuggest(args[0]!.$value, page: args[1]?.$value);
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $Comic.wrap(e))));
  }

  static const $Function __search = $Function(_search);
  static $Value? _search(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.search(
        keyword: args[0]!.$value,
        page: args[1]!.$value,
        filters: (args[2]!.$reified as Map).cast(),
        quick: args[3]!.$value);
    return $Future.wrap(result.then((e) => runtime.wrapAlways(e)));
  }

  static const $Function __getComicModes = $Function(_getComicModes);
  static $Value? _getComicModes(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABComicService;
    final result = self.$value.getComicModes(args[0]!.$value);
    return runtime.wrapAlways(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
