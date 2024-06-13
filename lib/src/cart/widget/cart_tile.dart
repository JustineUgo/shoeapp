import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, required this.id, required this.onDelete});
  final String id;
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
      child: Stack(
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
                    decoration: BoxDecoration(
                      color: ShoeslyColors.primaryNeutral.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Jordan 1 Retro High Tie Dye',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Nike . Red Grey . 40',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '\$235,00',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(ShoeslyIcons.cartMinusIcon),
                                const SizedBox(width: 10),
                                const Text(
                                  '2',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(ShoeslyIcons.cartPlusIcon),
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
      ),
    );
  }
}
