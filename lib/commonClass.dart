import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static SharedPreferences? prefs;
  static List serviceId = [];
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({this.regexSource});
  final String? regexSource;

  /// value: the input string
  /// returns: true if the input string is a full match for regexSource
  @override
  bool isValid(String value) {
    try {
      final regex = RegExp(regexSource!);
      final matches = regex.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class CreditNumberSubmitRegexValidator extends RegexValidator {
  CreditNumberSubmitRegexValidator()
      : super(regexSource: r'^\d{4}\s\d{4}\s\d{4}\s\d{4}$');
}

class CreditExpirySubmitRegexValidator extends RegexValidator {
  CreditExpirySubmitRegexValidator()
      : super(regexSource: r'^(0[1-9]|1[0-2])\/?[0-2][0-9]|3[0-1]$');
}

class CreditCvvSubmitRegexValidator extends RegexValidator {
  CreditCvvSubmitRegexValidator() : super(regexSource: r'^[0-9]{3,4}$');
}

class Validators {
  String? addressValidator(String? content) {
    if (content != null || content == " ") {
      return "Please Enter Address";
    }
    return null;
  }

  String? cityValidator(String? content) {
    if (content != null || content == " ") {
      return "Please Enter City Name";
    }
    return null;
  }

  String? postalCodeValidator(String? content) {
    if (content != null || content == " ") {
      return "Please Enter Postal Code";
    }
    return null;
  }

  String? countryValidator(String? content) {
    if (content != null || content == " ") {
      return "Please Enter Country";
    }
    return null;
  }
}
