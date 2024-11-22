import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [AuthenticationEvent] `immutable` class created to hold events
@immutable
abstract class AuthenticationEvent extends Equatable {
  /// [AuthenticationEvent] constructor
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

///[PerformLogin] fetch event
class PerformLogin extends AuthenticationEvent {
  /// [PerformLogin] constructor
  const PerformLogin({required this.email, required this.password});

  /// [email] represent email
  final String email;

  /// [password] represent password
  final String password;

  ///[props]
  @override
  List<Object> get props => super.props;
}

///[ResetAuthentication] reset event
class ResetAuthentication extends AuthenticationEvent {
  ///[ResetAuthentication] constructor
  const ResetAuthentication();

  ///[props]
  @override
  List<Object> get props => super.props;
}