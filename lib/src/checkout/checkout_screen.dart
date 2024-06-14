import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/cart/cart.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cart});
  final List<Cart> cart;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final firebaseService = getIt<FirebaseService>();
  double subtotal = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cart
          .map((item) => setState(() {
                subtotal += item.itemPrice * item.quantity;
              }))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Order Summary',
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
              const SizedBox(height: 5),
              Text('\$${subtotal + 20}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(
              onPressed: () => firebaseService.createDocument(collection: 'orders', userData: {
                    'quantity': widget.cart.length,
                    'status': 'shipping',
                    'total': subtotal + 20,
                    'userId': firebaseService.getUserId(),
                  }).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Checkout Successful!')),
                    );
                    context.router.replaceNamed('/discovery/order');
                  }),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child: Text('PAYMENT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ))
        ],
      ),
      content: [
        const SizedBox(height: 30),
        const Text('Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const InformationTile(text: 'Payment Method', value: 'Credit Card'),
        const Divider(),
        const SizedBox(height: 20),
        const InformationTile(text: 'Location', value: 'Semarang, Indonesia'),
        const SizedBox(height: 30),
        const Text('Order Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...widget.cart.map((item) {
          return DetailTile(item: item);
        }),
        const SizedBox(height: 30),
        const Text('Payment Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        PaymentTile(text: 'Sub Total', amount: subtotal),
        const PaymentTile(text: 'Shipping', amount: 20),
        const Divider(),
        const SizedBox(height: 20),
        PaymentTile(text: 'Total Order', amount: subtotal + 20, isTotal: true),
        const SizedBox(height: 30),
      ],
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, this.isTotal = false, required this.text, required this.amount});
  final bool isTotal;
  final String text;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
            if (!isTotal) Text('\$$amount', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            if (isTotal) Text('\$$amount.00', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class DetailTile extends StatelessWidget {
  const DetailTile({super.key, required this.item});
  final Cart item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item.brand} . ${item.color} . ${item.size} . Qty ${item.quantity}', style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
                Text('\$${item.quantity * item.itemPrice}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class InformationTile extends StatelessWidget {
  const InformationTile({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(value, style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
                ],
              ),
            ),
            Icon(CupertinoIcons.chevron_forward, color: ShoeslyColors.primaryNeutral.shade300)
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
