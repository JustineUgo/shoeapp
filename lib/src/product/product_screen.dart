import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void toCart() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: ShoeslyColors.primaryNeutral.shade50,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Wrap(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(ShoeslyIcons.checkIcon),
                    const SizedBox(height: 20),
                    const Text('Added to cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text('1 Item Total', style: TextStyle(fontSize: 14, color: ShoeslyColors.primaryNeutral.shade400)),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text('BACK EXPLORE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.router.push(const CartRoute());
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text('TO CART', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void addToCart() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
            decoration: BoxDecoration(
              color: ShoeslyColors.primaryNeutral.shade50,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Wrap(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(ShoeslyIcons.rectIcon),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add to cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 2, bottom: 2, left: 5),
                              child: Icon(Icons.close),
                            )),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Quantity', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(child: Text('1', style: TextStyle(fontSize: 14))),
                            Row(
                              children: [
                                SvgPicture.asset(ShoeslyIcons.cartMinusIcon),
                                const SizedBox(width: 20),
                                SvgPicture.asset(ShoeslyIcons.cartPlusIcon),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: ShoeslyColors.primaryNeutral),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Price', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
                              const SizedBox(height: 5),
                              const Text('\$235.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              toCart();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text('ADD TO CART', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
              const Text('\$235.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
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
