// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i14;
import 'package:shoesly/models/brand/brand.dart' as _i15;
import 'package:shoesly/models/cart/cart.dart' as _i13;
import 'package:shoesly/models/filter/filter.dart' as _i16;
import 'package:shoesly/models/product/product.dart' as _i17;
import 'package:shoesly/models/review/review.dart' as _i18;
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
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CheckoutScreen(
          key: args.key,
          cart: args.cart,
        ),
      );
    },
    DiscoveryRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DiscoveryScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.FilterScreen(
          key: args.key,
          brands: args.brands,
          filter: args.filter,
        ),
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
          brand: args.brand,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ReviewScreen(
          key: args.key,
          reviews: args.reviews,
        ),
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
class CheckoutRoute extends _i11.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i12.Key? key,
    required List<_i13.Cart> cart,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CheckoutRoute.name,
          args: CheckoutRouteArgs(
            key: key,
            cart: cart,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i11.PageInfo<CheckoutRouteArgs> page =
      _i11.PageInfo<CheckoutRouteArgs>(name);
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    required this.cart,
  });

  final _i12.Key? key;

  final List<_i13.Cart> cart;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, cart: $cart}';
  }
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
class FilterRoute extends _i11.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i14.Key? key,
    required List<_i15.Brand> brands,
    required _i16.ProductFilter filter,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          FilterRoute.name,
          args: FilterRouteArgs(
            key: key,
            brands: brands,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i11.PageInfo<FilterRouteArgs> page =
      _i11.PageInfo<FilterRouteArgs>(name);
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.brands,
    required this.filter,
  });

  final _i14.Key? key;

  final List<_i15.Brand> brands;

  final _i16.ProductFilter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, brands: $brands, filter: $filter}';
  }
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
    _i14.Key? key,
    required _i17.Product product,
    required _i15.Brand brand,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
            brand: brand,
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
    required this.brand,
  });

  final _i14.Key? key;

  final _i17.Product product;

  final _i15.Brand brand;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product, brand: $brand}';
  }
}

/// generated route for
/// [_i9.ReviewScreen]
class ReviewRoute extends _i11.PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({
    _i14.Key? key,
    required List<_i18.Review> reviews,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ReviewRoute.name,
          args: ReviewRouteArgs(
            key: key,
            reviews: reviews,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const _i11.PageInfo<ReviewRouteArgs> page =
      _i11.PageInfo<ReviewRouteArgs>(name);
}

class ReviewRouteArgs {
  const ReviewRouteArgs({
    this.key,
    required this.reviews,
  });

  final _i14.Key? key;

  final List<_i18.Review> reviews;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, reviews: $reviews}';
  }
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
