import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/routes/routes.gr.dart';
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
  final CollectionReference products = FirebaseFirestore.instance.collection('products');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                child: Row(
                  children: ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok', 'Vans', 'Puma']
                      .map(
                        (brand) => Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            brand,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: products.snapshots(),
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
                        Product product = Product.fromJson(data.docs[index].data() as Map<String, Object?>);
                        return ProductWidget(product: product);
                      }),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
