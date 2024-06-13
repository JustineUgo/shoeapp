// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:shoesly/models/product/product.dart' as _i9;
import 'package:shoesly/src/cart/cart_screen.dart' as _i1;
import 'package:shoesly/src/checkout/checkout_screen.dart' as _i2;
import 'package:shoesly/src/home/discovery/discovery_screen.dart' as _i3;
import 'package:shoesly/src/home/filter/filter_screen.dart' as _i4;
import 'package:shoesly/src/product/product_screen.dart' as _i5;
import 'package:shoesly/src/product/reviews/review_screen.dart' as _i6;

abstract class $ShoeslyRouter extends _i7.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CheckoutScreen(),
      );
    },
    DiscoveryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FilterScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ReviewScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartScreen]
class CartRoute extends _i7.PageRouteInfo<void> {
  const CartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CheckoutScreen]
class CheckoutRoute extends _i7.PageRouteInfo<void> {
  const CheckoutRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DiscoveryScreen]
class DiscoveryRoute extends _i7.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FilterScreen]
class FilterRoute extends _i7.PageRouteInfo<void> {
  const FilterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProductScreen]
class ProductRoute extends _i7.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i8.Key? key,
    required _i9.Product product,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i7.PageInfo<ProductRouteArgs> page =
      _i7.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i8.Key? key;

  final _i9.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i6.ReviewScreen]
class ReviewRoute extends _i7.PageRouteInfo<void> {
  const ReviewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
