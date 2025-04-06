// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EigaHome _$EigaHomeFromJson(Map<String, dynamic> json) {
  return _EigaHome.fromJson(json);
}

/// @nodoc
mixin _$EigaHome {
  Carousel? get carousel => throw _privateConstructorUsedError;
  List<HomeEigaCategory> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaHomeCopyWith<EigaHome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaHomeCopyWith<$Res> {
  factory $EigaHomeCopyWith(EigaHome value, $Res Function(EigaHome) then) =
      _$EigaHomeCopyWithImpl<$Res, EigaHome>;
  @useResult
  $Res call({Carousel? carousel, List<HomeEigaCategory> categories});

  $CarouselCopyWith<$Res>? get carousel;
}

/// @nodoc
class _$EigaHomeCopyWithImpl<$Res, $Val extends EigaHome>
    implements $EigaHomeCopyWith<$Res> {
  _$EigaHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carousel = freezed,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      carousel: freezed == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as Carousel?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HomeEigaCategory>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarouselCopyWith<$Res>? get carousel {
    if (_value.carousel == null) {
      return null;
    }

    return $CarouselCopyWith<$Res>(_value.carousel!, (value) {
      return _then(_value.copyWith(carousel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EigaHomeImplCopyWith<$Res>
    implements $EigaHomeCopyWith<$Res> {
  factory _$$EigaHomeImplCopyWith(
          _$EigaHomeImpl value, $Res Function(_$EigaHomeImpl) then) =
      __$$EigaHomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Carousel? carousel, List<HomeEigaCategory> categories});

  @override
  $CarouselCopyWith<$Res>? get carousel;
}

/// @nodoc
class __$$EigaHomeImplCopyWithImpl<$Res>
    extends _$EigaHomeCopyWithImpl<$Res, _$EigaHomeImpl>
    implements _$$EigaHomeImplCopyWith<$Res> {
  __$$EigaHomeImplCopyWithImpl(
      _$EigaHomeImpl _value, $Res Function(_$EigaHomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carousel = freezed,
    Object? categories = null,
  }) {
    return _then(_$EigaHomeImpl(
      carousel: freezed == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as Carousel?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<HomeEigaCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaHomeImpl implements _EigaHome {
  const _$EigaHomeImpl(
      {this.carousel, required final List<HomeEigaCategory> categories})
      : _categories = categories;

  factory _$EigaHomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaHomeImplFromJson(json);

  @override
  final Carousel? carousel;
  final List<HomeEigaCategory> _categories;
  @override
  List<HomeEigaCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'EigaHome(carousel: $carousel, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaHomeImpl &&
            (identical(other.carousel, carousel) ||
                other.carousel == carousel) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, carousel, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaHomeImplCopyWith<_$EigaHomeImpl> get copyWith =>
      __$$EigaHomeImplCopyWithImpl<_$EigaHomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaHomeImplToJson(
      this,
    );
  }
}

abstract class _EigaHome implements EigaHome {
  const factory _EigaHome(
      {final Carousel? carousel,
      required final List<HomeEigaCategory> categories}) = _$EigaHomeImpl;

  factory _EigaHome.fromJson(Map<String, dynamic> json) =
      _$EigaHomeImpl.fromJson;

  @override
  Carousel? get carousel;
  @override
  List<HomeEigaCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$EigaHomeImplCopyWith<_$EigaHomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
