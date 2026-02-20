import 'package:flutter/services.dart';

class NoLeadingZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.text.startsWith('0')) {
      return TextEditingValue(
        text: '1',
        selection: const TextSelection.collapsed(offset: 1),
      );
    }

    return newValue;
  }
}
