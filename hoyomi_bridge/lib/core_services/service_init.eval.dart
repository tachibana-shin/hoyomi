// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'service_init.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/core_services/shared/o_image.eval.dart';
import 'package:hoyomi_bridge/core_services/shared/setting/setting_field.eval.dart';
import 'package:hoyomi_bridge/core_services/shared/web_rule.eval.dart';
import 'package:dart_eval/stdlib/async.dart';

/// dart_eval wrapper binding for [ServiceInit]
class $ServiceInit implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/service_init.dart',
        'ServiceInit.',
        $ServiceInit.$new);
  }

  /// Compile-time type specification of [$ServiceInit]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/service_init.dart',
    'ServiceInit',
  );

  /// Compile-time type declaration of [$ServiceInit]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$ServiceInit]
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
      'toJson': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
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

  /// Wrapper for the [ServiceInit.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $ServiceInit.wrap(
      ServiceInit(
          name: args[0]!.$value,
          uid: args[1]?.$value,
          rootUrl: args[2]!.$value,
          faviconUrl: args[3]!.$value,
          captchaUrl: () {
            return (args[4] as EvalCallable)(runtime, null, [])?.$value;
          },
          settings: (args[5]?.$reified as List?)?.cast(),
          onBeforeInsertCookie: (oldCookie) {
            return (args[6] as EvalCallable)(runtime, null, [])?.$value;
          },
          webRules: (args[7]?.$reified as List?)?.cast(),
          fetchHeadless: args[8]?.$value ?? false,
          fetchBaseUrl: args[9]?.$value),
    );
  }

  final $Instance _superclass;

  @override
  final ServiceInit $value;

  @override
  ServiceInit get $reified => $value;

  /// Wrap a [ServiceInit] in a [$ServiceInit]
  $ServiceInit.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

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

      case 'toJson':
        return __toJson;
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

  static const $Function __toJson = $Function(_toJson);
  static $Value? _toJson(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $ServiceInit;
    final result = self.$value.toJson();
    return $Map.wrap(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
