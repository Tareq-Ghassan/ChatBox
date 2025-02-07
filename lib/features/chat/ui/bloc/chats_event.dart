// ignore_for_file: public_member_api_docs, document_ignores

part of 'chats_bloc.dart';

/// [ChatsEvent] is a sealed class
sealed class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

/// [GetAllChats] event, which triggers fetching all chats
class GetAllChats extends ChatsEvent {
  const GetAllChats({
    required this.index,
    required this.perPage,
  });

  /// [index] of current page
  final int index;

  /// [perPage] how many items shown on per page
  final int perPage;
  @override
  List<Object> get props => [index, perPage];
}
