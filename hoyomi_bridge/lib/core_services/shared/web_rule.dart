import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'web_rule.freezed.dart';
part 'web_rule.g.dart';

@freezed
@Bind()
sealed class WebRule with _$WebRule {
  factory WebRule({
    /// Example: example\\.com
    String? regexFilter,
    String? shortRegexFilter,
    String? urlFilter,

    /// Example: https://example.com
    required String referer,
  }) = _WebRule;

  factory WebRule.fromJson(Map<String, dynamic> json) =>
      _$WebRuleFromJson(json);

  // Custom assert in unnamed constructor
  WebRule._() {
    assert(
      regexFilter != null || shortRegexFilter != null || urlFilter != null,
      'At least one of regexFilter, shortRegexFilter, or urlFilter must be provided.',
    );
  }
}
