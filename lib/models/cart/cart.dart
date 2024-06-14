import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String userId,
    required String productId,
    required int quantity,
    required int size,
    required String color,
    required String brand,
    required double itemPrice,

  }) = _Cart;

  factory Cart.fromJson(Map<String, Object?> json) => _$CartFromJson(json);
}



