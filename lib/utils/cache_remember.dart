import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// Get a File instance for the given cache key.
/// Here, we use the hashCode of the key to form a safe file name.
File _getCacheFile(Directory cacheDir, String key) {
  final fileName = 'cache_${key.hashCode}.cache';
  return File('${cacheDir.path}/$fileName');
}

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
  T Function(String)? fromCache,
  String Function(T)? toCache,
}) async {
  final directory = await getTemporaryDirectory();

  final file = _getCacheFile(directory, key);

  // Default conversion functions: if T is not a String, provide custom functions.
  final T Function(String) fromCache0 = fromCache ?? ((s) => s as T);
  final String Function(T) toCache0 = toCache ?? ((t) => t.toString());

  if (await file.exists()) {
    debugPrint('[cache_remember]: Cache hit for $key');

    final content = await file.readAsString();
    final cachedValue = fromCache0(content);

    // Update the cache in the background.
    get().then((newValue) async {
      final content = toCache0(newValue);
      onUpdate(newValue);
      debugPrint('[cache_remember]: Cache updated for $key');

      await file.writeAsString(content);
    });

    return cachedValue;
  }

  final value = await get();
  final content = toCache0(value);
  await file.writeAsString(content);

  return value;
}
