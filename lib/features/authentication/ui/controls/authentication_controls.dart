import 'dart:async';

import 'package:chat/core/presentation/widget/dialog.dart';
import 'package:chat/core/presentation/widget/loading_indicator.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
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
    final email = KNavigator.navigatorKey.currentContext!.read<EmailCubit>().state;
    final password = context.read<PasswordCubit>().state;
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
        KNavigator.pushNamedAndRemoveUntil(
          KRoutes.homeScreen,
          (route) => route.isFirst,
        ),
      );
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: KNavigator.navigatorKey.currentContext!,
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
    final name =
        context.read<NameCubit>().state;
    final email =
        context.read<EmailCubit>().state;
    final password =
        context.read<PasswordCubit>().state;
    final confirmPassword = context
        .read<ConfirmPasswordCubit>()
        .state;
    BlocProvider.of<AuthenticationBloc>(context)
        .add(
      Register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: '',
        countryCode: '',
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
        KNavigator.pushNamedAndRemoveUntil(
          KRoutes.homeScreen,
          (route) => route.isFirst,
        ),
      );
    } else if (state is Error) {
      LoadingIndicatorDialog.dismiss();
      unawaited(
        showDialog(
          context: KNavigator.navigatorKey.currentContext!,
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
