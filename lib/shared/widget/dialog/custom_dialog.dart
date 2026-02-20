import 'package:auto_route/auto_route.dart';
import 'package:btech_wallet_app/shared/constant/assets_icon.dart';
import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:flutter/material.dart';

import '/shared/extension/size_extension.dart';
import '../widget.dart';

void showSuccessDialog({
  required BuildContext context,
  String? title,
  required String message,
  Widget? bottomContent,
  bool? dismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissible!,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Stack(
          children: [
            if (dismissible)
              Positioned(
                top: 8.w,
                right: 8.w,
                child: InkWell(
                  onTap: () => context.maybePop(),
                  child: Image.asset(
                    AssetsIcon.close,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetsIcon.success,
                        width: 40.w,
                        height: 40.w,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomText(
                              text: title ?? "Sukses",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            CustomText(text: message, fontSize: 12.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomContent ?? const SizedBox(),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showErrorDialog({
  required BuildContext context,
  String? title,
  required String? message,
  bool? dismissible = true,
  Widget? bottomContent,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissible!,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Stack(
          children: [
            Visibility(
              visible: dismissible,
              child: Positioned(
                top: 8.w,
                right: 8.w,
                child: InkWell(
                  onTap: () => context.maybePop(),
                  child: Image.asset(
                    AssetsIcon.close,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AssetsIcon.error, width: 40.w, height: 40.w),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomText(
                              text: title ?? "Oops!",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SpaceHeight(5.h),
                            CustomText(
                              text: message ?? "",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomContent ?? const SizedBox(),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showConfirmationDialog({
  required BuildContext context,
  required String message,
  bool? dismissible = true,
  String? labelCancel,
  String? labelOk,
  required void Function()? onOk,
}) {
  showDialog(
    context: context,
    barrierDismissible: dismissible!,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Stack(
          children: [
            if (dismissible)
              Positioned(
                top: 8.w,
                right: 8.w,
                child: InkWell(
                  onTap: () => context.maybePop(),
                  child: Image.asset(
                    AssetsIcon.close,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
                  child: CustomText(
                    text: message,
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomButton(
                          margin: EdgeInsets.zero,
                          backgroundColor: Palette.white,
                          title: "Batal",
                          buttonRadius: 10.r,
                          buttonHeight: 40.h,
                          textColor: Palette.black,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              width: 1,
                              color: Palette.primary,
                            ),
                          ),
                          onPressed: () => context.maybePop(),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomButton(
                          buttonRadius: 10.r,
                          margin: EdgeInsets.zero,
                          title: labelOk ?? "Ok",
                          buttonHeight: 40.h,
                          onPressed: onOk,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showLoadingDialog({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomText(
                    text: Label.pleaseWait,
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.w),
                  Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
