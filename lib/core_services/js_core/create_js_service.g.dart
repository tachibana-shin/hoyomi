// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_js_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsServiceMeta _$JsServiceMetaFromJson(Map<String, dynamic> json) =>
    _JsServiceMeta(
      type: json['type'] as String,
      init: ServiceInit.fromJson(json['init'] as Map<String, dynamic>),
      isAuth: json[r'$isAuth'] as bool,
      writeWith: json['writeWith'] as String?,
    );

Map<String, dynamic> _$JsServiceMetaToJson(_JsServiceMeta instance) =>
    <String, dynamic>{
      'type': instance.type,
      'init': instance.init,
      r'$isAuth': instance.isAuth,
      'writeWith': instance.writeWith,
    };
