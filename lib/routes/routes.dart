import 'package:auto_route/auto_route.dart';
import 'package:shoesly/routes/routes.gr.dart';

@AutoRouterConfig()
class ShoeslyRouter extends $ShoeslyRouter {
  @override
  List<AutoRoute> get routes => [
    RedirectRoute(path: '/', redirectTo: '/discovery'),
    AutoRoute(page: DiscoveryRoute.page, path: '/discovery'),
  ];
}
