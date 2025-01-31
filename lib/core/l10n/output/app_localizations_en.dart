import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get calls => 'Calls';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get contacts => 'Contacts';

  @override
  String get createAccount => 'Create an account';

  @override
  String get email => 'Your email';

  @override
  String get existingAccount => 'Existing account? ';

  @override
  String get exit => 'Exit';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get home => 'Home';

  @override
  String get internalServerError => 'Unable to process the request';

  @override
  String get internalServerErrorDescription => 'An error occurred while sending the data. Please try again. If this issue keeps happening, contact our customer center';

  @override
  String get invalidEmailFormat => 'Invalid Email Format';

  @override
  String get invalidPhoneNumberFormat => 'Invalid Phone Number Format';

  @override
  String get loading => 'Loading...';

  @override
  String get login => 'Log in';

  @override
  String get loginHeader => 'Log in to Chatbox';

  @override
  String get loginSubtitle => 'Welcome back! Sign in using your social account or email to continue us';

  @override
  String get message => 'Message';

  @override
  String get minimumSixChars => 'Minimum 6 characters';

  @override
  String get name => 'Name';

  @override
  String get nameMustBe2Syllables => 'Name must be 2 syllables or more';

  @override
  String get networkError => 'You\'re offline';

  @override
  String get networkErrorDescription => 'Please check your connection';

  @override
  String get ok => 'Okay';

  @override
  String get onboardingBody => 'Our chat app is the perfect way to stay connected with friends and family.';

  @override
  String get onboardingHeader => 'Connect friends easily & quickly';

  @override
  String get password => 'Password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String pleaseEnterValidation(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'mail': 'Email',
        'pass': 'Password',
        'name': 'Name',
        'other': '$type',
      },
    );
    return 'Please enter $_temp0';
  }

  @override
  String get settings => 'Settings';

  @override
  String get signUpMail => 'Sign up within mail';

  @override
  String get signupHeader => 'Sign up with Email';

  @override
  String get signupSubtitle => 'Get chatting with friends and family today by signing up for our chat app!';

  @override
  String get somethingWentWrong => 'Unable to complete request!';

  @override
  String get somethingWentWrongDescription => 'An error occurred while retrieving the data. Please try again. If this issue keeps happening, contact our customer center';

  @override
  String get welcomeToChatBox => 'Welcome to Chat Box';

  @override
  String get workingOnApp => 'We are currently working on App please try later';
}
