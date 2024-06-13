import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nolan Carder', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('Today', style: TextStyle(fontSize: 12, color: ShoeslyColors.primaryNeutral.shade300)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(ShoeslyIcons.rateIcon),
                          )),
                ),
                const SizedBox(height: 10),
                const Text('Perfect for keeping your feet dry and warm in damp conditions. ', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
