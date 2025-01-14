// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:chat/core/error/exceptions.dart';
import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/data/data_source/initialize_data_source.dart';
import 'package:chat/features/pre_login/data/model/initialize_model.dart';
import 'package:chat/features/pre_login/data/repositories/initialize_repository_impl.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<InitializeDataSource>(),
])
import 'initialize_repo_impl_test.mocks.dart';

void main() {
  late InitializeRepositoryImpl repository;
  late MockInitializeDataSource mockDataSource;
  const tIsInitialize = true;
  const tInitializeModel = InitializeModel(isInitialize: tIsInitialize);
  const Initialize tInitialize = tInitializeModel;
  const tAppKey = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx';
  const tAppSecret = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx';

  setUpAll(() async {
    mockDataSource = MockInitializeDataSource();
    repository = InitializeRepositoryImpl(
      dataSource: mockDataSource,
    );
  });
  tearDown(() {
    reset(mockDataSource);
  });

  group('get Is Initialized Data', () {
    test(
        'Should return remote data when the call to remote data source is successful',
        () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenAnswer((_) async => tInitializeModel);

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      expect(result, equals(const Right<Failure, Initialize>(tInitialize)));
      verify(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).called(1);
    });
    test('Should return Network Failure when no internet connection', () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(NetworkException());

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      expect(result, equals(Left<Failure, Initialize>(NetworkFailure())));
    });
    
    test(
        'Should return Server Failure when the call to remote data source throws ServerException',
        () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(const ServerException(message: 'Server error'));

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      verify(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      );
      verifyNoMoreInteractions(mockDataSource);
      expect(
        result,
        equals(
          const Left<Failure, Initialize>(
            ServerFailure(message: 'Server error'),
          ),
        ),
      );
    });
    test(
        'Should return Unauthorized Failure when the call to remote data source is unautharizedException',
        () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(const UnauthorizedException(message: 'error'));

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      verify(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      );
      verifyNoMoreInteractions(mockDataSource);
      expect(
        result,
        equals(
          const Left<Failure, Initialize>(
            UnauthorizedFailure(message: 'error'),
          ),
        ),
      );
    });
    test(
        'Should return Client Failure when the call to remote data source is ClientException',
        () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(const ClientException(error: '-1', message: 'error'));

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      verify(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      );
      verifyNoMoreInteractions(mockDataSource);
      expect(
        result,
        equals(
          const Left<Failure, Initialize>(
            ClientFailure(error: '-1', message: 'error'),
          ),
        ),
      );
    });
    test('Should allow multiple calls without interference', () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenAnswer((_) async => tInitializeModel);

      // Act
      final results = await Future.wait([
        repository.initialize(appKey: tAppKey, appSecret: tAppSecret),
        repository.initialize(appKey: tAppKey, appSecret: tAppSecret),
      ]);

      // Assert
      expect(
        results,
        equals([
          const Right<Failure, Initialize>(tInitialize),
          const Right<Failure, Initialize>(tInitialize),
        ]),
      );
    });
    test(
        'Should return Catch Failure when the call to remote data source is CatchException',
        () async {
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(
        CatchException(
          exception: '-1',
          stackTrace: StackTrace.fromString('error'),
        ),
      );

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      verify(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      );
      verifyNoMoreInteractions(mockDataSource);
      expect(
        result,
        equals(
          Left<Failure, Initialize>(
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
      // Arrange
      when(
        mockDataSource.initialize(
          appKey: tAppKey,
          appSecret: tAppSecret,
        ),
      ).thenThrow(TimeoutException('Request timeout'));

      // Act
      final result = await repository.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      );

      // Assert
      expect(result, isA<Left<Failure, Initialize>>());
    });
  });

  test('Should return Catch Failure when the response contains null fields',
      () async {
    // Arrange
    const expectedException = 'Malformed data';
    final expectedStackTrace = StackTrace.fromString('mocked-stack-trace');

    when(
      mockDataSource.initialize(
        appKey: tAppKey,
        appSecret: tAppSecret,
      ),
    ).thenThrow(
      CatchException(
        exception: expectedException,
        stackTrace: expectedStackTrace,
      ),
    );

    // Act
    final result = await repository.initialize(
      appKey: tAppKey,
      appSecret: tAppSecret,
    );

    // Assert
    expect(result.isLeft(), true);
    final failure = result.fold((l) => l, (r) => null)! as CatchFailure;

    // Check individual fields
    expect(failure.exception, expectedException);
    expect(failure.stackTrace.toString(), expectedStackTrace.toString());
  });
}
