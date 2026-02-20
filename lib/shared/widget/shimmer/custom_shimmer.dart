import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/shared/extension/size_extension.dart';
import '../../constant/palette.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final Decoration? decoration;

  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    this.radius,
    this.borderRadius,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Palette.shimmer,
      highlightColor: Palette.highlightShimmer,
      child: Container(
        width: width,
        height: height,
        decoration:
            decoration ??
            BoxDecoration(
              color: Palette.shimmer,
              borderRadius:
                  borderRadius ?? BorderRadius.circular(radius ?? 10.r),
            ),
      ),
    );
  }
}
