import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/theme/color.dart';
import 'package:shoesly/util/assets.dart';

class ShoeslyBackground extends StatefulWidget {
  const ShoeslyBackground({super.key, required this.title, required this.content, this.footer, this.trailingIcon});
  final String title;
  final List<Widget> content;
  final Widget? footer;
  final Widget? trailingIcon;

  @override
  State<ShoeslyBackground> createState() => _ShoeslyBackgroundState();
}

class _ShoeslyBackgroundState extends State<ShoeslyBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () => context.router.removeLast(), icon: SvgPicture.asset(ShoeslyIcons.backIcon)),
                            Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                            widget.trailingIcon ?? Opacity(opacity: 0, child: SvgPicture.asset(ShoeslyIcons.cartIcon)),
                          ],
                        ),
                      ),
                      ...widget.content,
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.footer != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                decoration: BoxDecoration(
                  color: ShoeslyColors.primaryNeutral.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: widget.footer!,
              ),
          ],
        ),
      ),
    );
  }
}
