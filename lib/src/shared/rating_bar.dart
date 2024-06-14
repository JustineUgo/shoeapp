// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key, required this.rating,
  });
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SvgPicture.asset(ShoeslyIcons.rateIcon, color: index < rating ? null : ShoeslyColors.primaryNeutral.shade100),
              )),
    );
  }
}
