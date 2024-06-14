import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/src/product/widget/add_to_cart_sheet.dart';
import 'package:shoesly/src/product/widget/review_tile.dart';
import 'package:shoesly/src/product/widget/to_cart_sheet.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/src/shared/rating_bar.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product, required this.brand});
  final Product product;
  final Brand brand;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final firebaseService = getIt<FirebaseService>();
  String? color;
  double? size;

  @override
  void initState() {
    color = widget.product.colors.first;
    size = widget.product.sizes.first;
    super.initState();
  }

  bool isAddingToCart = false;
  void toCart() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const ToCartSheet();
        });
  }

  void addToCart() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AddToCartSheet(
            amount: widget.product.amount,
            onAddToCart: ({required price, required quantity}) {
              setState(() => isAddingToCart = true);
              firebaseService.createDocument(collection: 'cart', userData: {
                'userId': firebaseService.getUserId(),
                'productId': widget.product.id,
                'quantity': quantity,
                'color': color,
                'size': size,
                'brand': widget.brand.name,
                'itemPrice': widget.product.amount,
                'name': widget.product.name,
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to add product to cart')),
                );

                setState(() => isAddingToCart = false);
              }).then((value) {
                toCart();

                setState(() => isAddingToCart = false);
              });
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: '',
      trailingIcon: GestureDetector(onTap: () => context.router.push(const CartRoute()), child: SvgPicture.asset(ShoeslyIcons.cartIcon)),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
              const SizedBox(height: 5),
              Text('\$${widget.product.amount}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          if (isAddingToCart)
            const Center(child: CircularProgressIndicator())
          else
            ElevatedButton(
              onPressed: () => addToCart(),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text('ADD TO CART', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
        ],
      ),
      content: [
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.width - 60,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ShoeslyColors.primaryNeutral.shade200,
              ),
              child: Image.network(widget.product.image),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(radius: 4, backgroundColor: ShoeslyColors.primaryNeutral),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ShoeslyColors.primaryNeutral.shade50,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: ShoeslyColors.information,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: ShoeslyColors.information,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: ShoeslyColors.information,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(widget.product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            RatingBar(rating: widget.product.rating.toInt()),
            const SizedBox(width: 5),
            Text(widget.product.rating.toString(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5),
            Text('(${widget.product.reviews.length} Reviews)', style: const TextStyle(fontSize: 11)),
          ],
        ),
        const SizedBox(height: 30),
        const Text('Size', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          children: widget.product.sizes
              .map((size) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: ShoeslyColors.primaryNeutral.shade200)),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 15),
                    child: Text('${size.toInt()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: ShoeslyColors.primaryNeutral.shade400)),
                  ))
              .toList(),
        ),
        const SizedBox(height: 30),
        const Text('Description', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        Text(widget.product.description, style: TextStyle(fontSize: 14, color: ShoeslyColors.primaryNeutral.shade400)),
        const SizedBox(height: 30),
        if (widget.product.reviews.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Review (${widget.product.reviews.length})', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 10),
              if (widget.product.reviews.length < 3)
                ...widget.product.reviews.map((review) => ReviewTile(review: review))
              else
                ...List.generate(3, (index) => ReviewTile(review: widget.product.reviews[index])),
              TextButton(
                onPressed: () => context.router.push(ReviewRoute(reviews: widget.product.reviews)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SEE ALL REVIEW', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
