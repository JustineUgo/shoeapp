// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isBookmarked: json['isBookmarked'] ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'rating': instance.rating,
      'amount': instance.amount,
      'description': instance.description,
      'gender': _$GenderEnumMap[instance.gender]!,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'createdAt': instance.createdAt.toIso8601String(),
      'isBookmarked': instance.isBookmarked,
    };

const _$GenderEnumMap = {
  Gender.man: 'man',
  Gender.woman: 'woman',
  Gender.unisex: 'unisex',
};
