// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaHome {
  EigaCarousel? get carousel;
  List<HomeEigaCategory> get categories;

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EigaHomeCopyWith<EigaHome> get copyWith =>
      _$EigaHomeCopyWithImpl<EigaHome>(this as EigaHome, _$identity);

  /// Serializes this EigaHome to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EigaHome &&
            (identical(other.carousel, carousel) ||
                other.carousel == carousel) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, carousel, const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'EigaHome(carousel: $carousel, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $EigaHomeCopyWith<$Res> {
  factory $EigaHomeCopyWith(EigaHome value, $Res Function(EigaHome) _then) =
      _$EigaHomeCopyWithImpl;
  @useResult
  $Res call({EigaCarousel? carousel, List<HomeEigaCategory> categories});

  $EigaCarouselCopyWith<$Res>? get carousel;
}

/// @nodoc
class _$EigaHomeCopyWithImpl<$Res> implements $EigaHomeCopyWith<$Res> {
  _$EigaHomeCopyWithImpl(this._self, this._then);

  final EigaHome _self;
  final $Res Function(EigaHome) _then;

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carousel = freezed,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      carousel: freezed == carousel
          ? _self.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as EigaCarousel?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HomeEigaCategory>,
    ));
  }

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EigaCarouselCopyWith<$Res>? get carousel {
    if (_self.carousel == null) {
      return null;
    }

    return $EigaCarouselCopyWith<$Res>(_self.carousel!, (value) {
      return _then(_self.copyWith(carousel: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _EigaHome implements EigaHome {
  const _EigaHome(
      {this.carousel, required final List<HomeEigaCategory> categories})
      : _categories = categories;
  factory _EigaHome.fromJson(Map<String, dynamic> json) =>
      _$EigaHomeFromJson(json);

  @override
  final EigaCarousel? carousel;
  final List<HomeEigaCategory> _categories;
  @override
  List<HomeEigaCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EigaHomeCopyWith<_EigaHome> get copyWith =>
      __$EigaHomeCopyWithImpl<_EigaHome>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EigaHomeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EigaHome &&
            (identical(other.carousel, carousel) ||
                other.carousel == carousel) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, carousel, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'EigaHome(carousel: $carousel, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$EigaHomeCopyWith<$Res>
    implements $EigaHomeCopyWith<$Res> {
  factory _$EigaHomeCopyWith(_EigaHome value, $Res Function(_EigaHome) _then) =
      __$EigaHomeCopyWithImpl;
  @override
  @useResult
  $Res call({EigaCarousel? carousel, List<HomeEigaCategory> categories});

  @override
  $EigaCarouselCopyWith<$Res>? get carousel;
}

/// @nodoc
class __$EigaHomeCopyWithImpl<$Res> implements _$EigaHomeCopyWith<$Res> {
  __$EigaHomeCopyWithImpl(this._self, this._then);

  final _EigaHome _self;
  final $Res Function(_EigaHome) _then;

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? carousel = freezed,
    Object? categories = null,
  }) {
    return _then(_EigaHome(
      carousel: freezed == carousel
          ? _self.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as EigaCarousel?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HomeEigaCategory>,
    ));
  }

  /// Create a copy of EigaHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EigaCarouselCopyWith<$Res>? get carousel {
    if (_self.carousel == null) {
      return null;
    }

    return $EigaCarouselCopyWith<$Res>(_self.carousel!, (value) {
      return _then(_self.copyWith(carousel: value));
    });
  }
}

// dart format on
