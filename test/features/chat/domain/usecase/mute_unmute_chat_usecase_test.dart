import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/domain/repository/mute_unmute_chat_repository.dart';
import 'package:chat/features/chat/domain/usecase/mute_unmute_chat_usecase.dart';
import 'package:chat/features/chat/domain/usecase/params/mute_unmute_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mute_unmute_chat_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MuteUnmuteChatRepository>()])
void main() {
  late MockMuteUnmuteChatRepository repo;
  late MuteUnmuteChatUsecase useCase;

  const tParams = MuteUnmuteParams(
    chatId: '',
    isMute: true,
  );

  setUp(() {
    repo = MockMuteUnmuteChatRepository();
    useCase = MuteUnmuteChatUsecase(repository: repo);
  });

  test('Should return Chat entity when repo is return success', () async {
    //? Arrange
    when(repo.muteUnmute(chatId: tParams.chatId, isMute: tParams.isMute))
        .thenAnswer((_) async =>  Right<Failure, String>(tParams.chatId));

    //# Act
    final result = await useCase(tParams);

    //! Assert
    expect(result,  Right<Failure, String>(tParams.chatId));
    verify(repo.muteUnmute(chatId: tParams.chatId, isMute: tParams.isMute));
    verifyNoMoreInteractions(repo);
  });

  test('Should return Failure when repo is return Failure', () async {
    //? Arrange
    when(
      repo.muteUnmute(
        chatId: tParams.chatId,
        isMute: tParams.isMute,
      ),
    ).thenAnswer(
      (_) async => const Left<Failure, String>(ServerFailure(message: 'Hello')),
    );

    //# Act
    final result = await useCase(tParams);

    //! Assert
    expect(result, const Left<Failure, void>(ServerFailure(message: 'Hello')));
    verify(repo.muteUnmute(chatId: tParams.chatId, isMute: tParams.isMute));
    verifyNoMoreInteractions(repo);
  });
}
