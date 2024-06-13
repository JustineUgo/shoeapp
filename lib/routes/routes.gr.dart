// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:shoesly/models/product/product.dart' as _i13;
import 'package:shoesly/src/app/app.dart' as _i1;
import 'package:shoesly/src/app/home/discovery/discovery_screen.dart' as _i5;
import 'package:shoesly/src/app/home/filter/filter_screen.dart' as _i6;
import 'package:shoesly/src/app/order/order_screen.dart' as _i7;
import 'package:shoesly/src/app/wishlist/wishlist_screen.dart' as _i10;
import 'package:shoesly/src/auth/auth_screen.dart' as _i2;
import 'package:shoesly/src/cart/cart_screen.dart' as _i3;
import 'package:shoesly/src/checkout/checkout_screen.dart' as _i4;
import 'package:shoesly/src/product/product_screen.dart' as _i8;
import 'package:shoesly/src/product/reviews/review_screen.dart' as _i9;

abstract class $ShoeslyRouter extends _i11.RootStackRouter {
  $ShoeslyRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CheckoutScreen(),
      );
    },
    DiscoveryRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FilterScreen(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OrderScreen(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProductScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ReviewScreen(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.WishlistScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppScreen]
class AppRoute extends _i11.PageRouteInfo<void> {
  const AppRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartScreen]
class CartRoute extends _i11.PageRouteInfo<void> {
  const CartRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckoutScreen]
class CheckoutRoute extends _i11.PageRouteInfo<void> {
  const CheckoutRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DiscoveryScreen]
class DiscoveryRoute extends _i11.PageRouteInfo<void> {
  const DiscoveryRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DiscoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FilterScreen]
class FilterRoute extends _i11.PageRouteInfo<void> {
  const FilterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OrderScreen]
class OrderRoute extends _i11.PageRouteInfo<void> {
  const OrderRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProductScreen]
class ProductRoute extends _i11.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i12.Key? key,
    required _i13.Product product,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i11.PageInfo<ProductRouteArgs> page =
      _i11.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i12.Key? key;

  final _i13.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i9.ReviewScreen]
class ReviewRoute extends _i11.PageRouteInfo<void> {
  const ReviewRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.WishlistScreen]
class WishlistRoute extends _i11.PageRouteInfo<void> {
  const WishlistRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
