import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ShoeslyIcons.filterIcon),
            const SizedBox(width: 16),
            Text('FILTER', style: TextStyle(fontSize: 14, color: ShoeslyColors.primaryNeutral.shade50)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Discover', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () {}, icon: SvgPicture.asset(ShoeslyIcons.cartIcon)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok', 'Vans', 'Puma']
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
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Scrollbar(
                controller: controller,
                child: GridView.count(
                  controller: controller,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 30,
                  childAspectRatio: .68,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  children: List.generate(20, (index) {
                    return const ProductWidget();
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.only(top: 15, bottom: 22, left: 15, right: 15),
          height: (MediaQuery.of(context).size.width - 75) / 2,
          // width: (MediaQuery.of(context).size.width - 75) / 2,
          decoration: BoxDecoration(
            color: ShoeslyColors.primaryNeutral.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SvgPicture.asset(ShoeslyIcons.wishlistIcon), SvgPicture.asset(ShoeslyIcons.wishlistIcon)],
              ),
              Image.asset(ShoeslyImages.shoe, fit: BoxFit.cover),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text('Jordan 1 Retro High Tie Dye', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 5),
        Row(
          children: [
            SvgPicture.asset(ShoeslyIcons.rateIcon),
            const SizedBox(width: 1),
            const Text('4.5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
            const SizedBox(width: 5),
            Text('(1045 Reviews)', style: TextStyle(fontSize: 11, color: ShoeslyColors.primaryNeutral.shade300)),
          ],
        ),
        const Text('\$235,00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
