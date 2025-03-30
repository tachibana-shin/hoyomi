import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_settings.freezed.dart';
part 'service_settings.g.dart';

@freezed
class ServiceSettings with _$ServiceSettings {
  const factory ServiceSettings({
    required String sourceId,

    /// This field save all field: cookie, user agent...
    required Map<String, dynamic>? settings,

    /// Cache user data
    required String? userDataCache,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ServiceSettings;

  factory ServiceSettings.fromJson(Map<String, Object?> json) =>
      _$ServiceSettingsFromJson(json);
}
