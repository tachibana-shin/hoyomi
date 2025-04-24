// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opening_ending.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DurationRange {

 Duration get start; Duration get end;
/// Create a copy of DurationRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DurationRangeCopyWith<DurationRange> get copyWith => _$DurationRangeCopyWithImpl<DurationRange>(this as DurationRange, _$identity);

  /// Serializes this DurationRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DurationRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'DurationRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $DurationRangeCopyWith<$Res>  {
  factory $DurationRangeCopyWith(DurationRange value, $Res Function(DurationRange) _then) = _$DurationRangeCopyWithImpl;
@useResult
$Res call({
 Duration start, Duration end
});




}
/// @nodoc
class _$DurationRangeCopyWithImpl<$Res>
    implements $DurationRangeCopyWith<$Res> {
  _$DurationRangeCopyWithImpl(this._self, this._then);

  final DurationRange _self;
  final $Res Function(DurationRange) _then;

/// Create a copy of DurationRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DurationRange implements DurationRange {
  const _DurationRange({required this.start, required this.end});
  factory _DurationRange.fromJson(Map<String, dynamic> json) => _$DurationRangeFromJson(json);

@override final  Duration start;
@override final  Duration end;

/// Create a copy of DurationRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationRangeCopyWith<_DurationRange> get copyWith => __$DurationRangeCopyWithImpl<_DurationRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DurationRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'DurationRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$DurationRangeCopyWith<$Res> implements $DurationRangeCopyWith<$Res> {
  factory _$DurationRangeCopyWith(_DurationRange value, $Res Function(_DurationRange) _then) = __$DurationRangeCopyWithImpl;
@override @useResult
$Res call({
 Duration start, Duration end
});




}
/// @nodoc
class __$DurationRangeCopyWithImpl<$Res>
    implements _$DurationRangeCopyWith<$Res> {
  __$DurationRangeCopyWithImpl(this._self, this._then);

  final _DurationRange _self;
  final $Res Function(_DurationRange) _then;

/// Create a copy of DurationRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_DurationRange(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}


/// @nodoc
mixin _$OpeningEnding {

 DurationRange? get opening; DurationRange? get ending;
/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpeningEndingCopyWith<OpeningEnding> get copyWith => _$OpeningEndingCopyWithImpl<OpeningEnding>(this as OpeningEnding, _$identity);

  /// Serializes this OpeningEnding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpeningEnding&&(identical(other.opening, opening) || other.opening == opening)&&(identical(other.ending, ending) || other.ending == ending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opening,ending);

@override
String toString() {
  return 'OpeningEnding(opening: $opening, ending: $ending)';
}


}

/// @nodoc
abstract mixin class $OpeningEndingCopyWith<$Res>  {
  factory $OpeningEndingCopyWith(OpeningEnding value, $Res Function(OpeningEnding) _then) = _$OpeningEndingCopyWithImpl;
@useResult
$Res call({
 DurationRange? opening, DurationRange? ending
});


$DurationRangeCopyWith<$Res>? get opening;$DurationRangeCopyWith<$Res>? get ending;

}
/// @nodoc
class _$OpeningEndingCopyWithImpl<$Res>
    implements $OpeningEndingCopyWith<$Res> {
  _$OpeningEndingCopyWithImpl(this._self, this._then);

  final OpeningEnding _self;
  final $Res Function(OpeningEnding) _then;

/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? opening = freezed,Object? ending = freezed,}) {
  return _then(_self.copyWith(
opening: freezed == opening ? _self.opening : opening // ignore: cast_nullable_to_non_nullable
as DurationRange?,ending: freezed == ending ? _self.ending : ending // ignore: cast_nullable_to_non_nullable
as DurationRange?,
  ));
}
/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationRangeCopyWith<$Res>? get opening {
    if (_self.opening == null) {
    return null;
  }

  return $DurationRangeCopyWith<$Res>(_self.opening!, (value) {
    return _then(_self.copyWith(opening: value));
  });
}/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationRangeCopyWith<$Res>? get ending {
    if (_self.ending == null) {
    return null;
  }

  return $DurationRangeCopyWith<$Res>(_self.ending!, (value) {
    return _then(_self.copyWith(ending: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _OpeningEnding implements OpeningEnding {
  const _OpeningEnding({this.opening, this.ending});
  factory _OpeningEnding.fromJson(Map<String, dynamic> json) => _$OpeningEndingFromJson(json);

@override final  DurationRange? opening;
@override final  DurationRange? ending;

/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpeningEndingCopyWith<_OpeningEnding> get copyWith => __$OpeningEndingCopyWithImpl<_OpeningEnding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpeningEndingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpeningEnding&&(identical(other.opening, opening) || other.opening == opening)&&(identical(other.ending, ending) || other.ending == ending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,opening,ending);

@override
String toString() {
  return 'OpeningEnding(opening: $opening, ending: $ending)';
}


}

/// @nodoc
abstract mixin class _$OpeningEndingCopyWith<$Res> implements $OpeningEndingCopyWith<$Res> {
  factory _$OpeningEndingCopyWith(_OpeningEnding value, $Res Function(_OpeningEnding) _then) = __$OpeningEndingCopyWithImpl;
@override @useResult
$Res call({
 DurationRange? opening, DurationRange? ending
});


@override $DurationRangeCopyWith<$Res>? get opening;@override $DurationRangeCopyWith<$Res>? get ending;

}
/// @nodoc
class __$OpeningEndingCopyWithImpl<$Res>
    implements _$OpeningEndingCopyWith<$Res> {
  __$OpeningEndingCopyWithImpl(this._self, this._then);

  final _OpeningEnding _self;
  final $Res Function(_OpeningEnding) _then;

/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? opening = freezed,Object? ending = freezed,}) {
  return _then(_OpeningEnding(
opening: freezed == opening ? _self.opening : opening // ignore: cast_nullable_to_non_nullable
as DurationRange?,ending: freezed == ending ? _self.ending : ending // ignore: cast_nullable_to_non_nullable
as DurationRange?,
  ));
}

/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationRangeCopyWith<$Res>? get opening {
    if (_self.opening == null) {
    return null;
  }

  return $DurationRangeCopyWith<$Res>(_self.opening!, (value) {
    return _then(_self.copyWith(opening: value));
  });
}/// Create a copy of OpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DurationRangeCopyWith<$Res>? get ending {
    if (_self.ending == null) {
    return null;
  }

  return $DurationRangeCopyWith<$Res>(_self.ending!, (value) {
    return _then(_self.copyWith(ending: value));
  });
}
}

// dart format on
