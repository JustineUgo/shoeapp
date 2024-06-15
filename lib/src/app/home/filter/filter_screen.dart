// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/brand/brand.dart';
import 'package:shoesly/models/filter/filter.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/src/shared/background.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/src/app/home/filter/filter_provider.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.brands, required this.filter});
  final List<Brand> brands;
  final ProductFilter filter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final firebaseService = getIt<FirebaseService>();
  Widget brandSection = Container();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final filterProvider = context.read<FilterProvider>();

        filterProvider.updateFilter(widget.filter);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    return ShoeslyBackground(
      title: 'Filter',
      padding: const EdgeInsets.only(left: 30),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextButton(
                  onPressed: () => filterProvider.updateFilter(const ProductFilter()),
                  child: Text('Reset (${filterProvider.filter.types()})', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 15),
          Expanded(
              child: ElevatedButton(
                  onPressed: () => context.router.pop(filterProvider.filter),
                  child: const Text('APPLY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
        ],
      ),
      content: [
        const SizedBox(height: 20),
        const Text('Brands', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        Builder(builder: (context) {
          FirebaseFirestore.instance.collection('products').get().then((value) {
            List brands = value.docs.map((doc) => (((doc.data() as Map<String, Object?>)['brand']) as DocumentReference).id).toList();

            brandSection = SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.brands.map((brand) {
                  int count = brands.where((element) => element == brand.name.toLowerCase()).length;
                  return GestureDetector(
                    onTap: () => filterProvider.updateFilter(filterProvider.filter.toggleBrand(brand)),
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
                              if ((filterProvider.filter.brands ?? []).contains(brand))
                                const Positioned(
                                  bottom: 4,
                                  right: 0,
                                  child: Icon(Icons.check_circle),
                                ),
                            ],
                          ),
                          Text(brand.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('$count Items', style: TextStyle(fontSize: 11, color: ShoeslyColors.primaryNeutral.shade300)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
            setState(() {});
          });
          return brandSection;
        }),
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
                child: filterProvider.filter.sortBy == sort
                    ? ElevatedButton(onPressed: () => filterProvider.updateFilter(filterProvider.filter.setSortBy(sort)), child: text)
                    : TextButton(onPressed: () => filterProvider.updateFilter(filterProvider.filter.setSortBy(sort)), child: text),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Price Range', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const SizedBox(height: 20),
        RangeSlider(
          min: 0,
          max: 500,
          divisions: 10,
          values: filterProvider.currentRangeValues,
          activeColor: ShoeslyColors.primaryNeutral,
          labels: RangeLabels(
            filterProvider.currentRangeValues.start.round().toString(),
            filterProvider.currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            filterProvider.setCurrentRangeValues(values);
            filterProvider.updatePriceRange(
              values.start,
              values.end,
            );
          },
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
                child: filterProvider.filter.gender == gender
                    ? ElevatedButton(onPressed: () => filterProvider.updateFilter(filterProvider.filter.toggleGender(gender)), child: text)
                    : TextButton(onPressed: () => filterProvider.updateFilter(filterProvider.filter.toggleGender(gender)), child: text),
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
                          onPressed: () => filterProvider.updateFilter(filterProvider.filter.toggleColor(color.first.toLowerCase())),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: filterProvider.filter.color == color.first.toLowerCase()
                                      ? ShoeslyColors.primaryNeutral
                                      : ShoeslyColors.primaryNeutral.shade200))),
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
