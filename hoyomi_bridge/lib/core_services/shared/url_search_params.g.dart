// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UrlSearchParams _$UrlSearchParamsFromJson(Map<String, dynamic> json) =>
    _UrlSearchParams(
      params: (json['params'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
    );

Map<String, dynamic> _$UrlSearchParamsToJson(_UrlSearchParams instance) =>
    <String, dynamic>{
      'params': instance.params,
    };
