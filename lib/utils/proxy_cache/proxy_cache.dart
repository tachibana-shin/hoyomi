export 'proxy_cache.stub.dart'
    if (dart.library.js_interop) 'proxy_cache.web.dart'
    if (dart.library.io) 'proxy_cache.io.dart';
