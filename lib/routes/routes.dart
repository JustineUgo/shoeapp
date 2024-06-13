import 'package:auto_route/auto_route.dart';
import 'package:shoesly/routes/routes.gr.dart';

@AutoRouterConfig()
class ShoeslyRouter extends $ShoeslyRouter {
  @override
  List<AutoRoute> get routes => [
    RedirectRoute(path: '/', redirectTo: '/discovery'),
    AutoRoute(page: DiscoveryRoute.page, path: '/discovery'),
    AutoRoute(page: ProductRoute.page, path: '/product'),
    AutoRoute(page: FilterRoute.page, path: '/filter'),
    AutoRoute(page: ReviewRoute.page, path: '/reviews'),
    AutoRoute(page: CartRoute.page, path: '/cart'),
    AutoRoute(page: CheckoutRoute.page, path: '/checkout'),
  ];
}
