import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/src/product/widget/review_tile.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Review (1045)',
      padding: const EdgeInsets.only(left: 30),
      trailingIcon: Row(
        children: [
          SvgPicture.asset(ShoeslyIcons.star),
          const SizedBox(width: 4),
          const Text('4.5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(width: 30),
        ],
      ),
      content: [
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['All', '5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Stars']
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
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            children: [
              ...List.generate(20, (index) => const ReviewTile()),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
