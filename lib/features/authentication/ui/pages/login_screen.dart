import 'package:chat/core/presentation/widget/email_textfield.dart';
import 'package:chat/core/presentation/widget/password_textfield.dart';
import 'package:chat/core/util/locale_utils.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/controls/authentication_controller.dart';
import 'package:chat/features/authentication/ui/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [_LoginScreen] represent login screen
class _LoginScreen extends StatefulWidget {
  /// [_LoginScreen] constructor
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => _LoginScreenState();

  static const _whiteSpace = SizedBox(height: 24);
}

class _LoginScreenState extends State<_LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: loginListenerController,
      builder: (ctx, state) {
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
                        onPressed: () => submitLogin(_formKey, context),
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
                      _LoginScreen._whiteSpace,
                      const EmailTextField(),
                      _LoginScreen._whiteSpace,
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

/// [LoginPageBlocScope] hold login Page and provide its blocs and Cubits
class LoginPageBlocScope extends StatelessWidget {
  /// [LoginPageBlocScope] constructor
  const LoginPageBlocScope({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailCubit>(
          create: (context) => sl<EmailCubit>(),
        ),
        BlocProvider<PasswordCubit>(
          create: (context) => sl<PasswordCubit>(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => sl<AuthenticationBloc>(),
        ),
      ],
      child: const _LoginScreen(),
    );
  }
}
