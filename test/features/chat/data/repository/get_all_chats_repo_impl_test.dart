// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/data_source/get_all_chats_data_source.dart';
import 'package:chat/features/chat/data/model/chats_model.dart';
import 'package:chat/features/chat/data/repository/get_all_chats_repo_impl.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_chats_repo_impl.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllChatsDataSource>()])
void main() {
  late GetAllChatsRepositoryImpl repository;
  late MockGetAllChatsDataSource dataSource;

  const tHeaderModel = HeaderModel(errorCode: '00000', message: 'Success');

  const tChatsModel = ChatsModel(
    header: tHeaderModel,
    chats: [],
    currentPage: 1,
    perPage: 12,
    totalChats: 1,
    totalPages: 10,
  );

  setUp(
    () {
      dataSource = MockGetAllChatsDataSource();
      repository = GetAllChatsRepositoryImpl(datasource: dataSource);
    },
  );
  group('get all chats', () {
    test(
        'Should return remote data when the call to remote data source is successful',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenAnswer((_) async => tChatsModel);

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      expect(
        result,
        equals(
          const Right<Failure, ChatsModel>(
            tChatsModel,
          ),
        ),
      );
      verify(
        dataSource.getAllChats(),
      ).called(1);
    });
    test('Should return Network Failure when no internet connection', () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(NetworkException());

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      expect(
        result,
        equals(Left<Failure, ChatsModel>(NetworkFailure())),
      );
    });

    test(
        'Should return Server Failure when the call to remote data source throws ServerException',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(const ServerException(message: 'Server error'));

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      verify(
        dataSource.getAllChats(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ChatsModel>(
            ServerFailure(message: 'Server error'),
          ),
        ),
      );
    });
    test(
        'Should return Unauthorized Failure when the call to remote data source is unauthorizedException',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(const UnauthorizedException(message: 'error'));

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      verify(
        dataSource.getAllChats(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ChatsModel>(
            UnauthorizedFailure(message: 'error'),
          ),
        ),
      );
    });
    test(
        'Should return Client Failure when the call to remote data source is ClientException',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(const ClientException(error: '-1', message: 'error'));

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      verify(
        dataSource.getAllChats(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ChatsModel>(
            ClientFailure(error: '-1', message: 'error'),
          ),
        ),
      );
    });
    test('Should allow multiple calls without interference', () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenAnswer((_) async => tChatsModel);

      //# Act
      final results = await Future.wait([
        repository.getAllChats(),
        repository.getAllChats(),
      ]);

      //! Assert
      expect(
        results,
        equals([
          const Right<Failure, ChatsModel>(
            tChatsModel,
          ),
          const Right<Failure, ChatsModel>(
            tChatsModel,
          ),
        ]),
      );
    });
    test(
        'Should return Catch Failure when the call to remote data source is CatchException',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(
        CatchException(
          exception: '-1',
          stackTrace: StackTrace.fromString('error'),
        ),
      );

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      verify(
        dataSource.getAllChats(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          Left<Failure, ChatsModel>(
            CatchFailure(
              exception: '-1',
              stackTrace: StackTrace.fromString('error'),
            ),
          ),
        ),
      );
    });
    test('Should return Server Failure when a timeout exception occurs',
        () async {
      //? Arrange
      when(
        dataSource.getAllChats(),
      ).thenThrow(TimeoutException('Request timeout'));

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      expect(result, isA<Left<Failure, Chats>>());
    });

    test('Should return Catch Failure when the response contains null fields',
        () async {
      //? Arrange
      const expectedException = 'Malformed data';
      final expectedStackTrace = StackTrace.fromString('mocked-stack-trace');

      when(
        dataSource.getAllChats(),
      ).thenThrow(
        CatchException(
          exception: expectedException,
          stackTrace: expectedStackTrace,
        ),
      );

      //# Act
      final result = await repository.getAllChats();

      //! Assert
      expect(result.isLeft(), true);
      final failure = result.fold((l) => l, (r) => null)! as CatchFailure;

      // Check individual fields
      expect(failure.exception, expectedException);
      expect(failure.stackTrace.toString(), expectedStackTrace.toString());
    });
  });
}
