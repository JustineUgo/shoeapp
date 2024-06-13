// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:shoesly/src/discovery/discovery_screen.dart' as _i1;

abstract class $ShoeslyRouter extends _i2.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DiscoveryRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DiscoveryScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.DiscoveryScreen]
class DiscoveryRoute extends _i2.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i2.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
