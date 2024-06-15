// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFilterImpl _$$ProductFilterImplFromJson(Map<String, dynamic> json) =>
    _$ProductFilterImpl(
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String?,
      maxAmount: (json['maxAmount'] as num?)?.toDouble(),
      minAmount: (json['minAmount'] as num?)?.toDouble(),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      sortBy: $enumDecodeNullable(_$SortByEnumMap, json['sortBy']),
    );

Map<String, dynamic> _$$ProductFilterImplToJson(_$ProductFilterImpl instance) =>
    <String, dynamic>{
      'brands': instance.brands,
      'color': instance.color,
      'maxAmount': instance.maxAmount,
      'minAmount': instance.minAmount,
      'gender': _$GenderEnumMap[instance.gender],
      'sortBy': _$SortByEnumMap[instance.sortBy],
    };

const _$GenderEnumMap = {
  Gender.man: 'man',
  Gender.woman: 'woman',
  Gender.unisex: 'unisex',
};

const _$SortByEnumMap = {
  SortBy.mostRecent: 'mostRecent',
  SortBy.lowestPrice: 'lowestPrice',
  SortBy.highestReviews: 'highestReviews',
};
