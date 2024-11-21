import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [EmailCubit] which manages `Email` as its state
class EmailCubit extends Cubit<String> {
  /// The initial state of the [EmailCubit] is `''`.
  EmailCubit() : super('');

  /// [setEmail] function to set a new value for Email
  void setEmail({required String newVal}) {
    emit(newVal);
  }

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

  /// [setPassword] function to set a new value for password
  void setPassword({required String newVal}) {
    emit(newVal);
  }

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

  /// [setHidePassword] function to set a new HidePassword value
  void setHidePassword({required bool newVal}) {
    emit(newVal);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
