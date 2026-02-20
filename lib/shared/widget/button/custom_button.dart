import 'package:flutter/material.dart';

import '/shared/extension/size_extension.dart';
import '../../constant/palette.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final bool? active, withPrefixIcon, withSuffixIcon;
  final IconData? icon;
  final String? assetsIcon;
  final Color? textColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? buttonRadius;
  final EdgeInsetsGeometry? margin;
  final Function()? onPressed;
  final bool? loading;
  final Decoration? decoration;
  final BorderSide side;
  final double? textSize;

  const CustomButton({
    super.key,
    required this.title,
    this.withPrefixIcon = false,
    this.withSuffixIcon = false,
    this.active = true,
    this.icon,
    this.assetsIcon,
    this.textColor,
    this.iconColor,
    this.backgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.margin,
    this.onPressed,
    this.loading = false,
    this.decoration,
    this.buttonRadius,
    this.side = BorderSide.none,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48.h,
      margin: margin ?? EdgeInsets.zero,
      decoration:
          decoration ??
          BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            active! ? backgroundColor ?? Palette.primary : Palette.grey,
          ),
          foregroundColor: WidgetStateProperty.all(
            active! ? backgroundColor ?? Palette.primary : Palette.grey,
          ),
          splashFactory: active!
              ? InkSplash.splashFactory
              : NoSplash.splashFactory,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius ?? 15.r),
              side: side,
            ),
          ),
        ),
        onPressed: active! ? onPressed : null,
        child: loading!
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Palette.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (withPrefixIcon!)
                    Container(
                      margin: EdgeInsets.only(right: 5.w),
                      child: assetsIcon == null
                          ? Icon(
                              icon,
                              size: 20.w,
                              color: iconColor ?? Palette.white,
                            )
                          : Image.asset(assetsIcon!, width: 20.w),
                    ),
                  Text(
                    title ?? "",
                    style: TextStyle(
                      fontSize: textSize,
                      color:
                          textColor ?? (active! ? Palette.white : Palette.grey),
                    ),
                  ),
                  if (withSuffixIcon!)
                    Container(
                      margin: EdgeInsets.only(left: 5.w),
                      child: assetsIcon == null
                          ? Icon(
                              icon,
                              size: 20.w,
                              color: iconColor ?? Palette.white,
                            )
                          : Image.asset(assetsIcon!, width: 20.w),
                    ),
                ],
              ),
      ),
    );
  }
}
