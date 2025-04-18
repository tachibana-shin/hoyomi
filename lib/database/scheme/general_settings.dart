import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_settings.freezed.dart';
part 'general_settings.g.dart';

@freezed
class GeneralSettings with _$GeneralSettings {
  const factory GeneralSettings({
    @Default(false) bool mangaReadLazyPage,
    @Default(null) DateTime? lastCheckUpdateApp,
    @Default(null) double? brightnessApp,
    @Default(60 * 60 * 3) int pollingIntervalComic,
    @Default(false) bool showListEpisodeWithGrid,
  }) = _GeneralSettings;

  factory GeneralSettings.fromJson(Map<String, Object?> json) =>
      _$GeneralSettingsFromJson(json);
}
