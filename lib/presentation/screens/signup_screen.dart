import 'package:chat/common/function/common_functions.dart';
import 'package:chat/common/widget/email_textfield.dart';
import 'package:chat/common/widget/k_text_form_field.dart';
import 'package:chat/common/widget/password_textfield.dart';
import 'package:chat/presentation/controller/authentication_controller.dart';
import 'package:chat/presentation/widgets/auth_header.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SignupScreen] represent singup screen
class SignupScreen extends StatefulWidget {
  /// [SignupScreen] Constructor
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
  static const _whiteSpace = SizedBox(height: 24);
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    AppRouter.navigatorKey.currentContext!.read<EmailCubit>().email = '';
    AppRouter.navigatorKey.currentContext!.read<PasswordCubit>().password = '';
    AppRouter.navigatorKey.currentContext!
        .read<ConfirmPasswordCubit>()
        .confirmPassword = '';
    AppRouter.navigatorKey.currentContext!.read<NameCubit>().name = '';
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
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => submitSignup(_formKey),
              child: Text(appLocalizations.createAccount),
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
                    title: appLocalizations.signupHeader,
                    subtitle: appLocalizations.signupSubtitle,
                  ),
                  SignupScreen._whiteSpace,
                  KTextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: appLocalizations.name,
                    validator: (value) => validateFullname(context, value),
                    onSaved: (value) {
                      if (value != null) {
                        context.read<NameCubit>().name = value;
                      }
                    },
                  ),
                  SignupScreen._whiteSpace,
                  const EmailTextField(),
                  SignupScreen._whiteSpace,
                  const PasswordTextField(),
                  SignupScreen._whiteSpace,
                  const PasswordTextField(
                    isConfirmPassword: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
