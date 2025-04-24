// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Option {
  String get name;
  String get value;
  bool get selected;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OptionCopyWith<Option> get copyWith =>
      _$OptionCopyWithImpl<Option>(this as Option, _$identity);

  /// Serializes this Option to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Option &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, selected);

  @override
  String toString() {
    return 'Option(name: $name, value: $value, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) _then) =
      _$OptionCopyWithImpl;
  @useResult
  $Res call({String name, String value, bool selected});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res> implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._self, this._then);

  final Option _self;
  final $Res Function(Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? selected = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Option implements Option {
  const _Option(
      {required this.name, required this.value, this.selected = false});
  factory _Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  @override
  final String name;
  @override
  final String value;
  @override
  @JsonKey()
  final bool selected;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OptionCopyWith<_Option> get copyWith =>
      __$OptionCopyWithImpl<_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Option &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, selected);

  @override
  String toString() {
    return 'Option(name: $name, value: $value, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$OptionCopyWith(_Option value, $Res Function(_Option) _then) =
      __$OptionCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String value, bool selected});
}

/// @nodoc
class __$OptionCopyWithImpl<$Res> implements _$OptionCopyWith<$Res> {
  __$OptionCopyWithImpl(this._self, this._then);

  final _Option _self;
  final $Res Function(_Option) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? selected = null,
  }) {
    return _then(_Option(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _self.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$Filter {
  String get name;
  String get key;
  bool get multiple;
  List<Option> get options;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterCopyWith<Filter> get copyWith =>
      _$FilterCopyWithImpl<Filter>(this as Filter, _$identity);

  /// Serializes this Filter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Filter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.multiple, multiple) ||
                other.multiple == multiple) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, multiple,
      const DeepCollectionEquality().hash(options));

  @override
  String toString() {
    return 'Filter(name: $name, key: $key, multiple: $multiple, options: $options)';
  }
}

/// @nodoc
abstract mixin class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) _then) =
      _$FilterCopyWithImpl;
  @useResult
  $Res call({String name, String key, bool multiple, List<Option> options});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res> implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._self, this._then);

  final Filter _self;
  final $Res Function(Filter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? multiple = null,
    Object? options = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      multiple: null == multiple
          ? _self.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Filter implements Filter {
  const _Filter(
      {required this.name,
      required this.key,
      required this.multiple,
      required final List<Option> options})
      : _options = options;
  factory _Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  @override
  final String name;
  @override
  final String key;
  @override
  final bool multiple;
  final List<Option> _options;
  @override
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterCopyWith<_Filter> get copyWith =>
      __$FilterCopyWithImpl<_Filter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FilterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.multiple, multiple) ||
                other.multiple == multiple) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, multiple,
      const DeepCollectionEquality().hash(_options));

  @override
  String toString() {
    return 'Filter(name: $name, key: $key, multiple: $multiple, options: $options)';
  }
}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) =
      __$FilterCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String key, bool multiple, List<Option> options});
}

/// @nodoc
class __$FilterCopyWithImpl<$Res> implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? multiple = null,
    Object? options = null,
  }) {
    return _then(_Filter(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      multiple: null == multiple
          ? _self.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

// dart format on
