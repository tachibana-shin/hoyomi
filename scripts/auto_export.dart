// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart' as p;

/// scripts/ ディレクトリからの相対パスで指定（lib/ から始まるパス）
const List<String> targetMainFiles = [
  'lib/core_services/comic/export.dart',
  'lib/core_services/eiga/export.dart',
  'lib/core_services/interfaces/export.dart',
  'lib/core_services/mixin/export.dart',
  'lib/pages/export.dart',
  'lib/plugins/export.dart',
  'lib/screens/export.dart',
  'lib/utils/export.dart',
  'lib/widgets/export.dart',
];

/// メイン処理
void main() {
  // このスクリプト自身のディレクトリを取得
  final scriptDir = Directory.current.uri.resolve('./scripts/').toFilePath();

  for (final relativeMainPath in targetMainFiles) {
    // スクリプトディレクトリを基準にして main.dart の絶対パスを計算
    final mainFilePath = p.normalize(p.join(scriptDir, '..', relativeMainPath));
    final mainFile = File(mainFilePath);
    final dir = mainFile.parent;
    final exports = <String>[];

    // 対象ディレクトリ内の Dart ファイルを再帰的に取得
    final allFiles =
        dir
            .listSync(recursive: true)
            .whereType<File>()
            .where(
              (f) =>
                  f.path.endsWith('.dart') &&
                  !p.basename(f.path).startsWith('.') && // 隠しファイルを除外
                  !_isGeneratedFile(f.path) && // 自動生成ファイルを除外
                  p.normalize(f.path) != p.normalize(mainFilePath),
            ) // 自分自身を除外
            .toList();

    for (final file in allFiles) {
      // export.dart からの相対パスを計算
      final relativePath = p
          .relative(file.path, from: p.dirname(mainFilePath))
          .replaceAll(r'\', '/');
      // export 文を追加
      exports.add("export '$relativePath';");
    }

    // 最終的な export.dart の内容を生成
    final content = [
      '// 自動生成ファイル。手動で編集しないでください。',
      '// 再生成するには scripts/auto_export.dart を実行してください。',
      '',
      ...exports,
      '',
    ].join('\n');

    // ファイルに書き込み
    mainFile.writeAsStringSync(content);
    print('✅ Exported ${exports.length} files to $relativeMainPath');
  }
}

/// 自動生成ファイル（.g.dart, .freezed.dart, /services/, .x.dartなど）かどうかを判定
bool _isGeneratedFile(String path) {
  final basename = p.basename(path);
  if (basename.contains('.page.')) return false;

  return basename.contains('.g.dart') ||
      basename.contains('.freezed.dart') ||
      RegExp(r'\.[a-z]+\.dart$').hasMatch(basename) ||
      path.contains('/services/') ||
      path.contains('\\services\\');
}
