// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoesly_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoeslyUserImpl _$$ShoeslyUserImplFromJson(Map<String, dynamic> json) =>
    _$ShoeslyUserImpl(
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      wishlist: (json['wishlist'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShoeslyUserImplToJson(_$ShoeslyUserImpl instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'wishlist': instance.wishlist,
    };
