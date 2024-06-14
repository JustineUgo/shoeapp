// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoesly_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoeslyUser _$ShoeslyUserFromJson(Map<String, dynamic> json) {
  return _ShoeslyUser.fromJson(json);
}

/// @nodoc
mixin _$ShoeslyUser {
  List<String> get orders => throw _privateConstructorUsedError;
  List<String> get wishlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoeslyUserCopyWith<ShoeslyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoeslyUserCopyWith<$Res> {
  factory $ShoeslyUserCopyWith(
          ShoeslyUser value, $Res Function(ShoeslyUser) then) =
      _$ShoeslyUserCopyWithImpl<$Res, ShoeslyUser>;
  @useResult
  $Res call({List<String> orders, List<String> wishlist});
}

/// @nodoc
class _$ShoeslyUserCopyWithImpl<$Res, $Val extends ShoeslyUser>
    implements $ShoeslyUserCopyWith<$Res> {
  _$ShoeslyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? wishlist = null,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoeslyUserImplCopyWith<$Res>
    implements $ShoeslyUserCopyWith<$Res> {
  factory _$$ShoeslyUserImplCopyWith(
          _$ShoeslyUserImpl value, $Res Function(_$ShoeslyUserImpl) then) =
      __$$ShoeslyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> orders, List<String> wishlist});
}

/// @nodoc
class __$$ShoeslyUserImplCopyWithImpl<$Res>
    extends _$ShoeslyUserCopyWithImpl<$Res, _$ShoeslyUserImpl>
    implements _$$ShoeslyUserImplCopyWith<$Res> {
  __$$ShoeslyUserImplCopyWithImpl(
      _$ShoeslyUserImpl _value, $Res Function(_$ShoeslyUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? wishlist = null,
  }) {
    return _then(_$ShoeslyUserImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wishlist: null == wishlist
          ? _value._wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoeslyUserImpl implements _ShoeslyUser {
  const _$ShoeslyUserImpl(
      {final List<String> orders = const [],
      final List<String> wishlist = const []})
      : _orders = orders,
        _wishlist = wishlist;

  factory _$ShoeslyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoeslyUserImplFromJson(json);

  final List<String> _orders;
  @override
  @JsonKey()
  List<String> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<String> _wishlist;
  @override
  @JsonKey()
  List<String> get wishlist {
    if (_wishlist is EqualUnmodifiableListView) return _wishlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wishlist);
  }

  @override
  String toString() {
    return 'ShoeslyUser(orders: $orders, wishlist: $wishlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoeslyUserImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._wishlist, _wishlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_wishlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoeslyUserImplCopyWith<_$ShoeslyUserImpl> get copyWith =>
      __$$ShoeslyUserImplCopyWithImpl<_$ShoeslyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoeslyUserImplToJson(
      this,
    );
  }
}

abstract class _ShoeslyUser implements ShoeslyUser {
  const factory _ShoeslyUser(
      {final List<String> orders,
      final List<String> wishlist}) = _$ShoeslyUserImpl;

  factory _ShoeslyUser.fromJson(Map<String, dynamic> json) =
      _$ShoeslyUserImpl.fromJson;

  @override
  List<String> get orders;
  @override
  List<String> get wishlist;
  @override
  @JsonKey(ignore: true)
  _$$ShoeslyUserImplCopyWith<_$ShoeslyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
