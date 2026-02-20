import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/shared/extension/size_extension.dart';
import '../../constant/palette.dart';
import '../widget.dart';

class BorderedTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? readOnly;
  final bool? autofocus;
  final void Function(String)? onChanged;
  final String? errorText;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onEditingComplete;
  final double? fontSize;
  final Color? borderColor;
  final bool? enabled;

  const BorderedTextField({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.textInputAction,
    this.maxLines,
    this.margin,
    this.width,
    this.height,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap,
    this.inputFormatters,
    this.label,
    this.contentPadding,
    this.onEditingComplete,
    this.fontSize,
    this.borderColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 10.h),
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: CustomText(
                text: label!,
                fontSize: 12.sp,
                color: Palette.grey,
              ),
            ),
          SizedBox(
            height: height ?? 45.h,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: textEditingController,
              textInputAction: textInputAction ?? TextInputAction.next,
              keyboardType: keyboardType,
              maxLines: maxLines ?? 1,
              obscureText: obscureText!,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              readOnly: readOnly!,
              enabled: enabled,
              onTap: onTap,
              autofocus: autofocus!,
              style: GoogleFonts.poppins(
                fontSize: fontSize ?? 12.sp,
                color: Palette.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                isDense: true,
                hintText: hintText,
                errorText: errorText,
                hintStyle: GoogleFonts.poppins(
                  fontSize: fontSize ?? 12.sp,
                  color: Palette.grey,
                ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? Palette.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? Palette.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? Palette.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.red, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
