import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class ToCartSheet extends StatelessWidget {
  const ToCartSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
