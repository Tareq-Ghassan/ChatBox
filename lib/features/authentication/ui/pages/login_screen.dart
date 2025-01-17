
import 'package:chat/core/presentation/widget/email_textfield.dart';
import 'package:chat/core/presentation/widget/password_textfield.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/locale_utils.dart';
import 'package:chat/features/authentication/domain/usecase/authentication_controller.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_state.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/widget/auth_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [LoginScreen] represent login screen
class LoginScreen extends StatefulWidget {
  /// [LoginScreen] constructor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static const _whiteSpace = SizedBox(height: 24);
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    KNavigator.navigatorKey.currentContext!.read<EmailCubit>().email = '';
    KNavigator.navigatorKey.currentContext!.read<PasswordCubit>().password = '';
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: loginListenerController,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(),
            bottomNavigationBar: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () => submitLogin(_formKey),
                        child: Text(appLocalizations.login),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        appLocalizations.forgotPassword,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthHeader(
                        title: appLocalizations.loginHeader,
                        subtitle: appLocalizations.loginSubtitle,
                      ),
                      LoginScreen._whiteSpace,
                      const EmailTextField(),
                      LoginScreen._whiteSpace,
                      const PasswordTextField(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
