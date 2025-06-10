// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'service.dart';
import 'dart:async';
import 'package:hoyomi_bridge/export.dart';
import 'bridger.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/shared/o_image.dart';
import 'package:hoyomi_bridge/core_services/shared/setting/setting_field.dart';
import 'package:hoyomi_bridge/core_services/shared/web_rule.dart';
import 'package:dart_eval/stdlib/async.dart';
import 'package:hoyomi_bridge/core_services/shared/setting/field_input.dart';
import 'package:hoyomi_bridge/core_services/bridger.dart';
import 'package:hoyomi_bridge/utils/d_query.dart';

/// dart_eval wrapper binding for [ServiceInit]
class $ServiceInit implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {}

  /// Compile-time type specification of [$ServiceInit]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/service.dart',
    'ServiceInit',
  );

  /// Compile-time type declaration of [$ServiceInit]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ServiceInit]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: true,
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
              'uid',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'rootUrl',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'faviconUrl',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:hoyomi_bridge/core_services/shared/o_image.dart',
                  'OImage'))),
              false,
            ),
            BridgeParameter(
              'captchaUrl',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                    returns:
                        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
                    params: [],
                    namedParams: [],
                  )),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'settings',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'onBeforeInsertCookie',
              BridgeTypeAnnotation(
                  BridgeTypeRef.genericFunction(BridgeFunctionDef(
                    returns: BridgeTypeAnnotation(
                        BridgeTypeRef(CoreTypes.string),
                        nullable: true),
                    params: [
                      BridgeParameter(
                        'oldCookie',
                        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                            nullable: true),
                        false,
                      ),
                    ],
                    namedParams: [],
                  )),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'webRules',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'fetchHeadless',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'fetchBaseUrl',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
          ],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'dynamicWebRules': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    getters: {},
    setters: {},
    fields: {
      'name': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'uid': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string), nullable: true),
        isStatic: false,
      ),
      'faviconUrl': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
            'package:hoyomi_bridge/core_services/shared/o_image.dart',
            'OImage'))),
        isStatic: false,
      ),
      'rootUrl': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'captchaUrl': BridgeFieldDef(
        BridgeTypeAnnotation(
            BridgeTypeRef.genericFunction(BridgeFunctionDef(
              returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              params: [],
              namedParams: [],
            )),
            nullable: true),
        isStatic: false,
      ),
      'settings': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list), nullable: true),
        isStatic: false,
      ),
      'webRules': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list), nullable: true),
        isStatic: false,
      ),
      'fetchHeadless': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
        isStatic: false,
      ),
      'fetchBaseUrl': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string), nullable: true),
        isStatic: false,
      ),
      'onBeforeInsertCookie': BridgeFieldDef(
        BridgeTypeAnnotation(
            BridgeTypeRef.genericFunction(BridgeFunctionDef(
              returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              params: [
                BridgeParameter(
                  'oldCookie',
                  BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                      nullable: true),
                  false,
                ),
              ],
              namedParams: [],
            )),
            nullable: true),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  final $Instance _superclass;

  @override
  final ServiceInit $value;

  @override
  ServiceInit get $reified => $value;

  /// Wrap a [ServiceInit] in a [$ServiceInit]
  $ServiceInit.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'name':
        final _name = $value.name;
        return $String(_name);

      case 'uid':
        final _uid = $value.uid;
        return _uid == null ? $null() : $String(_uid);

      case 'faviconUrl':
        final _faviconUrl = $value.faviconUrl;
        return $OImage.wrap(_faviconUrl);

      case 'rootUrl':
        final _rootUrl = $value.rootUrl;
        return $String(_rootUrl);

      case 'captchaUrl':
        final _captchaUrl = $value.captchaUrl;
        return _captchaUrl == null
            ? $null()
            : $Function((runtime, target, args) {
                final funcResult = _captchaUrl();
                return $String(funcResult);
              });

      case 'settings':
        final _settings = $value.settings;
        return _settings == null
            ? $null()
            : $List.view(_settings, (e) => $SettingField.wrap(e));

      case 'webRules':
        final _webRules = $value.webRules;
        return _webRules == null
            ? $null()
            : $List.view(_webRules, (e) => $WebRule.wrap(e));

      case 'fetchHeadless':
        final _fetchHeadless = $value.fetchHeadless;
        return $bool(_fetchHeadless);

      case 'fetchBaseUrl':
        final _fetchBaseUrl = $value.fetchBaseUrl;
        return _fetchBaseUrl == null ? $null() : $String(_fetchBaseUrl);

      case 'onBeforeInsertCookie':
        final _onBeforeInsertCookie = $value.onBeforeInsertCookie;
        return _onBeforeInsertCookie == null
            ? $null()
            : $Function((runtime, target, args) {
                final funcResult = _onBeforeInsertCookie(args[0]?.$value);
                return funcResult == null ? $null() : $String(funcResult);
              });
      case 'dynamicWebRules':
        return __dynamicWebRules;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __dynamicWebRules = $Function(_dynamicWebRules);
  static $Value? _dynamicWebRules(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ServiceInit;
    final result = self.$value.dynamicWebRules();
    return $Future
        .wrap(result.then((e) => $List.view(e, (e) => $WebRule.wrap(e))));
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}

/// dart_eval wrapper binding for [BaseService]
class $BaseService implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/service.dart',
        'BaseService.settingsDefault*g',
        $BaseService.$settingsDefault);
  }

  /// Compile-time type specification of [$BaseService]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/service.dart',
    'BaseService',
  );

  /// Compile-time type declaration of [$BaseService]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$BaseService]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: true,
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
      'fetch': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'cookie',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'query',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
                      'UrlSearchParams')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'body',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'headers',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/headers.dart',
                      'Headers')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'notify',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'headless',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'cache',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'url',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'parseQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/d_query.dart', 'DQuery'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'html',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'fetchQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.future)),
          namedParams: [
            BridgeParameter(
              'cookie',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'query',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/url_search_params.dart',
                      'UrlSearchParams')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'body',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'headers',
              BridgeTypeAnnotation(
                  BridgeTypeRef(BridgeTypeSpec(
                      'package:hoyomi_bridge/core_services/shared/headers.dart',
                      'Headers')),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'headless',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
            BridgeParameter(
              'cache',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
          params: [
            BridgeParameter(
              'url',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
    },
    getters: {
      'init': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/core_services/service.dart',
              'ServiceInit'))),
          namedParams: [],
          params: [],
        ),
      ),
      'uid': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'name': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      '_bridger': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/core_services/bridger.dart', 'Bridger'))),
          namedParams: [],
          params: [],
        ),
      ),
      'baseUrl': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    setters: {},
    fields: {
      'settingsDefault': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: true,
      ),
      'bridger': BridgeFieldDef(
        BridgeTypeAnnotation(
            BridgeTypeRef(BridgeTypeSpec(
                'package:hoyomi_bridge/core_services/bridger.dart', 'Bridger')),
            nullable: true),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [BaseService.settingsDefault] getter
  static $Value? $settingsDefault(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final value = BaseService.settingsDefault;
    return $List.view(value, (e) => $FieldInput.wrap(e));
  }

  final $Instance _superclass;

  @override
  final BaseService $value;

  @override
  BaseService get $reified => $value;

  /// Wrap a [BaseService] in a [$BaseService]
  $BaseService.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'bridger':
        final _bridger = $value.bridger;
        return _bridger == null ? $null() : $Bridger.wrap(_bridger);

      case 'init':
        final _init = $value.init;
        return $ServiceInit.wrap(_init);

      case 'uid':
        final _uid = $value.uid;
        return $String(_uid);

      case 'name':
        final _name = $value.name;
        return $String(_name);

      case 'baseUrl':
        final _baseUrl = $value.baseUrl;
        return $String(_baseUrl);
      case 'fetch':
        return __fetch;

      case 'parseQ':
        return __parseQ;

      case 'fetchQ':
        return __fetchQ;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __fetch = $Function(_fetch);
  static $Value? _fetch(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $BaseService;
    final result = self.$value.fetch(args[0]!.$value,
        cookie: args[1]?.$value,
        query: args[2]?.$value,
        body: (args[3]?.$reified as Map?)?.cast(),
        headers: args[4]?.$value,
        notify: args[5]?.$value ?? true,
        headless: args[6]?.$value ?? false,
        cache: args[7]?.$value ?? true);
    return $Future.wrap(result.then((e) => $String(e)));
  }

  static const $Function __parseQ = $Function(_parseQ);
  static $Value? _parseQ(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $BaseService;
    final result = self.$value.parseQ(args[0]!.$value);
    return $DQuery.wrap(result);
  }

  static const $Function __fetchQ = $Function(_fetchQ);
  static $Value? _fetchQ(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $BaseService;
    final result = self.$value.fetchQ(args[0]!.$value,
        cookie: args[1]?.$value,
        query: args[2]?.$value,
        body: (args[3]?.$reified as Map?)?.cast(),
        headers: args[4]?.$value,
        headless: args[5]?.$value ?? false,
        cache: args[6]?.$value ?? true);
    return $Future.wrap(result.then((e) => $DQuery.wrap(e)));
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    switch (identifier) {
      case 'bridger':
        $value.bridger = value.$value;
        return;
    }
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
