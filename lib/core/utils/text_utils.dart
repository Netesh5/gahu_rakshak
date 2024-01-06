import 'package:flutter/services.dart';

class TextUtils {
  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static List<TextInputFormatter> get textOnlyFormater =>
      [FilteringTextInputFormatter(RegExp(r'[a-zA-Z ]'), allow: true)];

  static List<TextInputFormatter> get numberOnlyFormater =>
      [FilteringTextInputFormatter.digitsOnly];

  static List<TextInputFormatter> get decimalInputFormater =>
      [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))];
}

extension Datetime on String {
  DateTime? get parseAsDate {
    return DateTime.tryParse(this);
  }

  double? get parseAsDouble {
    return double.tryParse(this);
  }
}
