import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String image,
    required double rating,
    required double amount,
    required String description,
    required Gender gender,
    required List<double> sizes,
    required List<String> colors,

    //colors, sizes, reviews
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) => _$ProductFromJson(json);

}

enum Gender { man, woman, unisex }
