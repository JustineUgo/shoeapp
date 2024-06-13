// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:shoesly/models/product/product.dart' as _i7;
import 'package:shoesly/src/home/discovery/discovery_screen.dart' as _i1;
import 'package:shoesly/src/home/filter/filter_screen.dart' as _i2;
import 'package:shoesly/src/product/product_screen.dart' as _i3;
import 'package:shoesly/src/product/reviews/review_screen.dart' as _i4;

abstract class $ShoeslyRouter extends _i5.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DiscoveryRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FilterScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ReviewScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DiscoveryScreen]
class DiscoveryRoute extends _i5.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FilterScreen]
class FilterRoute extends _i5.PageRouteInfo<void> {
  const FilterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProductScreen]
class ProductRoute extends _i5.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i6.Key? key,
    required _i7.Product product,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i5.PageInfo<ProductRouteArgs> page =
      _i5.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i6.Key? key;

  final _i7.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.ReviewScreen]
class ReviewRoute extends _i5.PageRouteInfo<void> {
  const ReviewRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
