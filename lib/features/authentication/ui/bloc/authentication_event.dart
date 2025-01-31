part of 'authentication_bloc.dart';

/// [AuthenticationEvent] `immutable` class created to hold events
sealed class AuthenticationEvent extends Equatable {
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

///[Register] fetch event
class Register extends AuthenticationEvent {
  /// [Register] constructor
  const Register({
    required this.name,
    required this.countryCode,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// [name] user Name
  final String name;

  /// [countryCode] user phone number country code
  final String countryCode;

  /// [name] user phone number
  final String phoneNumber;

  /// [name] user email
  final String email;

  /// [name] user password
  final String password;

  /// [name] user confirmPassword
  final String confirmPassword;

  ///[props]
  @override
  List<Object> get props => super.props;
}
