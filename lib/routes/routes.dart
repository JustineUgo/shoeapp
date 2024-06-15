import 'package:auto_route/auto_route.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/services/firebase_service.dart';

@AutoRouterConfig()
class ShoeslyRouter extends $ShoeslyRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(path: '/', redirectTo: '/discovery'),
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

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver;
    if (!getIt<FirebaseService>().isRegistered() && resolver.route.fullPath == "/auth") {
      resolver.next(true);
      return;
    }
    if (getIt<FirebaseService>().isRegistered()) {
      resolver.next(true);
    } else {
      resolver.redirect(const AuthRoute());
    }
  }
}
