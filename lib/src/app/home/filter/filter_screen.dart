import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.brands});
  final List<Brand> brands;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Filter',
      padding: const EdgeInsets.only(left: 30),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TextButton(onPressed: () {}, child: const Text('Reset (4)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 15),
          Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('APPLY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
        ],
      ),
      content: [
        const SizedBox(height: 20),
        const Text('Brands', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.brands
                .map((brand) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ShoeslyColors.primaryNeutral.shade100,
                            ),
                            child: SvgPicture.network(brand.file),
                          ),
                          const SizedBox(height: 10),
                          Text(brand.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('1001 Items', style: TextStyle(fontSize: 11, color: ShoeslyColors.primaryNeutral.shade300)),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Price Range', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        const SizedBox(height: 30),
        const Text('Sort By', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['Most recent', 'Lowest price', 'Highest reviews']
                .map((sort) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: () {}, child: Text(sort, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['Man', 'Woman', 'Unisex']
                .map((sort) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(onPressed: () {}, child: Text(sort, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Color', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['Black', 'White', 'Red']
                .map((sort) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: ShoeslyColors.primaryNeutral.shade200)),
                              ),
                              const SizedBox(width: 10),
                              Text(sort, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                            ],
                          )),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
