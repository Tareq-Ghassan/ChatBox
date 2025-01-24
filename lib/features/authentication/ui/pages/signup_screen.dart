
import 'package:chat/core/presentation/widget/email_textfield.dart';
import 'package:chat/core/presentation/widget/k_text_form_field.dart';
import 'package:chat/core/presentation/widget/password_textfield.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/controls/authentication_controller.dart';
import 'package:chat/features/authentication/ui/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SignupScreen] represent signup screen
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
    KNavigator.navigatorKey.currentContext!
        .read<ConfirmPasswordCubit>()
        .confirmPassword = '';
    KNavigator.navigatorKey.currentContext!.read<NameCubit>().name = '';
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: signUpListenerController,
      builder: (context, state) {
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
      },
    );
  }
}
