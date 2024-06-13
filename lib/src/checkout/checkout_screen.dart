import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
              const Text('\$705.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                child:  Text('PAYMENT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ))
        ],
      ),
      content: [
        const SizedBox(height: 30),
        const Text('Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        InformationTile(),
        const Divider(),
        const SizedBox(height: 20),
        InformationTile(),
        const SizedBox(height: 30),
        const Text('Order Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        DetailTile(),
        DetailTile(),
        DetailTile(),
        const SizedBox(height: 30),
        const Text('Payment Detail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        PaymentTile(),
        PaymentTile(),
        const Divider(),
        const SizedBox(height: 20),
        PaymentTile(isTotal: true),
        const SizedBox(height: 30),
      ],
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, this.isTotal = false});
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total', style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
            if (!isTotal) const Text('\$705.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            if (isTotal) const Text('\$705.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Jordan 1 Retro High Tie Dye', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nike . Red Grey . 40 . Qty 1', style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
                const Text('\$235,00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
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
  });

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
                  const Text('Payment Method', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('Credit Card', style: TextStyle(fontSize: 14, color: ShoeslyColors.grey)),
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
