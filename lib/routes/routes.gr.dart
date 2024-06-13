// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:shoesly/models/product/product.dart' as _i6;
import 'package:shoesly/src/home/discovery/discovery_screen.dart' as _i1;
import 'package:shoesly/src/home/filter/filter_screen.dart' as _i2;
import 'package:shoesly/src/product/product_screen.dart' as _i3;

abstract class $ShoeslyRouter extends _i4.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DiscoveryRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FilterScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DiscoveryScreen]
class DiscoveryRoute extends _i4.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FilterScreen]
class FilterRoute extends _i4.PageRouteInfo<void> {
  const FilterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProductScreen]
class ProductRoute extends _i4.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i5.Key? key,
    required _i6.Product product,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i4.PageInfo<ProductRouteArgs> page =
      _i4.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i5.Key? key;

  final _i6.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}
