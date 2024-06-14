import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/models/shoesly_user/shoesly_user.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/src/app/home/discovery/widgets/product_widget.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final ScrollController controller = ScrollController();
  final firebaseService = getIt<FirebaseService>();
  BrandSegment segment = BrandSegment.all;
  String brandFilter = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => context.router.push(const FilterRoute()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ShoeslyIcons.filterIcon),
            const SizedBox(width: 16),
            Text('FILTER', style: TextStyle(fontSize: 14, color: ShoeslyColors.primaryNeutral.shade50)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Discover', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => context.router.push(const CartRoute()), icon: SvgPicture.asset(ShoeslyIcons.cartIcon)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<QuerySnapshot>(
                    stream: firebaseService.getCollectionStream(collection: 'brands'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            'All',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      //TODO: shimmer
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;
                      return Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() => segment = BrandSegment.all),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: segment == BrandSegment.all ? ShoeslyColors.primaryNeutral : ShoeslyColors.primaryNeutral.shade300,
                                ),
                              ),
                            ),
                          ),
                          ...data.docs.map(
                            (doc) {
                              Brand brand = Brand.fromJson(doc.data() as Map<String, Object?>);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    segment = BrandSegment.brand;
                                    brandFilter = doc.id;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    brand.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: (segment != BrandSegment.all && brandFilter == doc.id)
                                          ? ShoeslyColors.primaryNeutral
                                          : ShoeslyColors.primaryNeutral.shade300,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                  stream: firebaseService.getDocumentStream(
                    collection: 'users',
                    docId: firebaseService.getUserId(),
                  ),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (userSnapshot.hasError) {
                      return const Center(child: Text('Something went wrong'));
                    }

                    final userDoc = userSnapshot.data;
                    ShoeslyUser user = ShoeslyUser.fromJson(userDoc!.data() as Map<String, Object?>);

                    return StreamBuilder<QuerySnapshot>(
                        stream: firebaseService.getCollectionStream(
                          collection: 'products',
                          filterField: 'brand',
                          ref: segment == BrandSegment.brand ? FirebaseFirestore.instance.collection('brands').doc(brandFilter) : null,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(child: Text('Something went wrong'));
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          final data = snapshot.requireData;

                          return GridView.count(
                            controller: controller,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30,
                            childAspectRatio: .68,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            children: List.generate(data.size, (index) {
                              Map<String, Object?> json = data.docs[index].data() as Map<String, Object?>;
                              Product product = Product.fromJson(json);
                              product = product.copyWith(isBookmarked: user.wishlist.contains(product.id));
                              DocumentReference brand = json['brand'] as DocumentReference;
                              return ProductWidget(
                                product: product,
                                brand: brand,
                                onWishlist: (productId) => onWishlist(product),
                              );
                            }),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

enum BrandSegment { all, brand }
