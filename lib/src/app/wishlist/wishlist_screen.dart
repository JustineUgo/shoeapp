import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/models/shoesly_user/shoesly_user.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/src/app/home/discovery/widgets/product_widget.dart';

@RoutePage()
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final firebaseService = getIt<FirebaseService>();
  bool isRetrying = false;

  Future onWishlist(Product product) async {
    if (product.isBookmarked) {
      return await firebaseService.updateDocument(
        collection: 'users',
        docId: firebaseService.getUserId(),
        userData: {
          'wishlist': FieldValue.arrayRemove([product.id])
        },
      );
    } else {
      return await firebaseService.updateDocument(
        collection: 'users',
        docId: firebaseService.getUserId(),
        userData: {
          'wishlist': FieldValue.arrayUnion([product.id])
        },
      );
    }
  }

  void retryFetch() {
    setState(() {
      isRetrying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Wishlist', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                  stream: firebaseService.getDocumentStream(
                    collection: 'users',
                    docId: firebaseService.getUserId(),
                  ),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.hasError) {
                      return Column(
                        children: [
                          Text('Error: ${userSnapshot.error}'),
                          ElevatedButton(
                            onPressed: retryFetch,
                            child: const Text('Retry'),
                          ),
                        ],
                      );
                    }

                    if (userSnapshot.connectionState == ConnectionState.waiting || isRetrying) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final userDoc = userSnapshot.data;
                    if (userDoc == null || !userDoc.exists) {
                      return const Center(child: Text('No wishlist found'));
                    }
                    ShoeslyUser user = ShoeslyUser.fromJson(userDoc.data() as Map<String, Object?>);
                    if (user.wishlist.isEmpty) {
                      return const Center(child: Text('No items in wishlist'));
                    }

                    return FutureBuilder<List<DocumentSnapshot>>(
                      future: Future.wait(user.wishlist.map((productId) => firebaseService.getDocument(collection: 'products', docId: productId))),
                      builder: (context, productsSnapshot) {
                        if (productsSnapshot.hasError) {
                          return Column(
                            children: [
                              Text('Error: ${userSnapshot.error}'),
                              ElevatedButton(
                                onPressed: retryFetch,
                                child: const Text('Retry'),
                              ),
                            ],
                          );
                        }

                        if (productsSnapshot.connectionState == ConnectionState.waiting || isRetrying) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final productDocs = productsSnapshot.data ?? [];

                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30,
                            childAspectRatio: .68,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          itemCount: productDocs.length,
                          itemBuilder: (context, index) {
                            final productDoc = productDocs[index];
                            if (!productDoc.exists) {
                              return const Center(child: Text('Product not found'));
                            }

                            Map<String, Object?> json = productDoc.data() as Map<String, Object?>;
                            Product product = Product.fromJson(json);
                            product = product.copyWith(isBookmarked: user.wishlist.contains(product.id));
                            DocumentReference brand = json['brand'] as DocumentReference;

                            return ProductWidget(
                              product: product,
                              brand: brand,
                              onWishlist: (productId) => onWishlist(product),
                            );
                          },
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
