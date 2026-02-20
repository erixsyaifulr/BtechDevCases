import 'package:intl/intl.dart';

extension StringExt on String {
  String get toddMMMMYYYAndHHMM => convertToddMMMMYYYAndHHMM(this);
}

String convertToddMMMMYYYAndHHMM(String stringDate) {
  DateFormat format = DateFormat("dd MMMM yyyy HH:mm:ss");
  DateTime date = DateTime.parse(stringDate).toLocal();
  String convertedTime = format.format(date);
  return convertedTime;
}
