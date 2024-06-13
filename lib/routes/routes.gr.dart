// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:shoesly/models/product/product.dart' as _i12;
import 'package:shoesly/src/app/app.dart' as _i1;
import 'package:shoesly/src/app/home/discovery/discovery_screen.dart' as _i4;
import 'package:shoesly/src/app/home/filter/filter_screen.dart' as _i5;
import 'package:shoesly/src/app/order/order_screen.dart' as _i6;
import 'package:shoesly/src/app/wishlist/wishlist_screen.dart' as _i9;
import 'package:shoesly/src/cart/cart_screen.dart' as _i2;
import 'package:shoesly/src/checkout/checkout_screen.dart' as _i3;
import 'package:shoesly/src/product/product_screen.dart' as _i7;
import 'package:shoesly/src/product/reviews/review_screen.dart' as _i8;

abstract class $ShoeslyRouter extends _i10.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CheckoutScreen(),
      );
    },
    DiscoveryRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FilterScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OrderScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ReviewScreen(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WishlistScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppScreen]
class AppRoute extends _i10.PageRouteInfo<void> {
  const AppRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i10.PageRouteInfo<void> {
  const CartRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CheckoutScreen]
class CheckoutRoute extends _i10.PageRouteInfo<void> {
  const CheckoutRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DiscoveryScreen]
class DiscoveryRoute extends _i10.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FilterScreen]
class FilterRoute extends _i10.PageRouteInfo<void> {
  const FilterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OrderScreen]
class OrderRoute extends _i10.PageRouteInfo<void> {
  const OrderRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductScreen]
class ProductRoute extends _i10.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i11.Key? key,
    required _i12.Product product,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i10.PageInfo<ProductRouteArgs> page =
      _i10.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i11.Key? key;

  final _i12.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i8.ReviewScreen]
class ReviewRoute extends _i10.PageRouteInfo<void> {
  const ReviewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WishlistScreen]
class WishlistRoute extends _i10.PageRouteInfo<void> {
  const WishlistRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
