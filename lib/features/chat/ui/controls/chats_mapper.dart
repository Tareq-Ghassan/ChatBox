import 'package:chat/features/chat/domain/entity/chats.dart';

/// [ChatsMapper] a class to map thing into something
class ChatsMapper {
  /// [mapMessageType] it maps what the subtitle should be
  /// in `ChatItem` widget
  ///
  /// in case type is text the content shows there
  ///
  /// else the type it self shows there
  static String mapMessageType(Message message) {
    if (message.messageType == MessageType.text) {
      return message.content;
    } else {
      return message.messageType.string;
    }
  }
}
