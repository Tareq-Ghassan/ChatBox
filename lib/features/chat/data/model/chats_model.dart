import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';

/// [ChatsModel] represent api response class for get
/// all chats
class ChatsModel extends Chats {
  /// [ChatsModel] constructor
  const ChatsModel({
    required this.header,
    required super.chats,
    required super.currentPage,
    required super.perPage,
    required super.totalChats,
    required super.totalPages,
  });

  /// [ChatsModel.fromJson] a factory constructor to convert
  /// json into object
  factory ChatsModel.fromJson(Map<String, dynamic> json) {
    final header =
        json['header'] != null && json['header'] is Map<String, dynamic>
            ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
            : null;

    final chats = (json['chats'] as List<dynamic>?)
            ?.map((v) => ChatModel.fromJson(v as Map<String, dynamic>))
            .toList() ??
        [];
    final currentPage =
        json['currentPage'] is int ? json['currentPage'] as int : 0;
    final perPage = json['perPage'] is int ? json['perPage'] as int : 0;
    final totalChats =
        json['totalChats'] is int ? json['totalChats'] as int : 0;
    final totalPages =
        json['totalPages'] is int ? json['totalPages'] as int : 0;

    return ChatsModel(
      header: header,
      chats: chats,
      currentPage: currentPage,
      perPage: perPage,
      totalChats: totalChats,
      totalPages: totalPages,
    );
  }

  /// [header] api header
  final HeaderModel? header;
}

/// [ChatModel] represent Chat Model
class ChatModel extends Chat {
  /// [ChatModel] constructor
  const ChatModel({
    required super.id,
    required super.participants,
    required super.lastMessage,
    required super.isGroup,
    required super.groupName,
    required super.groupImage,
    required super.archivedBy,
    required super.mutedBy,
    required super.deletedBy,
    required super.createdAt,
    required super.updatedAt,
  });

  /// [ChatModel.fromJson] a factory constructor to convert
  /// json into object
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    final id = json['_id'] is String ? json['_id'] as String : '';
    final participants = (json['participants'] as List<dynamic>?)
            ?.map((v) => v as String)
            .toList() ??
        [];
    final lastMessage = json['lastMessage'] != null &&
            json['lastMessage'] is Map<String, dynamic>
        ? MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>)
        : MessageModel(
            location: const Location(latitude: 0, longitude: 0),
            id: id,
            chatId: '',
            sender: '',
            messageType: MessageType.text,
            content: '',
            mediaUrl: Uri(),
            seenBy: [],
            deletedBy: [],
            isEdited: false,
            editedAt: DateTime(1900),
            editHistory: [],
            createdAt: DateTime(1900),
            updatedAt: DateTime(1900),
          );

    final isGroup = json['isGroup'] as bool;
    final groupName =
        json['groupName'] is String ? json['groupName'] as String : '';
    final groupImage =
        json['groupImage'] is String ? json['groupImage'] as String : '';

    final archivedBy = (json['archivedBy'] as List<dynamic>?)
            ?.map((v) => v as String)
            .toList() ??
        [];

    final mutedBy =
        (json['mutedBy'] as List<dynamic>?)?.map((v) => v as String).toList() ??
            [];

    final deletedBy = (json['deletedBy'] as List<dynamic>?)
            ?.map((v) => v as String)
            .toList() ??
        [];
    final createdAt = json['createdAt'] is String &&
            json['createdAt'] != '' &&
            DateTime.tryParse(json['createdAt'] as String) != null
        ? DateTime.parse(json['createdAt'] as String)
        : DateTime(1900);

    final updatedAt = json['updatedAt'] is String &&
            json['updatedAt'] != '' &&
            DateTime.tryParse(json['updatedAt'] as String) != null
        ? DateTime.parse(json['updatedAt'] as String)
        : DateTime(1900);

    return ChatModel(
      id: id,
      participants: participants,
      lastMessage: lastMessage,
      isGroup: isGroup,
      groupName: groupName,
      groupImage: groupImage,
      archivedBy: archivedBy,
      mutedBy: mutedBy,
      deletedBy: deletedBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// [MessageModel] represent Message Model
class MessageModel extends Message {
  /// [MessageModel] constructor
  const MessageModel({
    required super.location,
    required super.id,
    required super.chatId,
    required super.sender,
    required super.messageType,
    required super.content,
    required super.mediaUrl,
    required super.seenBy,
    required super.deletedBy,
    required super.isEdited,
    required super.editedAt,
    required super.editHistory,
    required super.createdAt,
    required super.updatedAt,
  });

  /// [MessageModel.fromJson] a factory constructor to convert
  /// json into object
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final location =
        json['location'] != null && json['location'] is Map<String, dynamic>
            ? LocationModel.fromJson(json['location'] as Map<String, dynamic>)
            : const LocationModel(latitude: 0, longitude: 0);
    final id = json['_id'] is String ? json['_id'] as String : '';
    final chatId = json['chatId'] is String ? json['chatId'] as String : '';
    final sender = json['sender'] is String ? json['sender'] as String : '';
    final messageType = MessageType.values.firstWhere(
      (element) => element.string == json['messageType'] as String,
    );
    final content = json['content'] is String ? json['content'] as String : '';
    final mediaUrl = json['mediaUrl'] is Uri ? json['mediaUrl'] as Uri : Uri();
    final seenBy =
        (json['seenBy'] as List<dynamic>?)?.map((v) => v as String).toList() ??
            [];
    final deletedBy = (json['deletedBy'] as List<dynamic>?)
            ?.map((v) => v as String)
            .toList() ??
        [];
    final isEdited = json['isEdited'] as bool;
    final editedAt = json['editedAt'] is String &&
            json['editedAt'] != '' &&
            DateTime.tryParse(json['editedAt'] as String) != null
        ? DateTime.parse(json['editedAt'] as String)
        : DateTime(1900);

    final editHistory = (json['editHistory'] as List<dynamic>?)
            ?.map((v) => v as String)
            .toList() ??
        [];

    final createdAt = json['createdAt'] is String &&
            json['createdAt'] != '' &&
            DateTime.tryParse(json['createdAt'] as String) != null
        ? DateTime.parse(json['createdAt'] as String)
        : DateTime(1900);
    final updatedAt = json['updatedAt'] is String &&
            json['updatedAt'] != '' &&
            DateTime.tryParse(json['updatedAt'] as String) != null
        ? DateTime.parse(json['updatedAt'] as String)
        : DateTime(1900);

    return MessageModel(
      location: location,
      id: id,
      chatId: chatId,
      sender: sender,
      messageType: messageType,
      content: content,
      mediaUrl: mediaUrl,
      seenBy: seenBy,
      deletedBy: deletedBy,
      isEdited: isEdited,
      editedAt: editedAt,
      editHistory: editHistory,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// [LocationModel] represent Location Model
class LocationModel extends Location {
  /// [LocationModel] constructor
  const LocationModel({
    required super.longitude,
    required super.latitude,
  });

  /// [LocationModel.fromJson] a factory constructor to convert
  /// json into object
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final longitude =
        json['longitude'] is double ? json['longitude'] as double : 0.0;
    final latitude =
        json['latitude'] is double ? json['latitude'] as double : 0.0;

    return LocationModel(
      longitude: longitude,
      latitude: latitude,
    );
  }
}
