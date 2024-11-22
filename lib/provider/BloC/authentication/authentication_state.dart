import 'package:chat/data/model/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///[AuthenticationState] `immutable` class created to hold state
@immutable
abstract class AuthenticationState extends Equatable {
  /// [AuthenticationState] constructor
  const AuthenticationState();
  @override
  List<Login> get props => [];
}

/// [AuthenticationIsNotSearched] state
class AuthenticationIsNotSearched extends AuthenticationState {}

/// [AuthenticationIsLoading] state
class AuthenticationIsLoading extends AuthenticationState {}

/// [AuthenticationIsLoaded] state
class AuthenticationIsLoaded extends AuthenticationState {
  /// [AuthenticationIsLoaded] constructor
  const AuthenticationIsLoaded(
    this._userData,
  );
  final Login _userData;

  /// [userData] getter
  Login get userData => _userData;
  @override
  List<Login> get props => [_userData];
}

/// [AuthenticationShowFailure] state
class AuthenticationShowFailure extends AuthenticationState {
  /// [AuthenticationShowFailure] constructor
  const AuthenticationShowFailure(
    this._errorMessage,
  );
  final String _errorMessage;

  /// [errorMessage] getter
  String get errorMessage => _errorMessage;
}

/// [AuthenticationFailure] state
class AuthenticationFailure extends AuthenticationState {}

/// [AuthenticationCatch] state
class AuthenticationCatch extends AuthenticationState {}
