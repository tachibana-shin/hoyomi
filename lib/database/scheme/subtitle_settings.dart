import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtitle_settings.freezed.dart';
part 'subtitle_settings.g.dart';

const _colors = [
  'White',
  'Yellow',
  'Green',
  'Cyan',
  'Blue',
  'Magenta',
  'Red',
  'Black',
];

const subtitleOptions = {
  'fontFamily': [
    'Normal',
    'Sans-Serif',
    'Serif',
    'Monospace',
    'Cursive',
    'Small Caps',
  ],
  'fontColor': _colors,
  'fontSize': ['50%', '75%', '100%', '150%', '200%', '300%', '400%'],
  'fontOpacity': ['25%', '50%', '75%', '100%'],
  'bgColor': _colors,
  'bgOpacity': ['0%', '25%', '50%', '75%', '100%'],
  'windowColor': _colors,
  'windowOpacity': ['0%', '25%', '50%', '75%', '100%'],
  'edgeStyle': ['None', 'Raised', 'Depressed', 'Outline', 'Drop shadow'],
};

@freezed
sealed class SubtitleSettings with _$SubtitleSettings {
  const factory SubtitleSettings({
    @Default('Normal') String fontFamily,
    @Default('White') String fontColor,
    @Default('100%') String fontSize,
    @Default('100%') String fontOpacity,
    @Default('Black') String bgColor,
    @Default('75%') String bgOpacity,
    @Default('Black') String windowColor,
    @Default('0%') String windowOpacity,
    @Default('None') String edgeStyle,
  }) = _SubtitleSettings;

  factory SubtitleSettings.fromJson(Map<String, dynamic> json) =>
      _$SubtitleSettingsFromJson(json);
}

extension SubtitleSettingsStyle on SubtitleSettings {
  /// テキスト表示スタイルに変換する関数
  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: _parseFontSize(fontSize),
      color: _needsForeground(edgeStyle)
          ? null
          : _parseColor(fontColor, fontOpacity),
      backgroundColor: _parseColor(bgColor, bgOpacity),
      fontFamily: _parseFontFamily(fontFamily),
      foreground: _parseEdgePaint(edgeStyle, fontColor, fontOpacity),
      shadows: _parseEdgeShadows(edgeStyle),
    );
  }

  /// 字幕ウィンドウのコンテナスタイルに変換する関数
  BoxDecoration toWindowDecoration() {
    return BoxDecoration(color: _parseColor(windowColor, windowOpacity));
  }

  /// パーセンテージ文字列を `double` のフォントサイズへ変換
  double _parseFontSize(String size) {
    final percent = double.tryParse(size.replaceAll('%', '')) ?? 100;
    return 16.0 * (percent / 100); // 基準サイズ 16.0
  }

  /// カラーと不透明度を `Color` に変換
  Color _parseColor(String name, String opacityPercent) {
    final baseColor =
        {
          'White': Colors.white,
          'Yellow': Colors.yellow,
          'Green': Colors.green,
          'Cyan': Colors.cyan,
          'Blue': Colors.blue,
          'Magenta': Colors.purple,
          'Red': Colors.red,
          'Black': Colors.black,
        }[name] ??
        Colors.white;

    final opacity = double.parse(opacityPercent.replaceAll('%', '')) / 100;
    return baseColor.withValues(alpha: opacity.clamp(0, 1));
  }

  /// フォントファミリー変換 (flutter の利用可能な fontFamily に応じて調整可能)
  String? _parseFontFamily(String name) {
    switch (name) {
      case 'Sans-Serif':
        return 'sans-serif';
      case 'Serif':
        return 'serif';
      case 'Monospace':
        return 'monospace';
      case 'Cursive':
        return 'cursive';
      case 'Small Caps':
        return 'small-caps'; // ※ Flutter が small-caps を認識しない場合 fallback を検討
      default:
        return null;
    }
  }

  /// edgeStyle に応じて `Paint` を返す（Outline, Raised, Depressed 用）
  Paint? _parseEdgePaint(String style, String fontColor, String fontOpacity) {
    if (style == 'Outline' || style == 'Raised' || style == 'Depressed') {
      final strokeColor = style == 'Depressed' ? Colors.black : Colors.white;
      return Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = strokeColor;
    }
    return null;
  }

  /// Drop shadow 用の shadow 設定
  List<Shadow>? _parseEdgeShadows(String style) {
    if (style == 'Drop shadow') {
      return [
        const Shadow(
          offset: Offset(1.5, 1.5),
          blurRadius: 2.0,
          color: Colors.black54,
        ),
      ];
    }
    return null;
  }

  /// foreground を使用するか判定
  bool _needsForeground(String style) {
    return style == 'Outline' || style == 'Raised' || style == 'Depressed';
  }
}
