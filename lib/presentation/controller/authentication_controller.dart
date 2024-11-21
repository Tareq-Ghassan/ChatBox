import 'dart:async';

import 'package:chat/common/function/common_functions.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return appLocalizations.pleaseEnterValidation('email');
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

/// [validateConfirmPassword] this function is to excute validation on
/// confirm password Field
String? validateConfirmPassword(BuildContext context, String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('pass');
    }
    if (context.read<PasswordCubit>().state != value) {
      return appLocalizations.passwordsDoNotMatch;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('pass');
  }

  return null;
}

/// * validate if fullname is empty or not
String? validateFullname(BuildContext context, String? value) {
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

/// [submitLogin] a function to submit login
Future<void> submitLogin(GlobalKey<FormState> formKey) async {
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  // final email = AppRouter.navigatorKey.currentContext!.read<EmailCubit>()
  // .state;
  // final password =
  //     AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;

  return;
}

/// [submitSignup] a function to submit SIGN UP
Future<void> submitSignup(GlobalKey<FormState> formKey) async {
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  // final email = AppRouter.navigatorKey.currentContext!.read<EmailCubit>()
  // .state;
  // final password =
  //     AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;

  return;
}
