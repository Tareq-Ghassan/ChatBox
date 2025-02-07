import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/repository/get_all_chats_repository.dart';
import 'package:chat/features/chat/domain/usecase/get_all_chats_usecase.dart';
import 'package:chat/features/chat/domain/usecase/params/get_all_chats_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_chats_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllChatsRepository>()])
void main() {
  late MockGetAllChatsRepository repo;
  late GetAllChatsUseCase useCase;
  const tChats = Chats(
    chats: [],
    currentPage: 10,
    perPage: 10,
    totalChats: 10,
    totalPages: 10,
  );
  const tParams = GetAllChatsParams(index: 1, perPage: 10);

  setUp(() {
    repo = MockGetAllChatsRepository();
    useCase = GetAllChatsUseCase(repo: repo);
  });

  test('Should return Chat entity when repo is return success', () async {
    //? Arrange
    when(repo.getAllChats(index: 1,perPage: 10))
        .thenAnswer((_) async => const Right<Failure, Chats>(tChats));

    //# Act
    final result = await useCase(tParams);

    //! Assert
    expect(result, const Right<Failure, Chats>(tChats));
    verify(repo.getAllChats(index: 1,perPage: 10));
    verifyNoMoreInteractions(repo);
  });

  test('Should return Failure when repo is return Failure', () async {
    //? Arrange
    when(repo.getAllChats(index: 1,perPage: 10)).thenAnswer(
      (_) async => const Left<Failure, Chats>(ServerFailure(message: 'Hello')),
    );

    //# Act
    final result = await useCase(tParams);

    //! Assert
    expect(result, const Left<Failure, Chats>(ServerFailure(message: 'Hello')));
    verify(repo.getAllChats(index: 1,perPage: 10));
    verifyNoMoreInteractions(repo);
  });
}
