part of 'initialize_bloc.dart';

sealed class InitializeState extends Equatable {
  const InitializeState();

  @override
  List<Object> get props => [];
}

final class Loading extends InitializeState {}

final class Loaded extends InitializeState {
  Loaded({required this.initialize});

  final Initialize initialize;

  @override
  List<Object> get props => [initialize];
}

final class Error extends InitializeState {
  Error({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
