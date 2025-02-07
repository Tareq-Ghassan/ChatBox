import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:dartz/dartz.dart';

/// [GetAllChatsRepository] an abstract repo class for get all chats
abstract class GetAllChatsRepository {
  /// [getAllChats] function
  Future<Either<Failure, Chats>> getAllChats({
    required int index,
    required int perPage,
  });
}
