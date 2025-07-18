import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:hoyomi/plugins/logger.dart';
import 'package:path_provider/path_provider.dart';

/// Get a File instance for the given cache key.
/// Here, we use the hashCode of the key to form a safe file name.
File _getCacheFile(Directory cacheDir, String key) {
  final fileName = 'cache_${sha256.convert(utf8.encode(key)).toString()}.cache';
  return File('${cacheDir.path}/$fileName');
}

/// A function that caches the result of [get] to a file.
/// If a cache exists, it emits the cached value immediately and then silently updates the cache
/// in the background, emitting the new value when available.
///
/// The optional [fromCache] and [toCache] functions can be provided to handle serialization.
/// By default, if not provided, tPhe value is assumed to be a String.
Future<T> cacheRemember<T>(
  String key, {
  required Future<T> Function() get,
  required void Function(T newValue) onUpdate,
  required T Function(String) fromCache,
  required String Function(T) toCache,
}) async {
  final directory = await getTemporaryDirectory();

  final file = _getCacheFile(directory, key);

  if (await file.exists()) {
    logger.i('[cache_remember]: Cache hit for $key');

    try {
      final content = await file.readAsString();
      final cachedValue = fromCache(content);

      // Update the cache in the background.
      get().then((newValue) async {
        final newContent = toCache(newValue);
        if (content == newContent) return;

        onUpdate(newValue);
        logger.i('[cache_remember]: Cache updated for $key');

        await file.writeAsString(newContent);
      });

      return cachedValue;
    } catch (err, trace) {
      logger.e(err, stackTrace: trace);
    }
  }

  final value = await get();
  final content = toCache(value);
  await file.writeAsString(content);

  return value;
}
