part of 'chats_bloc.dart';

/// [ChatsState] is a sealed class
sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

/// [Idle] initial state
final class Idle extends ChatsState {}

/// [Loading] state
final class Loading extends ChatsState {}

/// [ChatsLoaded] state
final class ChatsLoaded extends ChatsState {
  /// [ChatsLoaded] constructor
  const ChatsLoaded({required this.chats});

  /// [chats] entity
  final Chats chats;

  @override
  List<Object> get props => [chats];
}

/// [Error] state
final class Error extends ChatsState {
  /// [Error] constructor
  const Error({required this.header, required this.message});

  /// error [message]
  final String message;

  /// [header]
  final String header;

  @override
  List<Object> get props => [message, header];
}

/// [MuteUnmuteDone] state
final class MuteUnmuteDone extends ChatsState {}

/// [Unauthorized] state
final class Unauthorized extends ChatsState {}
