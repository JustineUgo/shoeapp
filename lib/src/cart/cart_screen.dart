import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/src/cart/widget/cart_tile.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Cart',
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
              const SizedBox(height: 5),
              const Text('\$705.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(
            onPressed: () => context.router.push(const CheckoutRoute()),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
              child: Text('CHECK OUT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          )
        ],
      ),
      content: [
        const SizedBox(height: 30),
        CartTile(id: 'id', onDelete: () {}),
        const SizedBox(height: 30),
      ],
    );
  }
}
