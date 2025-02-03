import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/repository/get_all_chats_repository.dart';
import 'package:chat/features/chat/domain/usecase/get_all_chats_usecase.dart';
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

  setUp(() {
    repo = MockGetAllChatsRepository();
    useCase = GetAllChatsUseCase(repo: repo);
  });

  test('Should return Chat entity when repo is return success', () async {
    //? Arrange
    when(repo.getAllChats())
        .thenAnswer((_) async => const Right<Failure, Chats>(tChats));

    //# Act
    final result = await useCase(NoParams());

    //! Assert
    expect(result, const Right<Failure, Chats>(tChats));
    verify(repo.getAllChats());
    verifyNoMoreInteractions(repo);
  });

  test('Should return Failure when repo is return Failure', () async {
    //? Arrange
    when(repo.getAllChats()).thenAnswer(
      (_) async => const Left<Failure, Chats>(ServerFailure(message: 'Hello')),
    );

    //# Act
    final result = await useCase(NoParams());

    //! Assert
    expect(result, const Left<Failure, Chats>(ServerFailure(message: 'Hello')));
    verify(repo.getAllChats());
    verifyNoMoreInteractions(repo);
  });
}
