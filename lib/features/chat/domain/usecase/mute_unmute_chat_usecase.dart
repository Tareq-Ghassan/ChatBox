import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/chat/domain/repository/mute_unmute_chat_repository.dart';
import 'package:chat/features/chat/domain/usecase/params/mute_unmute_params.dart';
import 'package:dartz/dartz.dart';

/// [MuteUnmuteChatUsecase] a mute and unmute use case
class MuteUnmuteChatUsecase extends BaseUseCase<void, MuteUnmuteParams> {
  ///[MuteUnmuteChatUsecase] constructor
  MuteUnmuteChatUsecase({required this.repository});

  /// [repository] is a [MuteUnmuteChatRepository]
  final MuteUnmuteChatRepository repository;

  @override
  Future<Either<Failure, String>> call(MuteUnmuteParams params) async =>
      repository.muteUnmute(isMute: params.isMute, chatId: params.chatId);
}
