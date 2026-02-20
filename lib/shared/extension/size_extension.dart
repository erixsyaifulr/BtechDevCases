import '/shared/extension/screen_util.dart';

extension SizeExtensions on num {
  double get w => ScreenUtil.setWidth(toDouble());
  double get h => ScreenUtil.setHeight(toDouble());
  double get r => ScreenUtil.setHeight(toDouble());
  double get sp => ScreenUtil.setSp(toDouble());
}
