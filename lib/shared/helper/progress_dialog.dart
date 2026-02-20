import 'package:btech_wallet_app/shared/constant/label.dart';
import 'package:btech_wallet_app/shared/constant/palette.dart';
import 'package:flutter/material.dart';

import '/shared/widget/text/custom_text.dart';

BuildContext? _dialogContext;

Future showProgressDialog({
  required BuildContext context,
  bool isDismissible = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible,
    barrierColor: Palette.black.withValues(alpha: 0.7),
    builder: (dialogCtx) {
      _dialogContext = dialogCtx;
      return PopScope(
        canPop: isDismissible,
        child: Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.all(64),
          backgroundColor: Palette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 100,
            height: 110,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: Label.pleaseWait,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 38,
                  height: 38,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void hideProgressDialog() {
  if (_dialogContext != null) {
    Navigator.of(_dialogContext!).pop();
    _dialogContext = null;
  }
}
