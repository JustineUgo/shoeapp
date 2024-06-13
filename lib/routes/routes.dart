import 'package:auto_route/auto_route.dart';
import 'package:shoesly/routes/routes.gr.dart';

@AutoRouterConfig()
class ShoeslyRouter extends $ShoeslyRouter {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(path: '/', redirectTo: '/auth'),
        AutoRoute(page: AuthRoute.page, path: '/auth'),
        AutoRoute(
          page: AppRoute.page,
          path: '/discovery',
          children: [
            AutoRoute(page: DiscoveryRoute.page, path: ''),
            AutoRoute(page: OrderRoute.page, path: 'order'),
            AutoRoute(page: WishlistRoute.page, path: 'wishlist'),
          ],
        ),
        AutoRoute(page: ProductRoute.page, path: '/product'),
        AutoRoute(page: FilterRoute.page, path: '/filter'),
        AutoRoute(page: ReviewRoute.page, path: '/reviews'),
        AutoRoute(page: CartRoute.page, path: '/cart'),
        AutoRoute(page: CheckoutRoute.page, path: '/checkout'),
      ];
}
