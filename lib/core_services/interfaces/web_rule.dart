import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_rule.freezed.dart';
part 'web_rule.g.dart';

@freezed
class WebRule with _$WebRule {
  const factory WebRule({
    /// Example: example\\.com
    required String regexFilter,
    /// Example: https://example.com
    required String referer,
  }) = _WebRule;

  factory WebRule.fromJson(Map<String, dynamic> json) => _$WebRuleFromJson(json);
}
