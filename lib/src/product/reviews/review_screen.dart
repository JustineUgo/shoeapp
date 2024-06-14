import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/review/review.dart';
import 'package:shoesly/src/product/widget/review_tile.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.reviews});
  final List<Review> reviews;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double calculateAverageRating() {
    int totalRating = widget.reviews.fold(0, (sum, review) => sum + review.rating);
    return totalRating / widget.reviews.length;
  }

  int? ratingFilter;

  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Review (${widget.reviews.length})',
      padding: const EdgeInsets.only(left: 30),
      trailingIcon: Row(
        children: [
          SvgPicture.asset(ShoeslyIcons.star),
          const SizedBox(width: 4),
          Text('${calculateAverageRating()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(width: 30),
        ],
      ),
      content: [
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  ratingFilter = null;
                }),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ratingFilter == null ? null : ShoeslyColors.primaryNeutral.shade300),
                  ),
                ),
              ),
              ...List.generate(
                  5,
                  (index) => GestureDetector(
                        onTap: () => setState(() {
                          ratingFilter = 5 - index;
                        }),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            '${5 - index} Stars',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: ratingFilter == (5 - index) ? null : ShoeslyColors.primaryNeutral.shade300),
                          ),
                        ),
                      )),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            children: [
              ...widget.reviews.where((element) {
                if (ratingFilter == null) {
                  return true;
                } else {
                  return ratingFilter == element.rating;
                }
              }).map((review) => ReviewTile(review: review)),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
