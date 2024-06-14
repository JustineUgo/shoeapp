// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      color: json['color'] as String,
      brand: json['brand'] as String,
      itemPrice: (json['itemPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'size': instance.size,
      'color': instance.color,
      'brand': instance.brand,
      'itemPrice': instance.itemPrice,
    };
