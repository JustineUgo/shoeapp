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

  factory Product.fixture() => const Product(
        id: 'id',
        name: 'Jordan 1 Retro High Tie Dye',
        image: 'image',
        rating: 4.5,
        amount: 235.00,
        description:
            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
        gender: Gender.man,
        sizes: [39, 40, 41, 42],
        colors: ['red'],
      );
}

enum Gender { man, woman, unisex }
