import 'package:flutter_test/flutter_test.dart';
import 'package:hoyomi/core_services/interfaces/headers.dart';

void main() {
  group('Headers', () {
    test('initialization from map', () {
      final headers = Headers({'Content-Type': 'application/json'});
      expect(headers.get('content-type'), 'application/json');
    });

    test('set header returns new instance', () {
      final headers = Headers({});
      final updated = headers.set('Authorization', 'Bearer token');
      expect(updated.get('authorization'), 'Bearer token');
      expect(
          headers.get('authorization'), isNull); // original remains unchanged
    });

    test('append header returns new instance with multiple values', () {
      final headers = Headers({});
      final updated = headers.append('x-token', 'a').append('x-token', 'b');
      expect(updated.getAll('X-TOKEN'), ['a', 'b']);
    });

    test('getAll returns correct list', () {
      final headers = Headers({}).set('Cache-Control', 'no-cache');
      expect(headers.getAll('cache-control'), ['no-cache']);
    });

    test('delete header returns new instance', () {
      final headers = Headers({'Referer': 'https://example.com'});
      final updated = headers.delete('referer');
      expect(updated.has('referer'), isFalse);
      expect(headers.has('referer'), isTrue); // original remains
    });

    test('has header returns true for existing key', () {
      final headers = Headers({}).set('X-Test', '1');
      expect(headers.has('x-test'), isTrue);
    });

    test('toMap returns simplified map', () {
      final headers = Headers({})
          .append('Accept', 'text/html')
          .append('Accept', 'application/json');
      expect(headers.toMap()['accept'], 'text/html, application/json');
    });

    test('toJson works as expected', () {
      final headers = Headers({}).set('Custom', '123');
      final json = headers.toJson()['headers'];
      expect(json['custom'], ['123']);
    });

    test('fromJson restores correctly', () {
      final json = {
        'headers': {
          'content-type': ['text/plain']
        }
      };
      final headers = Headers.fromJson(json);
      expect(headers.get('Content-Type'), 'text/plain');
    });

    test('fromMap restores correctly from simple map', () {
      final map = {'X-Powered-By': 'Dart'};
      final headers = Headers.fromMap(map);
      expect(headers.get('x-powered-by'), 'Dart');
    });

    test('Headers({}) is empty', () {
      final headers = Headers({});
      expect(headers.has('any-header'), isFalse);
      expect(headers.toMap(), isEmpty);
    });

    test('case-insensitive behavior', () {
      final headers = Headers({}).set('X-Custom', 'abc');
      expect(headers.get('x-custom'), 'abc');
      expect(headers.get('X-CUSTOM'), 'abc');
      expect(headers.has('x-Custom'), isTrue);
    });
  });
}
