// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      text: json['text'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'text': instance.text,
      'rating': instance.rating,
    };
