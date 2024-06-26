import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/cart/cart.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/services/firebase_service.dart';
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
  final firebaseService = getIt<FirebaseService>();
  List<Cart> cartItems = [];
  final ValueNotifier<double> grandTotalNotifier = ValueNotifier<double>(0);
  bool isRetrying = false;

  void retryFetch() {
    setState(() {
      isRetrying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Cart',
      footer: ValueListenableBuilder<double>(
          valueListenable: grandTotalNotifier,
          builder: (context, grandTotal, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Grand Total', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
                    const SizedBox(height: 5),
                    Text('\$$grandTotal', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                if (grandTotal > 0)
                  ElevatedButton(
                    onPressed: () => context.router.push(CheckoutRoute(cart: cartItems)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
                      child: Text('CHECK OUT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  )
              ],
            );
          }),
      content: [
        const SizedBox(height: 30),
        StreamBuilder<QuerySnapshot>(
            stream: firebaseService.getCollectionStream(collection: 'cart', filterField: 'userId', ref: firebaseService.getUserId()),
            builder: (context, cartSnapshot) {
              if (cartSnapshot.hasError) {
                return Column(
                  children: [
                    Text('Error: ${cartSnapshot.error}'),
                    ElevatedButton(
                      onPressed: retryFetch,
                      child: const Text('Retry'),
                    ),
                  ],
                );
              }

              if (cartSnapshot.connectionState == ConnectionState.waiting || isRetrying) {
                return const Center(child: CircularProgressIndicator());
              }

              final data = cartSnapshot.requireData;

              if (data.size == 0) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  grandTotalNotifier.value = 0;
                });
                return const Center(
                  child: Text('No item in cart'),
                );
              }
              double total = 0;
              cartItems = data.docs.map((doc) {
                Cart cart = Cart.fromJson(doc.data() as Map<String, Object?>);
                cart = cart.copyWith(id: doc.id);
                total += (cart.quantity * cart.itemPrice);
                return cart;
              }).toList();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                grandTotalNotifier.value = total;
              });

              return Column(
                children: cartItems
                    .map(
                      (item) => Column(
                        children: [
                          CartTile(onDelete: () => firebaseService.deleteDocument(collection: 'cart', docId: item.id!), cart: item),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )
                    .toList(),
              );
            }),
      ],
    );
  }
}
