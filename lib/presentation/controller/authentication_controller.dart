import 'dart:async';

import 'package:chat/common/function/common_functions.dart';
import 'package:chat/common/widget/dialog.dart';
import 'package:chat/common/widget/loading_indecator.dart';
import 'package:chat/provider/BloC/authentication/authentication_bloc.dart';
import 'package:chat/provider/BloC/authentication/authentication_event.dart';
import 'package:chat/provider/BloC/authentication/authentication_state.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:chat/routes/app_routes.dart';
import 'package:chat/routes/route_manger.dart';
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
  context.read<PasswordCubit>().password = value;
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
  final email = AppRouter.navigatorKey.currentContext!.read<EmailCubit>().state;
  final password =
      AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;
  BlocProvider.of<AuthenticationBloc>(AppRouter.navigatorKey.currentContext!)
      .add(PerformLogin(email: email, password: password));
}

/// [loginListenerController] the function that handle UI for Bloc state
Future<void> loginListenerController(
  BuildContext context,
  AuthenticationState state,
) async {
  if (state is AuthenticationIsLoading) {
    LoadingIndicatorDialog.show(context);
  }
  if (state is AuthenticationIsLoaded) {
    LoadingIndicatorDialog.dismiss();
    unawaited(
      AppRouter.pushNamedAndRemoveUntil(
        KRoutes.homeScreen,
        (route) => route.isFirst,
      ),
    );
  } else if (state is AuthenticationFailure ||
      state is AuthenticationCatch ||
      state is AuthenticationShowFailure) {
    LoadingIndicatorDialog.dismiss();
    unawaited(
      showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: state is AuthenticationShowFailure
              ? appLocalizations.somethingWentWrong
              : appLocalizations.internalServerError,
          descriptions: state is AuthenticationShowFailure
              ? state.errorMessage
              : appLocalizations.somethingWentWrongDescription,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: AppRouter.pop,
        ),
      ),
    );
  }
}

/// [submitSignup] a function to submit SIGN UP
Future<void> submitSignup(GlobalKey<FormState> formKey) async {
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  final name = AppRouter.navigatorKey.currentContext!.read<NameCubit>().state;
  final email = AppRouter.navigatorKey.currentContext!.read<EmailCubit>().state;
  final password =
      AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;
  final confirmPassword =
      AppRouter.navigatorKey.currentContext!.read<ConfirmPasswordCubit>().state;

  AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().state;
  BlocProvider.of<AuthenticationBloc>(AppRouter.navigatorKey.currentContext!)
      .add(
    Regisetr(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    ),
  );
}

/// [signUpListenerController] the function that handle UI for Bloc state
Future<void> signUpListenerController(
  BuildContext context,
  AuthenticationState state,
) async {
  if (state is AuthenticationIsLoading) {
    LoadingIndicatorDialog.show(context);
  }
  if (state is AuthenticationIsLoaded) {
    LoadingIndicatorDialog.dismiss();
    unawaited(
      AppRouter.pushNamedAndRemoveUntil(
        KRoutes.homeScreen,
        (route) => route.isFirst,
      ),
    );
  } else if (state is AuthenticationFailure ||
      state is AuthenticationCatch ||
      state is AuthenticationShowFailure) {
    LoadingIndicatorDialog.dismiss();
    unawaited(
      showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: state is AuthenticationShowFailure
              ? appLocalizations.somethingWentWrong
              : appLocalizations.internalServerError,
          descriptions: state is AuthenticationShowFailure
              ? state.errorMessage
              : appLocalizations.somethingWentWrongDescription,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: AppRouter.pop,
        ),
      ),
    );
  }
}
