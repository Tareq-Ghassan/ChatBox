import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'output/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Your email'**
  String get email;

  /// No description provided for @existingAccount.
  ///
  /// In en, this message translates to:
  /// **'Existing account? '**
  String get existingAccount;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Unable to process the request'**
  String get internalServerError;

  /// No description provided for @internalServerErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sending the data. Please try again. If this issue keeps happening, contact our customer center'**
  String get internalServerErrorDescription;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email Format'**
  String get invalidEmailFormat;

  /// No description provided for @invalidPhoneNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number Format'**
  String get invalidPhoneNumberFormat;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @loginHeader.
  ///
  /// In en, this message translates to:
  /// **'Log in to Chatbox'**
  String get loginHeader;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Sign in using your social account or email to continue us'**
  String get loginSubtitle;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @minimumSixChars.
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters'**
  String get minimumSixChars;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameMustBe2Syllables.
  ///
  /// In en, this message translates to:
  /// **'Name must be 2 syllables or more'**
  String get nameMustBe2Syllables;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline'**
  String get networkError;

  /// No description provided for @networkErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection'**
  String get networkErrorDescription;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get ok;

  /// No description provided for @onboardingBody.
  ///
  /// In en, this message translates to:
  /// **'Our chat app is the perfect way to stay connected with friends and family.'**
  String get onboardingBody;

  /// No description provided for @onboardingHeader.
  ///
  /// In en, this message translates to:
  /// **'Connect friends easily & quickly'**
  String get onboardingHeader;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @pleaseEnterValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter {type, select, mail{Email}  pass {Password} name{Name} other{{type}}}'**
  String pleaseEnterValidation(String type);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @signUpMail.
  ///
  /// In en, this message translates to:
  /// **'Sign up within mail'**
  String get signUpMail;

  /// No description provided for @signupHeader.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Email'**
  String get signupHeader;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get chatting with friends and family today by signing up for our chat app!'**
  String get signupSubtitle;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Unable to complete request!'**
  String get somethingWentWrong;

  /// No description provided for @somethingWentWrongDescription.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while retrieving the data. Please try again. If this issue keeps happening, contact our customer center'**
  String get somethingWentWrongDescription;

  /// No description provided for @welcomeToChatBox.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Chat Box'**
  String get welcomeToChatBox;

  /// No description provided for @workingOnApp.
  ///
  /// In en, this message translates to:
  /// **'We are currently working on App please try later'**
  String get workingOnApp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
