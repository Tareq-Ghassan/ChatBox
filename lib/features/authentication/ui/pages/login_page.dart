import 'package:chat/core/presentation/widget/textfield/text_field.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/controls/authentication_controls.dart';
import 'package:chat/features/authentication/ui/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [_LoginPage] represent login screen
class _LoginPage extends StatefulWidget {
  /// [_LoginPage] constructor
  const _LoginPage();

  @override
  State<_LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: AuthenticationControls.loginListenerController,
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
                        onPressed: () => AuthenticationControls.submitLogin(
                          _formKey,
                          context,
                        ),
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
                    spacing: 24,
                    children: [
                      AuthHeader(
                        title: appLocalizations.loginHeader,
                        subtitle: appLocalizations.loginSubtitle,
                      ),
                      const EmailTextField(),
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
          create: (_) => sl<EmailCubit>(),
        ),
        BlocProvider<PasswordCubit>(
          create: (_) => sl<PasswordCubit>(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => sl<AuthenticationBloc>(),
        ),
      ],
      child: const _LoginPage(),
    );
  }
}
