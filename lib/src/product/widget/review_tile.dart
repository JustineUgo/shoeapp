import 'package:flutter/material.dart';
import 'package:shoesly/models/review/review.dart';
import 'package:shoesly/src/shared/rating_bar.dart';
import 'package:shoesly/theme/color.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(review.image)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(review.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('Today', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
                  ],
                ),
                const SizedBox(height: 5),
                RatingBar(rating: review.rating),
                const SizedBox(height: 10),
                Text(review.text, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
