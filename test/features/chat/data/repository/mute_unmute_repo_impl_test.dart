import 'dart:async';

import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/data_source/mute_unmute_chat_data_source.dart';
import 'package:chat/features/chat/data/repository/mute_unmute_chat_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mute_unmute_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MuteUnmuteChatDataSource>()])
void main() {
  late MuteUnmuteChatRepositoryImpl repository;
  late MockMuteUnmuteChatDataSource dataSource;

  setUp(
    () {
      dataSource = MockMuteUnmuteChatDataSource();
      repository = MuteUnmuteChatRepositoryImpl(dataSource: dataSource);
    },
  );
  group('get all chats', () {
    test(
        'Should return remote data when the call to remote data source is'
        ' successful', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenAnswer((_) async {});

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      expect(
        result,
        equals(
          const Right<Failure, void>(
            null,
          ),
        ),
      );
      verify(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).called(1);
    });
    test('Should return Network Failure when no internet connection', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(NetworkException());

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      expect(
        result,
        equals(Left<Failure, void>(NetworkFailure())),
      );
    });

    test(
        'Should return Server Failure when the call to remote data source '
        'throws ServerException', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(const ServerException(message: 'Server error'));

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      verify(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, void>(
            ServerFailure(message: 'Server error'),
          ),
        ),
      );
    });
    test(
        'Should return Unauthorized Failure when the call to remote data source'
        ' is unauthorizedException', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(const UnauthorizedException(message: 'error'));

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      verify(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, void>(
            UnauthorizedFailure(message: 'error'),
          ),
        ),
      );
    });
    test(
        'Should return Client Failure when the call to remote data source is'
        ' ClientException', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(const ClientException(error: '-1', message: 'error'));

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      verify(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, void>(
            ClientFailure(error: '-1', message: 'error'),
          ),
        ),
      );
    });
    test('Should allow multiple calls without interference', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenAnswer((_) async {});

      //# Act
      final results = await Future.wait([
        repository.muteUnmute(isMute: true, chatId: 'c'),
        repository.muteUnmute(isMute: true, chatId: 'c'),
      ]);

      //! Assert
      expect(
        results,
        equals([
          const Right<Failure, void>(
            null,
          ),
          const Right<Failure, void>(
            null,
          ),
        ]),
      );
    });
    test(
        'Should return Catch Failure when the call to remote data source is'
        ' CatchException', () async {
      //? Arrange
      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(
        CatchException(
          exception: '-1',
          stackTrace: StackTrace.fromString('error'),
        ),
      );

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      verify(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          Left<Failure, void>(
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
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(TimeoutException('Request timeout'));

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      expect(result, isA<Left<Failure, void>>());
    });

    test('Should return Catch Failure when the response contains null fields',
        () async {
      //? Arrange
      const expectedException = 'Malformed data';
      final expectedStackTrace = StackTrace.fromString('mocked-stack-trace');

      when(
        dataSource.muteUnmute(isMute: true, chatId: 'c'),
      ).thenThrow(
        CatchException(
          exception: expectedException,
          stackTrace: expectedStackTrace,
        ),
      );

      //# Act
      final result = await repository.muteUnmute(isMute: true, chatId: 'c');

      //! Assert
      expect(result.isLeft(), true);
      final failure = result.fold((l) => l, (r) => null)! as CatchFailure;

      // Check individual fields
      expect(failure.exception, expectedException);
      expect(failure.stackTrace.toString(), expectedStackTrace.toString());
    });
  });
}
