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
enum SubtitleType {
  /// ## SubRip
  ///
  /// **SubRip** is a free software program for Microsoft Windows which extracts subtitles and
  /// their timings from various video formats to a text file. It is released under the GNU GPL.
  /// Its subtitle format's file extension is `.srt` and is widely supported. Each `.srt` file is a
  /// human-readable file format where the subtitles are stored sequentially along with the timing
  /// information. Most subtitles distributed on the Internet are in this format.
  srt,

  /// ## SubStation Alpha
  ///
  /// **SubStation Alpha** (or **Sub Station Alpha**), abbreviated **SSA**, is a [subtitle](https://en.wikipedia.org/wiki/Subtitle_(captioning))
  /// [file format](https://en.wikipedia.org/wiki/File_format) created by CS Low (also known as Kotus)
  /// that allows for more advanced subtitles than the conventional SRT and similar formats. It is also
  /// the name of the popular, now discontinued tool used to edit subtitles.
  ssa,

  /// ## Timed Text Markup Language
  ///
  /// **Timed Text Markup Language** (**TTML**), previously referred to as Distribution Format Exchange
  /// Profile (**DFXP**), is an XML-based W3C standard for timed text in online media and was designed to be
  /// used for the purpose of authoring, transcoding or exchanging timed text information presently in
  /// use primarily for subtitling and captioning functions. TTML2, the second major revision of the
  /// language, was finalized on November 8, 2018. It has been adopted widely in the television industry,
  /// including by Society of Motion Picture and Television Engineers (SMPTE), European Broadcasting Union
  /// (EBU), ATSC, DVB, HbbTV and MPEG CMAF and several profiles and extensions for the language exist
  /// nowadays.
  ttml,

  /// ## Distribution Format Exchange Profile
  /// ### Replaced with `TTML`
  /// **DFXP** (**Distribution Format Exchange Profile**) is standard for XML captions and subtitles
  /// based on the TTML (Timed Text Markup Language) format, developed by the World Wide Web Consortium
  /// (W3C) in order to unify the increasingly divergent set of existing caption formats. TTML was
  /// intended to be a meta-standard, or sorts. It defines a set of requirements and capabilities
  /// that any other derived standard can incorporate, in part or in whole. Derived standards are
  /// called **profiles**. So, profiles are essentially groups of capabilities and requirements from
  /// the underlying TTML standard.
  dfxp,

  /// ## YouTube format `.SBV`
  ///
  /// An **SBV** file is a file used to add subtitles or closed captions to a YouTube video. It contains
  /// a series of start and end timestamps paired with the captions to show during those time periods.
  /// SBV files are saved in a plain text format. SBV timestamps are formatted using the `HH:MM:SS`.
  sbv,

  /// ## Web Video Text Track
  ///
  /// **WebVTT** (Web Video Text Tracks) is a [World Wide Web Consortium](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium)
  /// (W3C) standard for displaying timed text in connection with the HTML5 `<track>` element.
  ///
  /// The early drafts of its specification were written by WHATWG in 2010 after discussions about
  /// what caption format should be supported by HTML5—the main options being the relatively mature,
  /// XML-based Timed Text Markup Language (TTML) or an entirely new but more lightweight standard
  /// based on the widely-used SubRip format. The final decision was for the new standard, initially
  /// called WebSRT (Web Subtitle Resource Tracks). It shared the `.srt` file extension and was broadly
  /// based on the SubRip format, though not fully compatible with it. The prospective format was
  /// later renamed WebVTT. In the January 13, 2011 version of the HTML5 Draft Report],
  /// the`<track>` tag was introduced and the specification was updated to document WebVTT cue text
  /// rendering rules. The WebVTT specification is still in draft stage but the basic features are
  /// already supported by all major browsers.
  vtt,

  /// ## Custom (User define type)
  ///
  /// This is type used when user provide a custom subtitle format or not supported in this package.
  custom,
}

@freezed
@Bind()
sealed class Subtitle with _$Subtitle {
  const factory Subtitle({
    required String language,
    required String code,
    required SubtitleType type,
    required String url,
    Headers? headers,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
