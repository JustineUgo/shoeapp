import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/src/product/widget/review_tile.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: '',
      trailingIcon: GestureDetector(
        onTap: ()=> context.router.push(const CartRoute()),
        child: SvgPicture.asset(ShoeslyIcons.cartIcon)),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
              const Text('\$235.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text('ADD TO CART', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)))
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
              child: Image.asset(ShoeslyImages.shoe),
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
        const Text('Jordan 1 Retro High Tie Dye', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: [
            SvgPicture.asset(ShoeslyIcons.rateIcon),
            const SizedBox(width: 5),
            SvgPicture.asset(ShoeslyIcons.rateIcon),
            const SizedBox(width: 5),
            SvgPicture.asset(ShoeslyIcons.rateIcon),
            const SizedBox(width: 5),
            const Text('4.5', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5),
            const Text('(1045 Reviews)', style: TextStyle(fontSize: 11)),
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
        const Text('Review (1045)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 10),
        ...List.generate(3, (index) => const ReviewTile()),
        TextButton(
          onPressed: () => context.router.push(const ReviewRoute()),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SEE ALL REVIEW', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
