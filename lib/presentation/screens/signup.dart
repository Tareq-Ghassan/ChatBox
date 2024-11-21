import 'package:chat/common/function/common_functions.dart';
import 'package:chat/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => {},
              child: Text(appLocalizations.createAccount),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(
                title: appLocalizations.loginHeader,
                subtitle: appLocalizations.loginSubtitle,
              ),
              SignupScreen._whiteSpace,
            ],
          ),
        ),
      ),
    );
  }
}
