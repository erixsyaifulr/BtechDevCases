import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/shared/extension/size_extension.dart';
import '../../constant/palette.dart';
import '../widget.dart';

class FilledTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLines;
  final double? fontSize;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Color? textColor;
  final void Function()? onEditingComplete;
  final String? label;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? required;
  final void Function()? onTap;

  const FilledTextField({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.textInputAction,
    this.backgroundColor,
    this.margin,
    this.width,
    this.height,
    this.keyboardType,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.fontSize,
    this.prefixIcon,
    this.hintColor,
    this.textColor,
    this.onEditingComplete,
    this.suffixIcon,
    this.label,
    this.onChanged,
    this.obscureText,
    this.required = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  CustomText(text: label!),
                  if (required!)
                    CustomText(text: "*", fontSize: 12.sp, color: Palette.red),
                ],
              ),
            ),
          Container(
            width: width ?? double.infinity,
            height: height ?? 45.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? Palette.primary,
              border: Border.all(color: Palette.grey),
              borderRadius: BorderRadius.all(Radius.circular(25.r)),
            ),
            alignment: Alignment.center,
            child: TextFormField(
              onTap: onTap,
              readOnly: readOnly ?? false,
              enabled: enabled ?? true,
              textAlignVertical: TextAlignVertical.center,
              controller: textEditingController,
              maxLines: maxLines ?? 1,
              textInputAction: textInputAction ?? TextInputAction.next,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: textColor ?? Palette.black,
              ),
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                isDense: true,
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: hintColor ?? Palette.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
