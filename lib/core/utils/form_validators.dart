import 'package:marketi/core/utils/app_regex.dart';

abstract class FormValidators {
  static String? customTextFormFieldValidator(String? value) {
    if (isValueEmpty(value)) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (isValueEmpty(value)) {
      return 'This field is required';
    }
    if (!AppRegex.isValidEmail(value!)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!AppRegex.hasLowerCase(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!AppRegex.hasUpperCase(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!AppRegex.hasNumber(value)) {
      return 'Password must contain at least one number';
    }
    if (!AppRegex.hasSpecialCharacter(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }


  static String? pincodeTextFormFieldValidator(String? value) {
    if (isValueEmpty(value) || value!.length < 4) {
      return 'Please enter the correct code';
    } else {
      return null;
    }
  }

  static bool isValueEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

}
