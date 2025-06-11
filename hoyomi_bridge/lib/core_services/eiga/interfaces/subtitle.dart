import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'subtitle.freezed.dart';
part 'subtitle.g.dart';

/// ## Subtitle formats types
///
/// Not all formats are currently supported, it will be added with the rest later!
///
/// - Supported formats:
///   - ### VTT
///   - ### SRT
///   - ### TTML
///   - ### DFXP
///
/// - Unsupported formats:
///   - ### SBV
///   - ### SSA
///
class SubtitleType {
  static const String srt = 'srt';
  static const String ssa = 'ssa';
  static const String ttml = 'ttml';
  static const String dfxp = 'dfxp';
  static const String sbv = 'sbv';
  static const String vtt = 'vtt';
  static const String custom = 'custom';

  static const List<String> supported = [srt, ttml, dfxp, vtt];

  static const List<String> unsupported = [sbv, ssa];

  static const List<String> all = [srt, ssa, ttml, dfxp, sbv, vtt, custom];

  static bool isSupported(String? value) => supported.contains(value);
  static bool isValid(String? value) => all.contains(value);
}

@freezed
@Bind()
sealed class Subtitle with _$Subtitle {
  const factory Subtitle({
    required String language,
    required String code,
    required String type,
    required String url,
    Headers? headers,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
