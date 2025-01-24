import 'package:chat/core/presentation/assets/icons.dart';
import 'package:chat/core/presentation/assets/images.dart';
import 'package:chat/core/presentation/theme/app/dark/theme_data_dark.dart';
import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/routes/route.dart';
import 'package:chat/core/util/locale_utils.dart';
import 'package:flutter/material.dart';

/// [OnboardingPage] represent onboarding Page
class OnboardingPage extends StatelessWidget {
  /// [OnboardingPage] constructor
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: Scaffold(
        bottomNavigationBar: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () => KNavigator.pushNamed(KRoutes.signup),
                  child: Text(appLocalizations.signUpMail),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizations.existingAccount,
                    style: darkTheme.textTheme.bodySmall!
                        .copyWith(color: KColors.grayColor),
                  ),
                  TextButton(
                    onPressed: () => KNavigator.pushNamed(KRoutes.login),
                    child: Text(
                      appLocalizations.login,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                KImages.onboardingBG,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _whiteSpace,
                        Center(
                          child: Image.asset(
                            KIcons.logo,
                          ),
                        ),
                        _whiteSpace,
                        Text(
                          appLocalizations.onboardingHeader,
                          style: darkTheme.textTheme.displayLarge,
                        ),
                        _whiteSpace,
                        Text(
                          appLocalizations.onboardingBody,
                          style: darkTheme.textTheme.bodyMedium!
                              .copyWith(color: KColors.grayColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const _whiteSpace = SizedBox(height: 24);
}
