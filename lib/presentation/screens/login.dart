import 'package:chat/common/function/common_functions.dart';
import 'package:chat/common/widget/email_textfield.dart';
import 'package:chat/common/widget/password_textfield.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:chat/presentation/controller/authentication_controller.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:chat/routes/app_routes.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [LoginScreen] repreasent login screen
class LoginScreen extends StatefulWidget {
  /// [LoginScreen] consturctor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static const _whiteSpace = SizedBox(height: 24);
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    AppRouter.navigatorKey.currentContext!
        .read<EmailCubit>()
        .setEmail(newVal: '');
    AppRouter.navigatorKey.currentContext!
        .read<PasswordCubit>()
        .setPassword(newVal: '');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        bottomNavigationBar: SingleChildScrollView(
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
                onPressed: () => AppRouter.pushNamed(KRoutes.login),
                child: Text(
                  appLocalizations.forgotPassword,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    appLocalizations.loginHeader,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  LoginScreen._whiteSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      appLocalizations.loginSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: KColors.grayColor),
                    ),
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
  }
}
