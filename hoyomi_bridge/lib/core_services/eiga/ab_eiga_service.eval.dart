// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'ab_eiga_service.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:hoyomi_bridge/core_services/service.eval.dart';
import 'package:dart_eval/stdlib/async.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_home.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_param.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episodes.eval.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/server_source.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/source_video.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/source_content.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/subtitle.eval.dart';
import 'package:hoyomi_bridge/core_services/shared/vtt.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/opening_ending.eval.dart';
import 'package:hoyomi_bridge/core_services/eiga/interfaces/eiga.eval.dart';

/// dart_eval wrapper binding for [ABEigaService]
class $ABEigaService implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {}

  /// Compile-time type specification of [$ABEigaService]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/eiga/ab_eiga_service.dart',
    'ABEigaService',
  );

  /// Compile-time type declaration of [$ABEigaService]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ABEigaService]
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
      'parseURL': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_param.dart',
              'EigaParam'))),
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
      'getDetails': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'getEpisodes': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'getServers': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'episode',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                  'EigaEpisode'))),
              false,
            ),
          ],
          params: [],
        ),
      ),
      'getSource': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'episode',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                  'EigaEpisode'))),
              false,
            ),
            BridgeParameter(
              'server',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/eiga/interfaces/server_source.dart',
                      'ServerSource')),
                  nullable: true),
              true,
            ),
          ],
          params: [],
        ),
      ),
      'fetchSourceContent': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'source',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/source_video.dart',
                  'SourceVideo'))),
              false,
            ),
          ],
          params: [],
        ),
      ),
      'getSubtitles': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'episode',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_episode.dart',
                  'EigaEpisode'))),
              false,
            ),
            BridgeParameter(
              'source',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/source_video.dart',
                  'SourceVideo'))),
              false,
            ),
          ],
          params: [],
        ),
      ),
      'getSeekThumbnail': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'context',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_source_context.dart',
                  'EigaSourceContext'))),
              false,
            ),
          ],
        ),
      ),
      'getOpeningEnding': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [
            BridgeParameter(
              'context',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/eiga_source_context.dart',
                  'EigaSourceContext'))),
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
              'metaEiga',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/eiga/interfaces/meta_eiga.dart',
                  'MetaEiga'))),
              false,
            ),
            BridgeParameter(
              'eigaId',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'page',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int),
                  nullable: true),
              true,
            ),
          ],
          params: [],
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
    },
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  final $Instance _superclass;

  @override
  final ABEigaService $value;

  @override
  ABEigaService get $reified => $value;

  /// Wrap a [ABEigaService] in a [$ABEigaService]
  $ABEigaService.wrap(this.$value) : _superclass = $BaseService.wrap($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'home':
        return __home;

      case 'getCategory':
        return __getCategory;

      case 'parseURL':
        return __parseURL;

      case 'getDetails':
        return __getDetails;

      case 'getEpisodes':
        return __getEpisodes;

      case 'getServers':
        return __getServers;

      case 'getSource':
        return __getSource;

      case 'fetchSourceContent':
        return __fetchSourceContent;

      case 'getSubtitles':
        return __getSubtitles;

      case 'getSeekThumbnail':
        return __getSeekThumbnail;

      case 'getOpeningEnding':
        return __getOpeningEnding;

      case 'getSuggest':
        return __getSuggest;

      case 'search':
        return __search;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __home = $Function(_home);
  static $Value? _home(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.home();
    return $Future.wrap(result.then((e) => $EigaHome.wrap(e)));
  }

  static const $Function __getCategory = $Function(_getCategory);
  static $Value? _getCategory(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getCategory(
        categoryId: args[0]!.$value,
        page: args[1]!.$value,
        filters: (args[2]!.$reified as Map).cast());
    return $Future.wrap(result.then((e) => runtime.wrapAlways(e)));
  }

  static const $Function __parseURL = $Function(_parseURL);
  static $Value? _parseURL(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.parseURL(args[0]!.$value);
    return $EigaParam.wrap(result);
  }

  static const $Function __getDetails = $Function(_getDetails);
  static $Value? _getDetails(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getDetails(args[0]!.$value);
    return $Future.wrap(result.then((e) => $MetaEiga.wrap(e)));
  }

  static const $Function __getEpisodes = $Function(_getEpisodes);
  static $Value? _getEpisodes(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getEpisodes(args[0]!.$value);
    return $Future.wrap(result.then((e) => $EigaEpisodes.wrap(e)));
  }

  static const $Function __getServers = $Function(_getServers);
  static $Value? _getServers(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value
        .getServers(eigaId: args[0]!.$value, episode: args[1]!.$value);
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $ServerSource.wrap(e))));
  }

  static const $Function __getSource = $Function(_getSource);
  static $Value? _getSource(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getSource(
        eigaId: args[0]!.$value,
        episode: args[1]!.$value,
        server: args[2]?.$value);
    return $Future.wrap(result.then((e) => $SourceVideo.wrap(e)));
  }

  static const $Function __fetchSourceContent = $Function(_fetchSourceContent);
  static $Value? _fetchSourceContent(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.fetchSourceContent(source: args[0]!.$value);
    return $Future.wrap(result.then((e) => $SourceContent.wrap(e)));
  }

  static const $Function __getSubtitles = $Function(_getSubtitles);
  static $Value? _getSubtitles(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getSubtitles(
        eigaId: args[0]!.$value,
        episode: args[1]!.$value,
        source: args[2]!.$value);
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $Subtitle.wrap(e))));
  }

  static const $Function __getSeekThumbnail = $Function(_getSeekThumbnail);
  static $Value? _getSeekThumbnail(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getSeekThumbnail(args[0]!.$value);
    return $Future.wrap(result.then((e) => e == null ? $null() : $Vtt.wrap(e)));
  }

  static const $Function __getOpeningEnding = $Function(_getOpeningEnding);
  static $Value? _getOpeningEnding(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getOpeningEnding(args[0]!.$value);
    return $Future
        .wrap(result.then((e) => e == null ? $null() : $OpeningEnding.wrap(e)));
  }

  static const $Function __getSuggest = $Function(_getSuggest);
  static $Value? _getSuggest(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.getSuggest(
        metaEiga: args[0]!.$value,
        eigaId: args[1]!.$value,
        page: args[2]?.$value);
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $Eiga.wrap(e))));
  }

  static const $Function __search = $Function(_search);
  static $Value? _search(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ABEigaService;
    final result = self.$value.search(
        keyword: args[0]!.$value,
        page: args[1]!.$value,
        filters: (args[2]!.$reified as Map).cast(),
        quick: args[3]!.$value);
    return $Future.wrap(result.then((e) => runtime.wrapAlways(e)));
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
