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

/// [Loaded] state
final class Loaded extends InitializeState {
  /// [Loaded] constructor
  const Loaded({required this.initialize});

  /// [initialize] entitiy
  final Initialize initialize;

  @override
  List<Object> get props => [initialize];
}

/// [Error] state
final class Error extends InitializeState {
  /// [Error] constructor
  const Error({required this.message});

  /// error [message]
  final String message;

  @override
  List<Object> get props => [message];
}
