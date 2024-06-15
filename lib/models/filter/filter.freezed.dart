// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) {
  return _ProductFilter.fromJson(json);
}

/// @nodoc
mixin _$ProductFilter {
  List<Brand>? get brands => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double? get maxAmount => throw _privateConstructorUsedError;
  double? get minAmount => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  SortBy? get sortBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFilterCopyWith<ProductFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterCopyWith<$Res> {
  factory $ProductFilterCopyWith(
          ProductFilter value, $Res Function(ProductFilter) then) =
      _$ProductFilterCopyWithImpl<$Res, ProductFilter>;
  @useResult
  $Res call(
      {List<Brand>? brands,
      String? color,
      double? maxAmount,
      double? minAmount,
      Gender? gender,
      SortBy? sortBy});
}

/// @nodoc
class _$ProductFilterCopyWithImpl<$Res, $Val extends ProductFilter>
    implements $ProductFilterCopyWith<$Res> {
  _$ProductFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = freezed,
    Object? color = freezed,
    Object? maxAmount = freezed,
    Object? minAmount = freezed,
    Object? gender = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_value.copyWith(
      brands: freezed == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFilterImplCopyWith<$Res>
    implements $ProductFilterCopyWith<$Res> {
  factory _$$ProductFilterImplCopyWith(
          _$ProductFilterImpl value, $Res Function(_$ProductFilterImpl) then) =
      __$$ProductFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Brand>? brands,
      String? color,
      double? maxAmount,
      double? minAmount,
      Gender? gender,
      SortBy? sortBy});
}

/// @nodoc
class __$$ProductFilterImplCopyWithImpl<$Res>
    extends _$ProductFilterCopyWithImpl<$Res, _$ProductFilterImpl>
    implements _$$ProductFilterImplCopyWith<$Res> {
  __$$ProductFilterImplCopyWithImpl(
      _$ProductFilterImpl _value, $Res Function(_$ProductFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brands = freezed,
    Object? color = freezed,
    Object? maxAmount = freezed,
    Object? minAmount = freezed,
    Object? gender = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_$ProductFilterImpl(
      brands: freezed == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<Brand>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFilterImpl implements _ProductFilter {
  const _$ProductFilterImpl(
      {final List<Brand>? brands,
      this.color,
      this.maxAmount,
      this.minAmount,
      this.gender,
      this.sortBy})
      : _brands = brands;

  factory _$ProductFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFilterImplFromJson(json);

  final List<Brand>? _brands;
  @override
  List<Brand>? get brands {
    final value = _brands;
    if (value == null) return null;
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? color;
  @override
  final double? maxAmount;
  @override
  final double? minAmount;
  @override
  final Gender? gender;
  @override
  final SortBy? sortBy;

  @override
  String toString() {
    return 'ProductFilter(brands: $brands, color: $color, maxAmount: $maxAmount, minAmount: $minAmount, gender: $gender, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterImpl &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_brands),
      color,
      maxAmount,
      minAmount,
      gender,
      sortBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterImplCopyWith<_$ProductFilterImpl> get copyWith =>
      __$$ProductFilterImplCopyWithImpl<_$ProductFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFilterImplToJson(
      this,
    );
  }
}

abstract class _ProductFilter implements ProductFilter {
  const factory _ProductFilter(
      {final List<Brand>? brands,
      final String? color,
      final double? maxAmount,
      final double? minAmount,
      final Gender? gender,
      final SortBy? sortBy}) = _$ProductFilterImpl;

  factory _ProductFilter.fromJson(Map<String, dynamic> json) =
      _$ProductFilterImpl.fromJson;

  @override
  List<Brand>? get brands;
  @override
  String? get color;
  @override
  double? get maxAmount;
  @override
  double? get minAmount;
  @override
  Gender? get gender;
  @override
  SortBy? get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$ProductFilterImplCopyWith<_$ProductFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
