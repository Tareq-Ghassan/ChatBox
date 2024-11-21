import 'dart:async';

import 'package:chat/common/function/common_functions.dart';
import 'package:flutter/material.dart';

/// [validateEmail] validates email field
String? validateEmail(
  BuildContext context,
  String? value,
) {
  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('email');
    }
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegExp.hasMatch(value)) {
      return appLocalizations.invalidEmailFormat;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('mobile');
  }

  return null;
}

/// [validateInputPassword] this function is to excute validation on
/// password Field
///
/// it only check that its not empty
String? validateInputPassword(BuildContext context, String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('pass');
    }
    final passRegExp = RegExp('.{6,}');
    if (!passRegExp.hasMatch(value)) {
      return appLocalizations.minimumSixChars;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('pass');
  }

  return null;
}

/// [submitLogin] a function to submit login
Future<void> submitLogin(GlobalKey<FormState> formKey) async {
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  // final email = AppRouter.navigatorKey.currentContext!.read<EmailCubit>().state;
  // final password =
  //     AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;

  return;
}
