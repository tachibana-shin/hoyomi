import 'package:flutter_test/flutter_test.dart';
import 'package:hoyomi/core_services/interfaces/url_search_params.dart';

void main() {
  group('UrlSearchParams', () {
    test('parse from query string', () {
      final query = 'a=1&b=2&b=3';
      final params = UrlSearchParams.fromQuery(query);
      expect(params.get('a'), '1');
      expect(params.getAll('b'), ['2', '3']);
      expect(params.has('b'), isTrue);
      expect(params.has('c'), isFalse);
    });

    test('toQuery encoding', () {
      final params = UrlSearchParams.fromQuery('key=hello world&x=y');
      expect(params.toQuery(), 'key=hello%20world&x=y');
    });

    test('append', () {
      final p1 = UrlSearchParams.fromQuery('a=1');
      final p2 = p1.append('a', '2');
      expect(p2.getAll('a'), ['1', '2']);
    });

    test('set overwrites', () {
      final p1 = UrlSearchParams.fromQuery('a=1&a=2');
      final p2 = p1.set('a', '999');
      expect(p2.getAll('a'), ['999']);
    });

    test('delete', () {
      final p1 = UrlSearchParams.fromQuery('a=1&b=2');
      final p2 = p1.delete('a');
      expect(p2.has('a'), false);
      expect(p2.get('b'), '2');
    });

    test('toString returns query string', () {
      final p = UrlSearchParams.fromQuery('x=1&y=2');
      expect(p.toQuery(), 'x=1&y=2');
    });

    test('joinTo merges correctly and overrides duplicates', () {
      final uri = Uri.parse('https://example.com/page?a=1&b=2');
      final params = UrlSearchParams.fromQuery('b=99&c=3');
      final newUri = params.joinTo(uri);
      expect(newUri.toString(), 'https://example.com/page?a=1&b=99&c=3');
    });

    test('empty query', () {
      final params = UrlSearchParams.fromQuery('');
      expect(params.params.isEmpty, true);
    });

    test('param with no value defaults to empty string', () {
      final params = UrlSearchParams.fromQuery('a');
      expect(params.get('a'), '');
    });
  });
}
