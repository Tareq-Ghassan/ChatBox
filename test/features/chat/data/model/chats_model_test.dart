import 'dart:convert';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/chat/data/model/chats_model.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/user/data/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/util/fixture_reader.dart';

void main() {
  final tCreatedAtChat = DateTime.utc(2025, 02, 03, 16, 48, 49, 965);
  final tUpdatedAtChat = DateTime.utc(2025, 02, 03, 17, 16, 28, 233);

  final tCreatedAtMessage = DateTime.utc(2025, 02, 03, 17, 16, 28, 200);
  final tUpdatedAtMessage = DateTime.utc(2025, 02, 03, 17, 16, 28, 200);

  const tCurrentPage = 1;
  const tPerPage = 10;
  const tTotalChats = 1;
  const tTotalPages = 1;
  final tMessageModel = MessageModel(
    location: const LocationModel(
      latitude: 12.123123,
      longitude: 12.123123,
    ),
    id: '67a0f9ecd69049c5a3610522',
    chatId: '67a0f371d69049c5a3610506',
    sender: '679bb383f5d144b2485e6ff5',
    messageType: MessageType.location,
    content: '',
    mediaUrl: Uri(),
    seenBy: [
      '679bb383f5d144b2485e6ff5',
    ],
    deletedBy: [],
    isEdited: false,
    editedAt: DateTime(1900),
    editHistory: [],
    createdAt: tCreatedAtMessage,
    updatedAt: tUpdatedAtMessage,
  );

  final tChatModel = ChatModel(
    id: '67a0f371d69049c5a3610506',
    participants: [
      const UserModel(
        id: '679bb383f5d144b2485e6ff5',
        phoneNumber: PhoneNumberModel(number: '', code: ''),
        name: 'Tareq Ghassan',
        email: '',
        profileImage: '',
      ),
      const UserModel(
        id: '679bb383f5d144b2485e6ff5',
        phoneNumber: PhoneNumberModel(number: '', code: ''),
        name: 'Tareq Ghassan',
        email: '',
        profileImage: '',
      ),
    ],
    lastMessage: tMessageModel,
    isGroup: false,
    groupName: '',
    groupImage: '',
    archivedBy: [],
    mutedBy: [
      '679bb383f5d144b2485e6ff5',
    ],
    deletedBy: [],
    createdAt: tCreatedAtChat,
    updatedAt: tUpdatedAtChat,
    unreadMessagesCount: 0,
  );
  const tHeaderModel = HeaderModel(errorCode: '00000', message: 'Success');

  final tChatsModel = ChatsModel(
    header: tHeaderModel,
    chats: [tChatModel],
    currentPage: tCurrentPage,
    perPage: tPerPage,
    totalChats: tTotalChats,
    totalPages: tTotalPages,
  );

  test('Should be a subclass of Chats entity', () async {
    //! Assert
    expect(tChatsModel, isA<Chats>());
    expect(tChatsModel.chats.first, isA<Chat>());
    expect(tChatsModel.chats.first.lastMessage, isA<Message>());
    expect(tChatsModel.chats.first.lastMessage.location, isA<Location>());
  });

  group(
    'from json',
    () {
      test('Should return a valid model from json data', () async {
        //? Arrange
        final jsonMap = json.decode(
          fixture(
            fileName: 'chats',
            featureName: AppFeature.chat,
          ),
        );
        //# Act
        final result = ChatsModel.fromJson(jsonMap as Map<String, dynamic>);

        //! Assert
        expect(result, tChatsModel);
      });
      test("shouldn't return a exception on parsing", () async {
        //? Arrange
        final jsonMap = json.decode(
          fixture(
            fileName: 'chats_error',
            featureName: AppFeature.chat,
            isError: true,
          ),
        );
        //# Act
        final result = ChatsModel.fromJson(jsonMap as Map<String, dynamic>);

        //! Assert
        expect(result, tChatsModel);
      });
    },
  );
}
