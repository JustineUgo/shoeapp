import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/src/cart/widget/cart_tile.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

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
              const Text('\$705.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text('CHECK OUT', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)))
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
