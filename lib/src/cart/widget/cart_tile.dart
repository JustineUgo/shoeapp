// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/models/cart/cart.dart';
import 'package:shoesly/models/product/product.dart';
import 'package:shoesly/services/firebase_service.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, required this.onDelete, required this.cart});

  final Cart cart;
  final VoidCallback onDelete;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSwipe() {
    _controller.forward();
  }

  void _handleUndoSwipe() {
    _controller.reverse();
  }

  void _handleDelete() {
    widget.onDelete();
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < -50) {
          _handleSwipe();
        } else if (details.primaryVelocity! > 50) {
          _handleUndoSwipe();
        }
      },
      child: FutureBuilder<DocumentSnapshot>(
          future: getIt<FirebaseService>().getDocument(collection: 'products', docId: widget.cart.productId),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              Product product = Product.fromJson(snapshot.data!.data() as Map<String, Object?>);
              return Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 80,
                      height: 86,
                      decoration: const BoxDecoration(color: ShoeslyColors.error, borderRadius: BorderRadius.horizontal(left: Radius.circular(20))),
                      child: IconButton(
                        icon: SvgPicture.asset(ShoeslyIcons.deleteIcon),
                        onPressed: _handleDelete,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(-0.3, 0.0),
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    )),
                    child: Container(
                      height: 88,
                      color: ShoeslyColors.primaryNeutral.shade50,
                      child: Row(
                        children: [
                          Container(
                            height: 88,
                            width: 88,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: ShoeslyColors.primaryNeutral.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(product.image),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${widget.cart.brand} . ${widget.cart.color} . ${widget.cart.quantity}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${widget.cart.quantity * product.amount}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              if (widget.cart.quantity > 1) {
                                                getIt<FirebaseService>().updateDocument(
                                                    collection: 'cart',
                                                    docId: widget.cart.id!,
                                                    userData: widget.cart.copyWith(quantity: widget.cart.quantity - 1).toJson());
                                              }
                                            },
                                            child: SvgPicture.asset(ShoeslyIcons.cartMinusIcon,
                                                color: widget.cart.quantity > 1 ? ShoeslyColors.primaryNeutral : null)),
                                        const SizedBox(width: 10),
                                        Text(
                                          widget.cart.quantity.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                            onTap: () => getIt<FirebaseService>().updateDocument(
                                                collection: 'cart',
                                                docId: widget.cart.id!,
                                                userData: widget.cart.copyWith(quantity: widget.cart.quantity + 1).toJson()),
                                            child: SvgPicture.asset(ShoeslyIcons.cartPlusIcon)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
