// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product, required this.brand});
  final Product product;
  final DocumentReference brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(ProductRoute(product: product)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 22, left: 15, right: 15),
            height: (MediaQuery.of(context).size.width - 75) / 2,
            decoration: BoxDecoration(
              color: ShoeslyColors.primaryNeutral.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
                      future: brand.get(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          String file = (snapshot.data!.data() as Map<String, Object?>)['file'] as String;
                          return SvgPicture.network(file, color: ShoeslyColors.primaryNeutral.shade300);
                        }
                        return const SizedBox.shrink();
                      }),
                    ),
                    SvgPicture.asset(product.isBookmarked ? ShoeslyIcons.wishlistSelected : ShoeslyIcons.wishlistIcon),
                  ],
                ),
                Image.network(
                  product.image,
                  fit: BoxFit.fitWidth,
                  width: (MediaQuery.of(context).size.width - 75) / 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(product.name, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Row(
            children: [
              SvgPicture.asset(ShoeslyIcons.rateIcon),
              const SizedBox(width: 1),
              Text(product.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
              const SizedBox(width: 5),
              Text('(1045 Reviews)', style: TextStyle(fontSize: 11, color: ShoeslyColors.primaryNeutral.shade300)),
            ],
          ),
          Text('\$${product.amount}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
