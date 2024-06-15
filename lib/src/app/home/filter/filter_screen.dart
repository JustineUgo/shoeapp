// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/filter/filter.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.brands, required this.filter});
  final List<Brand> brands;
  final ProductFilter filter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ProductFilter filter = const ProductFilter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        filter = widget.filter;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Filter',
      padding: const EdgeInsets.only(left: 30),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextButton(
                  onPressed: () => setState(() {
                        filter = const ProductFilter();
                      }),
                  child: Text('Reset (${filter.types()})', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 15),
          Expanded(
              child: ElevatedButton(
                  onPressed: () => context.router.pop(filter), child: const Text('APPLY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
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
                .map((brand) => GestureDetector(
                      onTap: () => setState(() {
                        filter = filter.toggleBrand(brand);
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Column(
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
                                  ],
                                ),
                                if ((filter.brands ?? []).contains(brand))
                                  const Positioned(
                                    bottom: 4,
                                    right: 0,
                                    child: Icon(Icons.check_circle),
                                  ),
                              ],
                            ),
                            Text(brand.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text('1001 Items', style: TextStyle(fontSize: 11, color: ShoeslyColors.primaryNeutral.shade300)),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        // const SizedBox(height: 30),
        // const Text('Price Range', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        // const SizedBox(height: 20),
        const SizedBox(height: 30),
        const Text('Sort By', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [SortBy.mostRecent, SortBy.lowestPrice, SortBy.highestReviews].map((sort) {
              Widget text = Text(sort.displayName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16));
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: filter.sortBy == sort
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                              filter = filter.setSortBy(sort);
                            }),
                        child: text)
                    : TextButton(
                        onPressed: () => setState(() {
                              filter = filter.setSortBy(sort);
                            }),
                        child: text),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [Gender.man, Gender.woman, Gender.unisex].map((gender) {
              Widget text = Text(gender.displayName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16));
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: filter.gender == gender
                    ? ElevatedButton(
                        onPressed: () => setState(() {
                              filter = filter.toggleGender(gender);
                            }),
                        child: text)
                    : TextButton(
                        onPressed: () => setState(() {
                              filter = filter.toggleGender(gender);
                            }),
                        child: text),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Color', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <List>[
              ['Black', ShoeslyColors.primaryNeutral],
              ['White', ShoeslyColors.primaryNeutral.shade50],
              ['Red', ShoeslyColors.error]
            ]
                .map((color) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () => setState(() {
                                filter = filter.toggleColor(color.first.toLowerCase());
                              }),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: filter.color == color.first.toLowerCase() ? ShoeslyColors.primaryNeutral : ShoeslyColors.primaryNeutral.shade200))),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: color[1], borderRadius: BorderRadius.circular(20), border: Border.all(color: ShoeslyColors.primaryNeutral.shade200)),
                              ),
                              const SizedBox(width: 10),
                              Text(color[0], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
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
