import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/filter/filter.dart';
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
  ProductFilter filter = const ProductFilter();
  List<Brand> brands = [];
  // BrandSegment segment = BrandSegment.all;
  // String brandFilter = '';
  bool isRetrying = false;

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

  void retryFetch() {
    setState(() {
      isRetrying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          var value = await context.router.push(FilterRoute(brands: brands, filter: filter));
          if (value != null) {
            setState(() {
              filter = value as ProductFilter;
            });
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (filter.types() == 0) SvgPicture.asset(ShoeslyIcons.filterIcon) else SvgPicture.asset(ShoeslyIcons.filterAppliedIcon),
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          firebaseService.logout();
                          context.router.replaceAll([const AuthRoute()]);
                        },
                        icon: const Icon(Icons.logout),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () => context.router.push(const CartRoute()),
                        icon: SvgPicture.asset(ShoeslyIcons.cartIcon),
                      ),
                    ],
                  ),
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
                      return Column(
                        children: [
                          Text('Error: ${snapshot.error}'),
                          ElevatedButton(
                            onPressed: retryFetch,
                            child: const Text('Retry'),
                          ),
                        ],
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting || isRetrying) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final data = snapshot.requireData;
                    brands = data.docs.map((doc) => Brand.fromJson(doc.data() as Map<String, Object?>)).toList();
                    return Row(
                      children: [
                        InkWell(
                          onTap: () => setState(() => filter = filter.removeBrands()),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'All',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ((filter.brands ?? []).length == brands.length || (filter.brands ?? []).isEmpty)
                                    ? ShoeslyColors.primaryNeutral
                                    : ShoeslyColors.primaryNeutral.shade300,
                              ),
                            ),
                          ),
                        ),
                        ...brands.map((brand) {
                          return InkWell(
                            onTap: () => setState(() => filter = filter.toggleBrand(brand)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                brand.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: (filter.brands ?? []).contains(brand) ? ShoeslyColors.primaryNeutral : ShoeslyColors.primaryNeutral.shade300,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  },
                ),
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
                    return Center(
                        child: Column(
                      children: [
                        Text('Error: ${userSnapshot.error}'),
                        ElevatedButton(
                          onPressed: retryFetch,
                          child: const Text('Retry'),
                        ),
                      ],
                    ));
                  }

                  final userDoc = userSnapshot.data;
                  ShoeslyUser user = ShoeslyUser.fromJson(userDoc!.data() as Map<String, Object?>);

                  return StreamBuilder<QuerySnapshot>(
                    stream: buildFilterProductQuery(filter).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Column(
                          children: [
                            Text('Error: ${snapshot.error}'),
                            ElevatedButton(
                              onPressed: retryFetch,
                              child: const Text('Retry'),
                            ),
                          ],
                        ));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting || isRetrying) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final data = snapshot.requireData;

                      if (data.size == 0) {
                        return const Center(
                          child: Text(
                            'No products found',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                      List<Product> products = data.docs.map((doc) {
                        Map<String, Object?> json = doc.data() as Map<String, Object?>;
                        Product product = Product.fromJson(json);
                        product = product.copyWith(modifiedBrand: json['brand'] as DocumentReference, isBookmarked: user.wishlist.contains(product.id));
                        return product;
                      }).toList();
                      products = sortCartItems(products, filter);

                      return GridView.count(
                        controller: controller,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30,
                        childAspectRatio: .68,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        children: products.map((product) {
                          return ProductWidget(
                            product: product,
                            brand: product.modifiedBrand as DocumentReference,
                            onWishlist: (productId) => onWishlist(product),
                          );
                        }).toList(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Query<Map<String, dynamic>> buildFilterProductQuery(ProductFilter filter) {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance.collection('products');

    if (filter.brands != null && filter.brands!.isNotEmpty) {
      List<DocumentReference> brandRefs = filter.brands!.map((brand) => FirebaseFirestore.instance.collection('brands').doc(brand.name.toLowerCase())).toList();
      query = query.where('brand', whereIn: brandRefs);
    }
    if (filter.color != null) {
      query = query.where('colors', arrayContains: filter.color);
    }
    if (filter.gender != null) {
      query = query.where('gender', isEqualTo: filter.gender!.name);
    }

    return query;
  }

  List<Product> sortCartItems(List<Product> products, ProductFilter? filter) {
    switch (filter?.sortBy) {
      case SortBy.mostRecent:
        products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case SortBy.lowestPrice:
        products.sort((a, b) => a.amount.compareTo(b.amount));
        break;
      case SortBy.highestReviews:
        products.sort((a, b) => b.reviews.length.compareTo(a.reviews.length));
        break;
      default:
        products;
        break;
    }
    if (filter?.minAmount != null && filter?.maxAmount != null) {
      products = products.where((product) {
        bool value = product.amount >= filter!.minAmount! && product.amount <= filter.maxAmount!;
        value;
        return value;
      }).toList();
    }
    products;
    return products;
  }
}
