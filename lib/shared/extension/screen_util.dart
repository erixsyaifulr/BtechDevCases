import 'package:flutter/widgets.dart';

class ScreenUtil {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;

  static late double _designWidth;
  static late double _designHeight;

  static bool _initialized = false;

  static void init(
    BuildContext context, {
    double designWidth = 360,
    double designHeight = 800,
  }) {
    if (_initialized) return;

    final size = MediaQuery.of(context).size;

    _screenWidth = size.width;
    _screenHeight = size.height;

    _designWidth = designWidth;
    _designHeight = designHeight;

    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;

    _initialized = true;
  }

  static double setWidth(double width) => width * _scaleWidth;
  static double setHeight(double height) => height * _scaleHeight;
  static double setSp(double fontSize) => fontSize * _scaleWidth;
  static double setRadius(double radius) => radius * _scaleWidth;
}
