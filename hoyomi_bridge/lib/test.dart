import 'compiler/compile.dart';
void main() async {
  final runtime = await compile({
    'hello': {
      'main.dart': '''
      import 'package:hoyomi_bridge/main.dart';
      import 'dart:convert';

      void main() {
        final book = OImage(src: 'https://google.com/favicon.ico');
        print(jsonEncode(book));
      }
    ''',
    },
  });

  runtime.executeLib('package:hello/main.dart', 'main'); // -> 'Hello again!'
}
