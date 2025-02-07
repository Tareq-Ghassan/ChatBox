import 'dart:async';

import 'package:chat/core/presentation/widget/dialog.dart';
import 'package:chat/core/presentation/widget/loading_indicator.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [AuthenticationControls] represent authentication view controls
class AuthenticationControls {
  /// [submitLogin] a function to submit login
  static Future<void> submitLogin(
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    final email = sl<EmailCubit>().state;
    final password = sl<PasswordCubit>().state;
    BlocProvider.of<AuthenticationBloc>(context)
        .add(PerformLogin(email: email, password: password));
  }

  /// [loginListenerController] the function that handle UI for Bloc state
  static Future<void> loginListenerController(
    BuildContext context,
    AuthenticationState state,
  ) async {
    if (state is Loading) {
      LoadingIndicatorDialog.show(context);
    }
    if (state is Loaded) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        KNavigator.startNewRoute(
          KRoutes.homePage,
        ),
      );
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: context,
          builder: (context) => CustomDialogBox(
            title: state.header,
            descriptions: state.message,
            yesButtontext: appLocalizations.cancel,
            yesButtonOnTap: KNavigator.pop,
          ),
        ),
      );
    }
  }

  /// [submitSignup] a function to submit SIGN UP
  static Future<void> submitSignup(
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    final name = sl<NameCubit>().state;
    final email = sl<EmailCubit>().state;
    final password = sl<PasswordCubit>().state;
    final confirmPassword = sl<ConfirmPasswordCubit>().state;
    final phoneNumber = sl<PhoneNumberCubit>().state;
    final countryCode = sl<CountryCodeCubit>().state;
    BlocProvider.of<AuthenticationBloc>(context).add(
      Register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
      ),
    );
  }

  /// [signUpListenerController] the function that handle UI for Bloc state
  static Future<void> signUpListenerController(
    BuildContext context,
    AuthenticationState state,
  ) async {
    if (state is Loading) {
      LoadingIndicatorDialog.show(context);
    }
    if (state is Loaded) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        KNavigator.startNewRoute(
          KRoutes.homePage,
        ),
      );
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: context,
          builder: (context) => CustomDialogBox(
            title: state.header,
            descriptions: state.message,
            yesButtontext: appLocalizations.exit,
            yesButtonOnTap: KNavigator.pop,
          ),
        ),
      );
    }
  }
}
