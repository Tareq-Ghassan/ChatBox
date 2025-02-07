import 'package:chat/core/error/error.dart';
import 'package:dartz/dartz.dart';

/// [MuteUnmuteChatRepository] abstract class hold repo that mute or unmute chat
abstract class MuteUnmuteChatRepository {
  /// [muteUnmute] function
  Future<Either<Failure, String>> muteUnmute({
    required bool isMute,
    required String chatId,
  });
}
