import 'package:flutter/cupertino.dart';

import '/shared/extension/size_extension.dart';
import '../../constant/palette.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? fontHeight;
  final TextDecoration? textDecoration;

  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontHeight,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        color: color ?? Palette.black,
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: fontHeight,
        decoration: textDecoration,
        decorationColor: Palette.grey,
        decorationThickness: 2,
      ),
    );
  }
}
