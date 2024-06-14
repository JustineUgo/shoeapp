// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ordered _$OrderedFromJson(Map<String, dynamic> json) {
  return _Ordered.fromJson(json);
}

/// @nodoc
mixin _$Ordered {
  int get quantity => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderedCopyWith<Ordered> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderedCopyWith<$Res> {
  factory $OrderedCopyWith(Ordered value, $Res Function(Ordered) then) =
      _$OrderedCopyWithImpl<$Res, Ordered>;
  @useResult
  $Res call({int quantity, String status, double total, String userId});
}

/// @nodoc
class _$OrderedCopyWithImpl<$Res, $Val extends Ordered>
    implements $OrderedCopyWith<$Res> {
  _$OrderedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? status = null,
    Object? total = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderedImplCopyWith<$Res> implements $OrderedCopyWith<$Res> {
  factory _$$OrderedImplCopyWith(
          _$OrderedImpl value, $Res Function(_$OrderedImpl) then) =
      __$$OrderedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity, String status, double total, String userId});
}

/// @nodoc
class __$$OrderedImplCopyWithImpl<$Res>
    extends _$OrderedCopyWithImpl<$Res, _$OrderedImpl>
    implements _$$OrderedImplCopyWith<$Res> {
  __$$OrderedImplCopyWithImpl(
      _$OrderedImpl _value, $Res Function(_$OrderedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? status = null,
    Object? total = null,
    Object? userId = null,
  }) {
    return _then(_$OrderedImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderedImpl implements _Ordered {
  const _$OrderedImpl(
      {required this.quantity,
      required this.status,
      required this.total,
      required this.userId});

  factory _$OrderedImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderedImplFromJson(json);

  @override
  final int quantity;
  @override
  final String status;
  @override
  final double total;
  @override
  final String userId;

  @override
  String toString() {
    return 'Ordered(quantity: $quantity, status: $status, total: $total, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderedImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, status, total, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderedImplCopyWith<_$OrderedImpl> get copyWith =>
      __$$OrderedImplCopyWithImpl<_$OrderedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderedImplToJson(
      this,
    );
  }
}

abstract class _Ordered implements Ordered {
  const factory _Ordered(
      {required final int quantity,
      required final String status,
      required final double total,
      required final String userId}) = _$OrderedImpl;

  factory _Ordered.fromJson(Map<String, dynamic> json) = _$OrderedImpl.fromJson;

  @override
  int get quantity;
  @override
  String get status;
  @override
  double get total;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$OrderedImplCopyWith<_$OrderedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
