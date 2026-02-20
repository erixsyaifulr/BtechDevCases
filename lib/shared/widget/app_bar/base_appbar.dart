import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/palette.dart';

AppBar baseAppBar({
  Widget? title,
  SystemUiOverlayStyle? systemOverlayStyle,
  Color? backgroundColor,
  List<Widget>? actions,
  bool withBackButton = true,
  double? elevation,
  Function()? onPressed,
  bool centerTitle = true,
  double? toolbarHeight,
}) {
  return AppBar(
    surfaceTintColor: Palette.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: withBackButton,
    systemOverlayStyle:
        systemOverlayStyle ??
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Palette.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
    title: title ?? const SizedBox(),
    centerTitle: centerTitle,
    backgroundColor: backgroundColor ?? Palette.white,
    elevation: elevation ?? 0,
    actions: actions,
  );
}
