import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final time = DateTime.now();
  const tCurrentPage = 1;
  const tPerPage = 10;
  const tTotalChats = 100;
  const tTotalPages = 10;
  final tMessage = Message(
    location: const Location(
      latitude: 0,
      longitude: 0,
    ),
    id: 'sa',
    chatId: 'chatId',
    sender: 'sender',
    messageType: MessageType.text,
    content: 'content',
    mediaUrl: Uri(),
    seenBy: [],
    deletedBy: [],
    isEdited: false,
    editedAt: time,
    editHistory: [],
    createdAt: time,
    updatedAt: time,
  );

  final tChat = Chat(
    id: '12',
    participants: [],
    lastMessage: tMessage,
    isGroup: false,
    groupName: '',
    groupImage: '',
    archivedBy: [],
    mutedBy: [],
    deletedBy: [],
    createdAt: time,
    updatedAt: time,
  );
  final tChats = Chats(
    chats: [tChat],
    currentPage: tCurrentPage,
    perPage: tPerPage,
    totalChats: tTotalChats,
    totalPages: tTotalPages,
  );

  test('Should return values form props', () async {
    //# Act
    final props = tChats.props;
    //! Assert
    expect(props, [
      tChats.chats,
      tChats.currentPage,
      tChats.perPage,
      tChats.totalChats,
      tChats.totalPages,
    ]);
  });

  test('equality should be based on props', () async {
    //? Arrange
    final anotherChats = Chats(
      chats: [tChat],
      currentPage: tCurrentPage,
      perPage: tPerPage,
      totalChats: tTotalChats,
      totalPages: tTotalPages,
    );

    const differentChats = Chats(
      chats: [],
      currentPage: 2,
      perPage: 5,
      totalChats: 50,
      totalPages: 5,
    );

    //! Assert
    expect(tChats, equals(anotherChats));
    expect(tChats, isNot(equals(differentChats)));
  });

  test('should create a valid Chat entity', () {
    //! Assert
    expect(tChat.id, '12');
    expect(tChat.participants, isEmpty);
    expect(tChat.isGroup, false);
    expect(tChat.groupName, '');
    expect(tChat.groupImage, '');
    expect(tChat.archivedBy, isEmpty);
    expect(tChat.mutedBy, isEmpty);
    expect(tChat.deletedBy, isEmpty);
    expect(tChat.lastMessage, equals(tMessage));
    expect(tChat.createdAt, equals(time));
    expect(tChat.updatedAt, equals(time));
  });

  test('should create a valid Message entity', () {
    //! Assert
    expect(tMessage.id, 'sa');
    expect(tMessage.chatId, 'chatId');
    expect(tMessage.sender, 'sender');
    expect(tMessage.messageType, MessageType.text);
    expect(tMessage.content, 'content');
    expect(tMessage.mediaUrl, Uri());
    expect(tMessage.seenBy, isEmpty);
    expect(tMessage.deletedBy, isEmpty);
    expect(tMessage.isEdited, false);
    expect(tMessage.editedAt, equals(time));
    expect(tMessage.editHistory, isEmpty);
    expect(tMessage.createdAt, equals(time));
    expect(tMessage.updatedAt, equals(time));
  });
}
