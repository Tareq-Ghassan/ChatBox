part of 'util.dart';

/// [InputValidator] a class that validate user input form UI
class InputValidator {
  /// [validateEmail] validates email field
  static String? validateEmail(
    String? value,
  ) {
    if (value != null) {
      if (value.isEmpty) {
        return appLocalizations.pleaseEnterValidation('email');
      }
      if (!Regex.email.hasMatch(value)) {
        return appLocalizations.invalidEmailFormat;
      }
    } else {
      return appLocalizations.pleaseEnterValidation('email');
    }

    return null;
  }

  /// [validateInputPassword] this function is to execute validation on
  /// password Field
  ///
  /// it only check that its not empty
  static String? validateInputPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return appLocalizations.pleaseEnterValidation('pass');
      }
      if (!Regex.password.hasMatch(value)) {
        return appLocalizations.minimumSixChars;
      }
    } else {
      return appLocalizations.pleaseEnterValidation('pass');
    }
    return null;
  }

  /// [validateConfirmPassword] this function is to execute validation on
  /// confirm password Field
  static String? validateConfirmPassword({
    required String? password,
    required String? confirmPassword,
  }) {
    if (confirmPassword != null) {
      if (confirmPassword.isEmpty) {
        return appLocalizations.pleaseEnterValidation('pass');
      }
      if (password != confirmPassword) {
        return appLocalizations.passwordsDoNotMatch;
      }
    } else {
      return appLocalizations.pleaseEnterValidation('pass');
    }

    return null;
  }

  /// * validate if fullname is empty or not
  static String? validateFullname(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return appLocalizations.pleaseEnterValidation('name');
      }
      final nameParts = value.split(' ');
      if (nameParts.length < 2) {
        return appLocalizations.nameMustBe2Syllables;
      }
      if (nameParts[0].isEmpty || nameParts[1].isEmpty) {
        return appLocalizations.nameMustBe2Syllables;
      }
      return null;
    } else {
      return appLocalizations.pleaseEnterValidation('name');
    }
  }

  /// [validatePhoneNumber] validates phone number field
  static String? validatePhoneNumber(
    String? value,
  ) {
    if (value != null) {
      if (value.isEmpty) {
        return appLocalizations.pleaseEnterValidation('mobile');
      }

      final phoneRegExp = Regex.phoneNumber;
      if (!phoneRegExp.hasMatch(value)) {
        return appLocalizations.invalidPhoneNumberFormat;
      }
    } else {
      return appLocalizations.pleaseEnterValidation('mobile');
    }

    return null;
  }
}
