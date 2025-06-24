// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'headers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Headers {

@JsonKey() Map<String, List<String>> get headers;
/// Create a copy of Headers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeadersCopyWith<Headers> get copyWith => _$HeadersCopyWithImpl<Headers>(this as Headers, _$identity);

  /// Serializes this Headers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Headers&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'Headers(headers: $headers)';
}


}

/// @nodoc
abstract mixin class $HeadersCopyWith<$Res>  {
  factory $HeadersCopyWith(Headers value, $Res Function(Headers) _then) = _$HeadersCopyWithImpl;
@useResult
$Res call({
@JsonKey() Map<String, List<String>> headers
});




}
/// @nodoc
class _$HeadersCopyWithImpl<$Res>
    implements $HeadersCopyWith<$Res> {
  _$HeadersCopyWithImpl(this._self, this._then);

  final Headers _self;
  final $Res Function(Headers) _then;

/// Create a copy of Headers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headers = null,}) {
  return _then(_self.copyWith(
headers: null == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Headers implements Headers {
  const _Headers({@JsonKey() final  Map<String, List<String>> headers = const {}}): _headers = headers;
  factory _Headers.fromJson(Map<String, dynamic> json) => _$HeadersFromJson(
    json.containsKey('headers')
        ? json
        : {
          'headers': Map.fromEntries(
            json.entries.map(
              (entry) => MapEntry(
                entry.key,
                entry.value is List ? entry.value : [entry.value.toString()],
              ),
            ),
          ),
        },
  );

 final  Map<String, List<String>> _headers;
@override@JsonKey() Map<String, List<String>> get headers {
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_headers);
}


/// Create a copy of Headers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeadersCopyWith<_Headers> get copyWith => __$HeadersCopyWithImpl<_Headers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeadersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Headers&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'Headers._(headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$HeadersCopyWith<$Res> implements $HeadersCopyWith<$Res> {
  factory _$HeadersCopyWith(_Headers value, $Res Function(_Headers) _then) = __$HeadersCopyWithImpl;
@override @useResult
$Res call({
@JsonKey() Map<String, List<String>> headers
});




}
/// @nodoc
class __$HeadersCopyWithImpl<$Res>
    implements _$HeadersCopyWith<$Res> {
  __$HeadersCopyWithImpl(this._self, this._then);

  final _Headers _self;
  final $Res Function(_Headers) _then;

/// Create a copy of Headers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headers = null,}) {
  return _then(_Headers(
headers: null == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
