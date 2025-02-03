// ignore_for_file: public_member_api_docs, document_ignores

import 'package:equatable/equatable.dart';

/// [Chats] holds all chats entities
class Chats extends Equatable {
  /// [Chats] constructor
  const Chats({
    required this.chats,
    required this.currentPage,
    required this.perPage,
    required this.totalChats,
    required this.totalPages,
  });

  final List<Chat> chats;
  final int currentPage;
  final int perPage;
  final int totalChats;
  final int totalPages;

  @override
  List<Object?> get props => [
        chats,
        currentPage,
        perPage,
        totalChats,
        totalPages,
      ];
}

/// [Chat] hold a single chat entity
class Chat {
  /// [Chat] constructor
  const Chat({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.isGroup,
    required this.groupName,
    required this.groupImage,
    required this.archivedBy,
    required this.mutedBy,
    required this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
  });
  final String id;
  final List<String> participants;
  final Message lastMessage;
  final bool isGroup;
  final String groupName;
  final String groupImage;
  final List<String> archivedBy;
  final List<String> mutedBy;
  final List<String> deletedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
}

/// [Message] hold a single message entity
class Message {
  /// [Message] constructor
  const Message({
    required this.location,
    required this.id,
    required this.chatId,
    required this.sender,
    required this.messageType,
    required this.content,
    required this.mediaUrl,
    required this.seenBy,
    required this.deletedBy,
    required this.isEdited,
    required this.editedAt,
    required this.editHistory,
    required this.createdAt,
    required this.updatedAt,
  });

  final Location location;
  final String id;
  final String chatId;
  final String sender;
  final MessageType messageType;
  final String content;
  final Uri mediaUrl;
  final List<String> seenBy;
  final List<String> deletedBy;
  final bool isEdited;
  final DateTime editedAt;
  final List<String> editHistory;
  final DateTime createdAt;
  final DateTime updatedAt;
}

/// [Location] entity
class Location {
  /// [Location] constructor
  const Location({
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;
}

/// [MessageType] the type of message
enum MessageType {
  /// [text]
  text,

  /// [image]
  image,

  /// [video]
  video,

  /// [audio]
  audio,

  /// [document]
  document,

  /// [sticker]
  sticker,

  /// [voiceNote]
  voiceNote,

  /// [location]
  location
}

/// [MessageType] an extention class on [MessageType] enum
extension MessageTypeExtension on MessageType {
  /// [string] to convert enum into string
  String get string {
    switch (this) {
      case MessageType.text:
        return 'text';
      case MessageType.image:
        return 'image';

      case MessageType.video:
        return 'video';

      case MessageType.audio:
        return 'audio';

      case MessageType.document:
        return 'document';

      case MessageType.sticker:
        return 'sticker';

      case MessageType.voiceNote:
        return 'voiceNote';

      case MessageType.location:
        return 'location';
    }
  }
}
