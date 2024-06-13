// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:shoesly/models/product/product.dart' as _i8;
import 'package:shoesly/src/cart/cart_screen.dart' as _i1;
import 'package:shoesly/src/home/discovery/discovery_screen.dart' as _i2;
import 'package:shoesly/src/home/filter/filter_screen.dart' as _i3;
import 'package:shoesly/src/product/product_screen.dart' as _i4;
import 'package:shoesly/src/product/reviews/review_screen.dart' as _i5;

abstract class $ShoeslyRouter extends _i6.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartScreen(),
      );
    },
    DiscoveryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FilterScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ReviewScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartScreen]
class CartRoute extends _i6.PageRouteInfo<void> {
  const CartRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DiscoveryScreen]
class DiscoveryRoute extends _i6.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FilterScreen]
class FilterRoute extends _i6.PageRouteInfo<void> {
  const FilterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductScreen]
class ProductRoute extends _i6.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i7.Key? key,
    required _i8.Product product,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i6.PageInfo<ProductRouteArgs> page =
      _i6.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i7.Key? key;

  final _i8.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i5.ReviewScreen]
class ReviewRoute extends _i6.PageRouteInfo<void> {
  const ReviewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
