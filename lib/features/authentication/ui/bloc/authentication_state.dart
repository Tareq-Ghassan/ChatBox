part of 'authentication_bloc.dart';

///[AuthenticationState] `immutable` class created to hold state
sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// [Idle] state
final class Idle extends AuthenticationState {}

/// [Loading] state
final class Loading extends AuthenticationState {}

/// [Loaded] state
final class Loaded extends AuthenticationState {
  /// [Loaded] constructor
  const Loaded(
    this._userData,
  );
  final Login _userData;

  /// [userData] getter
  Login get userData => _userData;
  @override
  List<Login> get props => [_userData];
}

/// [Error] state
final class Error extends AuthenticationState {
  /// [Error] constructor
  const Error({required this.message});

  /// error [message]
  final String message;

  @override
  List<Object> get props => [message];
}
