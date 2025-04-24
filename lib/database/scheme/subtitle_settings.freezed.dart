// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtitleSettings {

 String get fontFamily; String get fontColor; String get fontSize; String get fontOpacity; String get bgColor; String get bgOpacity; String get windowColor; String get windowOpacity; String get edgeStyle;
/// Create a copy of SubtitleSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtitleSettingsCopyWith<SubtitleSettings> get copyWith => _$SubtitleSettingsCopyWithImpl<SubtitleSettings>(this as SubtitleSettings, _$identity);

  /// Serializes this SubtitleSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtitleSettings&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontColor, fontColor) || other.fontColor == fontColor)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontOpacity, fontOpacity) || other.fontOpacity == fontOpacity)&&(identical(other.bgColor, bgColor) || other.bgColor == bgColor)&&(identical(other.bgOpacity, bgOpacity) || other.bgOpacity == bgOpacity)&&(identical(other.windowColor, windowColor) || other.windowColor == windowColor)&&(identical(other.windowOpacity, windowOpacity) || other.windowOpacity == windowOpacity)&&(identical(other.edgeStyle, edgeStyle) || other.edgeStyle == edgeStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontFamily,fontColor,fontSize,fontOpacity,bgColor,bgOpacity,windowColor,windowOpacity,edgeStyle);

@override
String toString() {
  return 'SubtitleSettings(fontFamily: $fontFamily, fontColor: $fontColor, fontSize: $fontSize, fontOpacity: $fontOpacity, bgColor: $bgColor, bgOpacity: $bgOpacity, windowColor: $windowColor, windowOpacity: $windowOpacity, edgeStyle: $edgeStyle)';
}


}

/// @nodoc
abstract mixin class $SubtitleSettingsCopyWith<$Res>  {
  factory $SubtitleSettingsCopyWith(SubtitleSettings value, $Res Function(SubtitleSettings) _then) = _$SubtitleSettingsCopyWithImpl;
@useResult
$Res call({
 String fontFamily, String fontColor, String fontSize, String fontOpacity, String bgColor, String bgOpacity, String windowColor, String windowOpacity, String edgeStyle
});




}
/// @nodoc
class _$SubtitleSettingsCopyWithImpl<$Res>
    implements $SubtitleSettingsCopyWith<$Res> {
  _$SubtitleSettingsCopyWithImpl(this._self, this._then);

  final SubtitleSettings _self;
  final $Res Function(SubtitleSettings) _then;

/// Create a copy of SubtitleSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontFamily = null,Object? fontColor = null,Object? fontSize = null,Object? fontOpacity = null,Object? bgColor = null,Object? bgOpacity = null,Object? windowColor = null,Object? windowOpacity = null,Object? edgeStyle = null,}) {
  return _then(_self.copyWith(
fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontColor: null == fontColor ? _self.fontColor : fontColor // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as String,fontOpacity: null == fontOpacity ? _self.fontOpacity : fontOpacity // ignore: cast_nullable_to_non_nullable
as String,bgColor: null == bgColor ? _self.bgColor : bgColor // ignore: cast_nullable_to_non_nullable
as String,bgOpacity: null == bgOpacity ? _self.bgOpacity : bgOpacity // ignore: cast_nullable_to_non_nullable
as String,windowColor: null == windowColor ? _self.windowColor : windowColor // ignore: cast_nullable_to_non_nullable
as String,windowOpacity: null == windowOpacity ? _self.windowOpacity : windowOpacity // ignore: cast_nullable_to_non_nullable
as String,edgeStyle: null == edgeStyle ? _self.edgeStyle : edgeStyle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubtitleSettings implements SubtitleSettings {
  const _SubtitleSettings({this.fontFamily = 'Normal', this.fontColor = 'White', this.fontSize = '100%', this.fontOpacity = '100%', this.bgColor = 'Black', this.bgOpacity = '75%', this.windowColor = 'Black', this.windowOpacity = '0%', this.edgeStyle = 'None'});
  factory _SubtitleSettings.fromJson(Map<String, dynamic> json) => _$SubtitleSettingsFromJson(json);

@override@JsonKey() final  String fontFamily;
@override@JsonKey() final  String fontColor;
@override@JsonKey() final  String fontSize;
@override@JsonKey() final  String fontOpacity;
@override@JsonKey() final  String bgColor;
@override@JsonKey() final  String bgOpacity;
@override@JsonKey() final  String windowColor;
@override@JsonKey() final  String windowOpacity;
@override@JsonKey() final  String edgeStyle;

/// Create a copy of SubtitleSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtitleSettingsCopyWith<_SubtitleSettings> get copyWith => __$SubtitleSettingsCopyWithImpl<_SubtitleSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtitleSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtitleSettings&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontColor, fontColor) || other.fontColor == fontColor)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontOpacity, fontOpacity) || other.fontOpacity == fontOpacity)&&(identical(other.bgColor, bgColor) || other.bgColor == bgColor)&&(identical(other.bgOpacity, bgOpacity) || other.bgOpacity == bgOpacity)&&(identical(other.windowColor, windowColor) || other.windowColor == windowColor)&&(identical(other.windowOpacity, windowOpacity) || other.windowOpacity == windowOpacity)&&(identical(other.edgeStyle, edgeStyle) || other.edgeStyle == edgeStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontFamily,fontColor,fontSize,fontOpacity,bgColor,bgOpacity,windowColor,windowOpacity,edgeStyle);

@override
String toString() {
  return 'SubtitleSettings(fontFamily: $fontFamily, fontColor: $fontColor, fontSize: $fontSize, fontOpacity: $fontOpacity, bgColor: $bgColor, bgOpacity: $bgOpacity, windowColor: $windowColor, windowOpacity: $windowOpacity, edgeStyle: $edgeStyle)';
}


}

/// @nodoc
abstract mixin class _$SubtitleSettingsCopyWith<$Res> implements $SubtitleSettingsCopyWith<$Res> {
  factory _$SubtitleSettingsCopyWith(_SubtitleSettings value, $Res Function(_SubtitleSettings) _then) = __$SubtitleSettingsCopyWithImpl;
@override @useResult
$Res call({
 String fontFamily, String fontColor, String fontSize, String fontOpacity, String bgColor, String bgOpacity, String windowColor, String windowOpacity, String edgeStyle
});




}
/// @nodoc
class __$SubtitleSettingsCopyWithImpl<$Res>
    implements _$SubtitleSettingsCopyWith<$Res> {
  __$SubtitleSettingsCopyWithImpl(this._self, this._then);

  final _SubtitleSettings _self;
  final $Res Function(_SubtitleSettings) _then;

/// Create a copy of SubtitleSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontFamily = null,Object? fontColor = null,Object? fontSize = null,Object? fontOpacity = null,Object? bgColor = null,Object? bgOpacity = null,Object? windowColor = null,Object? windowOpacity = null,Object? edgeStyle = null,}) {
  return _then(_SubtitleSettings(
fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontColor: null == fontColor ? _self.fontColor : fontColor // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as String,fontOpacity: null == fontOpacity ? _self.fontOpacity : fontOpacity // ignore: cast_nullable_to_non_nullable
as String,bgColor: null == bgColor ? _self.bgColor : bgColor // ignore: cast_nullable_to_non_nullable
as String,bgOpacity: null == bgOpacity ? _self.bgOpacity : bgOpacity // ignore: cast_nullable_to_non_nullable
as String,windowColor: null == windowColor ? _self.windowColor : windowColor // ignore: cast_nullable_to_non_nullable
as String,windowOpacity: null == windowOpacity ? _self.windowOpacity : windowOpacity // ignore: cast_nullable_to_non_nullable
as String,edgeStyle: null == edgeStyle ? _self.edgeStyle : edgeStyle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
