import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_search_params.freezed.dart';
part 'url_search_params.g.dart';

@freezed
sealed class UrlSearchParams with _$UrlSearchParams {
  const factory UrlSearchParams({
    @Default({}) Map<String, List<String>> params,
  }) = _UrlSearchParams;

  factory UrlSearchParams.fromJson(Map<String, dynamic> json) =>
      _$UrlSearchParamsFromJson(
        json.containsKey('params')
            ? json
            : {
                'params': Map.fromEntries(
                  json.entries.map(
                    (entry) => MapEntry(
                      entry.key,
                      entry.value is List
                          ? entry.value
                          : [entry.value.toString()],
                    ),
                  ),
                ),
              },
      );

  /// Parse from raw query string
  factory UrlSearchParams.fromQuery(String query) {
    final Map<String, List<String>> parsed = {};

    for (final part in query.split('&')) {
      if (part.isEmpty) continue;
      final split = part.split('=');
      final key = Uri.decodeQueryComponent(split[0]);
      final value = split.length > 1
          ? Uri.decodeQueryComponent(split.sublist(1).join('='))
          : '';

      parsed.putIfAbsent(key, () => []).add(value);
    }

    return UrlSearchParams(params: parsed);
  }

  factory UrlSearchParams.fromMap(Map<String, dynamic> params) {
    return UrlSearchParams(
      params: Map.fromEntries(
        params.entries.where((entry) => entry.value != null).map((entry) {
          if (entry is List) {
            return MapEntry(
              entry.key,
              entry.value.map((value) => '$value').toMap(),
            );
          }

          return MapEntry(entry.key, ['${entry.value}']);
        }),
      ),
    );
  }
}

extension UrlSearchParamsExt on UrlSearchParams {
  String? get(String key) {
    final list = params[key];
    return list != null && list.isNotEmpty ? list.first : null;
  }

  List<String> getAll(String key) => params[key] ?? [];

  bool has(String key) => params.containsKey(key);

  String toQuery() {
    final parts = <String>[];
    for (final entry in params.entries) {
      for (final value in entry.value) {
        parts.add(
          '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeComponent(value)}',
        );
      }
    }
    return parts.join('&');
  }

  /// Append a value to the key
  UrlSearchParams append(String key, String value) {
    final newMap = Map<String, List<String>>.from(params);
    newMap.putIfAbsent(key, () => []).add(value);
    return UrlSearchParams(params: newMap);
  }

  /// Set the value (overwrite) for the key
  UrlSearchParams set(String key, String value) {
    final newMap = Map<String, List<String>>.from(params);
    newMap[key] = [value];
    return UrlSearchParams(params: newMap);
  }

  /// Delete all values for a key
  UrlSearchParams delete(String key) {
    final newMap = Map<String, List<String>>.from(params);
    newMap.remove(key);
    return UrlSearchParams(params: newMap);
  }

  Map<String, List<String>> toMap() => Map.unmodifiable(params);
  Map<String, dynamic> toSingleMap() {
    return {
      for (final entry in params.entries)
        if (entry.value.length >= 2)
          '${entry.key}[]': entry.value
        else
          entry.key: entry.value.firstOrNull ?? '',
    };
  }

  /// Join current params into a given Uri, overriding existing keys if duplicated.
  Uri joinTo(Uri uri) {
    final existingParams = Uri.splitQueryString(uri.query, encoding: utf8);
    final combined = Map<String, List<String>>.from({});

    for (final entry in existingParams.entries) {
      combined.putIfAbsent(entry.key, () => []).add(entry.value);
    }

    for (final entry in params.entries) {
      combined[entry.key] = entry.value;
    }

    final newQuery = combined.entries
        .expand(
          (e) => e.value.map(
            (v) =>
                '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(v)}',
          ),
        )
        .join('&');

    return uri.replace(query: newQuery);
  }
}
