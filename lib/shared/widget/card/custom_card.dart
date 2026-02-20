import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:flutter/material.dart';

import '/shared/extension/size_extension.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final List<BoxShadow>? boxShadow;
  final Color? backgroundColor;
  final BoxBorder? border;

  const CustomCard({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.width,
    this.boxShadow,
    this.backgroundColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin ?? EdgeInsets.all(16.w),
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? Palette.white,
        borderRadius: BorderRadius.circular(20.r),
        border: border,
        boxShadow:
            boxShadow ??
            const [
              BoxShadow(
                color: Palette.grey,
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
      ),
      child: child,
    );
  }
}
