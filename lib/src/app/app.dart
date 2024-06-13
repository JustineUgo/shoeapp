// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: ShoeslyColors.primaryNeutral.shade50,
      routes: const [
        DiscoveryRoute(),
        OrderRoute(),
        WishlistRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ShoeslyColors.primaryNeutral,
          // unselectedItemColor: EcoColors.neutral,
          showSelectedLabels: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SvgPicture.asset(tabsRouter.activeIndex == 0 ? ShoeslyIcons.homeSelected : ShoeslyIcons.home),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SvgPicture.asset(tabsRouter.activeIndex == 1 ? ShoeslyIcons.orderSelected : ShoeslyIcons.order),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SvgPicture.asset(tabsRouter.activeIndex == 2 ? ShoeslyIcons.wishlistSelected : ShoeslyIcons.wishlist),
              ),
            ),
          ],
        );
      },
    );
  }
}
