import 'package:chat/common/function/common_functions.dart';
import 'package:chat/presentation/constants/assets/icons.dart';
import 'package:chat/presentation/constants/assets/images.dart';
import 'package:chat/presentation/constants/theme/app/dark/theme_data_dark.dart';
import 'package:chat/presentation/constants/theme/colors.dart';
import 'package:chat/routes/app_routes.dart';
import 'package:chat/routes/route_manger.dart';
import 'package:flutter/material.dart';

/// [OnboardingScreen] represent onboarding screen
class OnboardingScreen extends StatelessWidget {
  /// [OnboardingScreen] constructor
  const OnboardingScreen({super.key});

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
                  onPressed: () => AppRouter.pushNamed(KRoutes.signup),
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
                    onPressed: () => AppRouter.pushNamed(KRoutes.login),
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
