part of 'initialize_bloc.dart';

/// [InitializeState] is a sealed class
sealed class InitializeState extends Equatable {
  const InitializeState();

  @override
  List<Object> get props => [];
}

/// [Idle] initial state
final class Idle extends InitializeState {}

/// [Loading] state
final class Loading extends InitializeState {}

/// [InitializeLoaded] state
final class InitializeLoaded extends InitializeState {
  /// [InitializeLoaded] constructor
  const InitializeLoaded({required this.initialize});

  /// [initialize] entity
  final Initialize initialize;

  @override
  List<Object> get props => [initialize];
}

/// [ConfigurationLoaded] state
final class ConfigurationLoaded extends InitializeState {
  /// [ConfigurationLoaded] constructor
  const ConfigurationLoaded({required this.configuration});

  /// [configuration] entity
  final Configuration configuration;

  @override
  List<Configuration> get props => [configuration];
}

/// [LoggedIn] state
final class LoggedIn extends InitializeState {}

/// [Unauthorized] state
final class Unauthorized extends InitializeState {}

/// [Error] state
final class Error extends InitializeState {
  /// [Error] constructor
  const Error({required this.header, required this.message});

  /// error [message]
  final String message;

  /// [header]
  final String header;

  @override
  List<Object> get props => [message, header];
}
