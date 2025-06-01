// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Eiga {

 String get name; String get eigaId; String? get originalName; OImage get image; EigaEpisode? get lastEpisode; DateTime? get lastUpdate; String? get notice; int? get countSub; int? get countDub; double? get rate; bool get pending; DateTime? get preRelease; String? get description;
/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaCopyWith<Eiga> get copyWith => _$EigaCopyWithImpl<Eiga>(this as Eiga, _$identity);

  /// Serializes this Eiga to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Eiga&&(identical(other.name, name) || other.name == name)&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,eigaId,originalName,image,lastEpisode,lastUpdate,notice,countSub,countDub,rate,pending,preRelease,description);

@override
String toString() {
  return 'Eiga(name: $name, eigaId: $eigaId, originalName: $originalName, image: $image, lastEpisode: $lastEpisode, lastUpdate: $lastUpdate, notice: $notice, countSub: $countSub, countDub: $countDub, rate: $rate, pending: $pending, preRelease: $preRelease, description: $description)';
}


}

/// @nodoc
abstract mixin class $EigaCopyWith<$Res>  {
  factory $EigaCopyWith(Eiga value, $Res Function(Eiga) _then) = _$EigaCopyWithImpl;
@useResult
$Res call({
 String name, String eigaId, String? originalName, OImage image, EigaEpisode? lastEpisode, DateTime? lastUpdate, String? notice, int? countSub, int? countDub, double? rate, bool pending, DateTime? preRelease, String? description
});


$OImageCopyWith<$Res> get image;$EigaEpisodeCopyWith<$Res>? get lastEpisode;

}
/// @nodoc
class _$EigaCopyWithImpl<$Res>
    implements $EigaCopyWith<$Res> {
  _$EigaCopyWithImpl(this._self, this._then);

  final Eiga _self;
  final $Res Function(Eiga) _then;

/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? eigaId = null,Object? originalName = freezed,Object? image = null,Object? lastEpisode = freezed,Object? lastUpdate = freezed,Object? notice = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? rate = freezed,Object? pending = null,Object? preRelease = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastEpisode: freezed == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as bool,preRelease: freezed == preRelease ? _self.preRelease : preRelease // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res>? get lastEpisode {
    if (_self.lastEpisode == null) {
    return null;
  }

  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode!, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Eiga implements Eiga {
  const _Eiga({required this.name, required this.eigaId, this.originalName, required this.image, this.lastEpisode, this.lastUpdate, this.notice, this.countSub, this.countDub, this.rate, this.pending = false, this.preRelease, this.description});
  factory _Eiga.fromJson(Map<String, dynamic> json) => _$EigaFromJson(json);

@override final  String name;
@override final  String eigaId;
@override final  String? originalName;
@override final  OImage image;
@override final  EigaEpisode? lastEpisode;
@override final  DateTime? lastUpdate;
@override final  String? notice;
@override final  int? countSub;
@override final  int? countDub;
@override final  double? rate;
@override@JsonKey() final  bool pending;
@override final  DateTime? preRelease;
@override final  String? description;

/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaCopyWith<_Eiga> get copyWith => __$EigaCopyWithImpl<_Eiga>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Eiga&&(identical(other.name, name) || other.name == name)&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.image, image) || other.image == image)&&(identical(other.lastEpisode, lastEpisode) || other.lastEpisode == lastEpisode)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.countSub, countSub) || other.countSub == countSub)&&(identical(other.countDub, countDub) || other.countDub == countDub)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.preRelease, preRelease) || other.preRelease == preRelease)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,eigaId,originalName,image,lastEpisode,lastUpdate,notice,countSub,countDub,rate,pending,preRelease,description);

@override
String toString() {
  return 'Eiga(name: $name, eigaId: $eigaId, originalName: $originalName, image: $image, lastEpisode: $lastEpisode, lastUpdate: $lastUpdate, notice: $notice, countSub: $countSub, countDub: $countDub, rate: $rate, pending: $pending, preRelease: $preRelease, description: $description)';
}


}

/// @nodoc
abstract mixin class _$EigaCopyWith<$Res> implements $EigaCopyWith<$Res> {
  factory _$EigaCopyWith(_Eiga value, $Res Function(_Eiga) _then) = __$EigaCopyWithImpl;
@override @useResult
$Res call({
 String name, String eigaId, String? originalName, OImage image, EigaEpisode? lastEpisode, DateTime? lastUpdate, String? notice, int? countSub, int? countDub, double? rate, bool pending, DateTime? preRelease, String? description
});


@override $OImageCopyWith<$Res> get image;@override $EigaEpisodeCopyWith<$Res>? get lastEpisode;

}
/// @nodoc
class __$EigaCopyWithImpl<$Res>
    implements _$EigaCopyWith<$Res> {
  __$EigaCopyWithImpl(this._self, this._then);

  final _Eiga _self;
  final $Res Function(_Eiga) _then;

/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? eigaId = null,Object? originalName = freezed,Object? image = null,Object? lastEpisode = freezed,Object? lastUpdate = freezed,Object? notice = freezed,Object? countSub = freezed,Object? countDub = freezed,Object? rate = freezed,Object? pending = null,Object? preRelease = freezed,Object? description = freezed,}) {
  return _then(_Eiga(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage,lastEpisode: freezed == lastEpisode ? _self.lastEpisode : lastEpisode // ignore: cast_nullable_to_non_nullable
as EigaEpisode?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as String?,countSub: freezed == countSub ? _self.countSub : countSub // ignore: cast_nullable_to_non_nullable
as int?,countDub: freezed == countDub ? _self.countDub : countDub // ignore: cast_nullable_to_non_nullable
as int?,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as bool,preRelease: freezed == preRelease ? _self.preRelease : preRelease // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get image {
  
  return $OImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of Eiga
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res>? get lastEpisode {
    if (_self.lastEpisode == null) {
    return null;
  }

  return $EigaEpisodeCopyWith<$Res>(_self.lastEpisode!, (value) {
    return _then(_self.copyWith(lastEpisode: value));
  });
}
}

// dart format on
