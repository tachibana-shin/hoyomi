import 'dart:async';

import 'package:flutter/material.dart';

final Map<String, String> _cache = {};

/// A function that caches the result of [get] to a file.
/// If a cache exists, it emits the cached value immediately and then silently updates the cache
/// in the background, emitting the new value when available.
///
/// The optional [fromCache] and [toCache] functions can be provided to handle serialization.
/// By default, if not provided, the value is assumed to be a String.
Future<T> cacheRemember<T>(
  String key, {
  required Future<T> Function() get,
  required void Function(T newValue) onUpdate,
  required T Function(String) fromCache,
  required String Function(T) toCache,
}) async {
  final file = _cache[key];

  if (file != null) {
    debugPrint('[cache_remember]: Cache hit for $key');

    try {
      final content = file;
      final cachedValue = fromCache(content);

      // Update the cache in the background.
      get().then((newValue) async {
        final content = toCache(newValue);
        onUpdate(newValue);
        debugPrint('[cache_remember]: Cache updated for $key');

        _cache[key] = content;
      });

      return cachedValue;
    } catch (err) {
      debugPrint('[cache_remember]: Error reading cache for $key: $err');
    }
  }

  final value = await get();
  final content = toCache(value);
  _cache[key] = content;

  return value;
}
