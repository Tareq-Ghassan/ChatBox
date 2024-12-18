// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [EmailCubit] which manages `Email` as its state
class EmailCubit extends Cubit<String> {
  /// The initial state of the [EmailCubit] is `''`.
  EmailCubit() : super('');

  /// [email] function to set a new value for Email
  set email(String newVal) => emit(newVal);

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [PasswordCubit] which manages `password` as its state
class PasswordCubit extends Cubit<String> {
  /// The initial state of the [PasswordCubit] is `''`.
  PasswordCubit() : super('');

  /// [password] function to set a new value for password
  set password(String newVal) => emit(newVal);

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [HidePasswordCubit] which manages `HidePassword` as its state
class HidePasswordCubit extends Cubit<bool> {
  /// The initial state of the [HidePasswordCubit] is `true`.
  HidePasswordCubit() : super(true);

  /// [hidePassword] function to set a new HidePassword value
  set hidePassword(bool newVal) => emit(newVal);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [ConfirmPasswordCubit] which manages `confirm password` as its state
class ConfirmPasswordCubit extends Cubit<String> {
  /// The initial state of the [ConfirmPasswordCubit] is `''`.
  ConfirmPasswordCubit() : super('');

  /// [confirmPassword] function to set a new value for confirm password
  set confirmPassword(String newVal) => emit(newVal);

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [NameCubit] which manages `name` as its state
class NameCubit extends Cubit<String> {
  /// The initial state of the [NameCubit] is `''`.
  NameCubit() : super('');

  /// [name] function to set a new value for name
  set name(String newVal) => emit(newVal);

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
