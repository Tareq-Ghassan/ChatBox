import 'package:chat/core/presentation/widget/textfield/text_field.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/controls/authentication_controls.dart';
import 'package:chat/features/authentication/ui/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [_SignupPage] represent signup screen
class _SignupPage extends StatefulWidget {
  /// [_SignupPage] Constructor
  const _SignupPage();

  @override
  State<_SignupPage> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<_SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: AuthenticationControls.signUpListenerController,
      builder: (ctx, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () =>
                      AuthenticationControls.submitSignup(_formKey, context),
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
                    spacing: 24,
                    children: [
                      AuthHeader(
                        title: appLocalizations.signupHeader,
                        subtitle: appLocalizations.signupSubtitle,
                      ),
                      KTextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: appLocalizations.name,
                        validator: InputValidator.validateFullname,
                        onSaved: (value) {
                          if (value != null) {
                            context.read<NameCubit>().name = value;
                          }
                        },
                      ),
                      const EmailTextField(),
                      const PhoneNumberTextField(),
                      const PasswordTextField(),
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

/// [SignupPageBlocScope] hold login Page and provide its blocs and Cubits
class SignupPageBlocScope extends StatelessWidget {
  /// [SignupPageBlocScope] constructor
  const SignupPageBlocScope({super.key});

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
        BlocProvider<ConfirmPasswordCubit>(
          create: (_) => sl<ConfirmPasswordCubit>(),
        ),
        BlocProvider<NameCubit>(
          create: (_) => sl<NameCubit>(),
        ),
        BlocProvider<PhoneNumberCubit>(
          create: (_) => sl<PhoneNumberCubit>(),
        ),
        BlocProvider<CountryCodeCubit>(
          create: (_) => sl<CountryCodeCubit>(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => sl<AuthenticationBloc>(),
        ),
      ],
      child: const _SignupPage(),
    );
  }
}
