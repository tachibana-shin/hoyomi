// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

/// Filter by comic status (e.g., ongoing, completed)
@JsonEnum()
enum Status {
  @JsonValue('ongoing')
  ongoing('ongoing'),
  @JsonValue('completed')
  completed('completed'),
  @JsonValue('cancelled')
  cancelled('cancelled'),
  @JsonValue('unknown')
  unknown('unknown'),
  @JsonValue('on_hiatus')
  onHiatus('on_hiatus'),
  @JsonValue('publishing_finished')
  publishingFinished('publishing_finished'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const Status(this.json);

  factory Status.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;
}
