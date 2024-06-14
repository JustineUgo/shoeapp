// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class AddToCartSheet extends StatelessWidget {
  const AddToCartSheet({super.key, required this.amount, required this.onAddToCart});
  final double amount;
  final Function({required double price, required int quantity}) onAddToCart;
  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return StatefulBuilder(builder: (context, setSt) {
      return Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: ShoeslyColors.primaryNeutral.shade50,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            Column(
              children: [
                SvgPicture.asset(ShoeslyIcons.rectIcon),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Add to cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                          child: Icon(Icons.close),
                        )),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quantity', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(quantity.toString(), style: const TextStyle(fontSize: 14))),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  if (quantity > 1) {
                                    setSt(() {
                                      --quantity;
                                    });
                                  }
                                },
                                child: SvgPicture.asset(ShoeslyIcons.cartMinusIcon, color: quantity > 1 ? ShoeslyColors.primaryNeutral : null)),
                            const SizedBox(width: 20),
                            InkWell(
                                onTap: () => setSt(() {
                                      quantity += 1;
                                    }),
                                child: SvgPicture.asset(ShoeslyIcons.cartPlusIcon)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: ShoeslyColors.primaryNeutral),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Price', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
                          const SizedBox(height: 5),
                          Text('\$${amount * quantity}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onAddToCart(quantity: quantity, price: amount * quantity);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text('ADD TO CART', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
