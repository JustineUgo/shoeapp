// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderedImpl _$$OrderedImplFromJson(Map<String, dynamic> json) =>
    _$OrderedImpl(
      quantity: (json['quantity'] as num).toInt(),
      status: json['status'] as String,
      total: (json['total'] as num).toDouble(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$OrderedImplToJson(_$OrderedImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'status': instance.status,
      'total': instance.total,
      'userId': instance.userId,
    };
