import 'package:easy_localization/easy_localization.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';

class FormValidator {
  static String? validateEmail(String? value, [bool supportEmpty = false]) {
    if (supportEmpty && (value == null || value.isEmpty)) {
      return null;
    } else if (value == null) {
      return LocaleKeys.fieldCannotBeEmpty.tr(args: [LocaleKeys.email.tr()]);
    } else if (value.isEmpty) {
      return LocaleKeys.fieldCannotBeEmpty.tr(args: [LocaleKeys.email.tr()]);
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value, {String? label}) {
    if (value == null) {
      return LocaleKeys.fieldCannotBeEmpty
          .tr(args: [label ?? LocaleKeys.password.tr()]);
    } else if (value.isEmpty) {
      return LocaleKeys.fieldCannotBeEmpty
          .tr(args: [label ?? LocaleKeys.password.tr()]);
    } else if (value.length >= 6) {
      return null;
    } else {
      return LocaleKeys.invalidPasswordMessage
          .tr(args: [label ?? LocaleKeys.password.tr(), "6"]);
    }
  }

  static String? validateMobileNumber(String? value) {
    final RegExp regExp = RegExp(r'([9][678][0-6][0-9]{7})');
    if (value == null) {
      return LocaleKeys.fieldCannotBeEmpty
          .tr(args: [LocaleKeys.phoneNumber.tr()]);
    } else if (value.isEmpty) {
      return LocaleKeys.fieldCannotBeEmpty
          .tr(args: [LocaleKeys.phoneNumber.tr()]);
    } else if (value.length != 10 || !regExp.hasMatch(value)) {
      return LocaleKeys.enterValidMobileNumber.tr();
    } else {
      return null;
    }
  }

  static String? validateFieldNotEmpty(String? value, String fieldName) {
    if (value == null) {
      return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
    } else if (value.isEmpty) {
      return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
    } else {
      return null;
    }
  }
}
