import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/order/order.dart';
import 'package:shoesly/services/firebase_service.dart';

@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final firebaseService = getIt<FirebaseService>();
  bool isRetrying = false;

  void retryFetch() {
    setState(() {
      isRetrying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Orders', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: firebaseService.getCollectionStream(collection: 'orders', filterField: 'userId', ref: firebaseService.getUserId()),
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
                        return const Center(
                          child: Text(
                            'There are no orders\n Checkout to see your orders!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                      return Column(
                        children: data.docs.map(
                          (doc) {
                            Ordered order = Ordered.fromJson(doc.data() as Map<String, Object?>);
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    trailing: Text(order.total.toString()),
                                    title: Text('Qty ${order.quantity}'),
                                    subtitle: Text(order.status),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        ).toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
