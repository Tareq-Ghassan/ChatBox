// ignore_for_file: avoid_setters_without_getters, document_ignores

import 'package:flutter_bloc/flutter_bloc.dart';

/// A [EmailCubit] which manages `Email` as its state
class EmailCubit extends Cubit<String> {
  /// The initial state of the [EmailCubit] is `''`.
  EmailCubit() : super('');

  /// [email] function to set a new value for Email
  set email(String newVal) => emit(newVal);
}

/// A [PasswordCubit] which manages `password` as its state
class PasswordCubit extends Cubit<String> {
  /// The initial state of the [PasswordCubit] is `''`.
  PasswordCubit() : super('');

  /// [password] function to set a new value for password
  set password(String newVal) => emit(newVal);
}

/// A [HidePasswordCubit] which manages `HidePassword` as its state
class HidePasswordCubit extends Cubit<bool> {
  /// The initial state of the [HidePasswordCubit] is `true`.
  HidePasswordCubit() : super(true);

  /// [hidePassword] function to set a new HidePassword value
  set hidePassword(bool newVal) => emit(newVal);
}

/// A [ConfirmPasswordCubit] which manages `confirm password` as its state
class ConfirmPasswordCubit extends Cubit<String> {
  /// The initial state of the [ConfirmPasswordCubit] is `''`.
  ConfirmPasswordCubit() : super('');

  /// [confirmPassword] function to set a new value for confirm password
  set confirmPassword(String newVal) => emit(newVal);
}

/// A [NameCubit] which manages `name` as its state
class NameCubit extends Cubit<String> {
  /// The initial state of the [NameCubit] is `''`.
  NameCubit() : super('');

  /// [name] function to set a new value for name
  set name(String newVal) => emit(newVal);
}

/// A [PhoneNumberCubit] which manages `phone number` as its state
class PhoneNumberCubit extends Cubit<String> {
  /// The initial state of the [PhoneNumberCubit] is `''`.
  PhoneNumberCubit() : super('');

  /// [phone] function to set a new value for phone
  set phone(String newVal) => emit(newVal);
}

/// A [CountryCodeCubit] which manages `country code` as its state
class CountryCodeCubit extends Cubit<String> {
  /// The initial state of the [CountryCodeCubit] is `962`.
  CountryCodeCubit() : super('962');

  /// [countryCode] function to set a new value for country code
  set countryCode(String newVal) => emit(newVal);
}
