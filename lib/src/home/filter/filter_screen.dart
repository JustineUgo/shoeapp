import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesly/src/shared/background.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return ShoeslyBackground(
      title: 'Filter',
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TextButton(onPressed: () {}, child: const Text('Reset (4)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 15),
          Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('APPLY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)))),
        ],
      ),
      content: [
      ],
    );
  }
}
