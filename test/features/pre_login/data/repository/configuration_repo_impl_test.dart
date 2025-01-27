// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/data/data_source/configuration_data_source.dart';
import 'package:chat/features/pre_login/data/model/configuration_model.dart';
import 'package:chat/features/pre_login/data/repository/configuration_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'configuration_repo_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ConfigurationDataSource>(),
])
void main() {
  late MockConfigurationDataSource dataSource;
  late ConfigurationRepositoryImpl repository;

  const tCountryCodeModel = CountryCodeModel(name: 'Afghanistan', code: '+93');
  const tCountryCodeModel2 = CountryCodeModel(name: 'Albania', code: '+355');
  const tConfigurationModel = ConfigurationModel(
    countryCodes: [tCountryCodeModel, tCountryCodeModel2],
  );
  const tHeaderModel = HeaderModel(errorCode: '00000', message: 'Success');
  const tConfigurationResponseModel = ConfigurationResponseModel(
    header: tHeaderModel,
    body: tConfigurationModel,
  );

  setUp(
    () {
      dataSource = MockConfigurationDataSource();
      repository = ConfigurationRepositoryImpl(dataSource: dataSource);
    },
  );

  group('get Configuration Data', () {
    test(
        'Should return remote data when the call to remote data source is successful',
        () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenAnswer((_) async => tConfigurationResponseModel);

      // Act
      final result = await repository.getConfiguration();

      // Assert
      expect(
        result,
        equals(
          const Right<Failure, ConfigurationResponseModel>(
            tConfigurationResponseModel,
          ),
        ),
      );
      verify(
        dataSource.getConfiguration(),
      ).called(1);
    });
    test('Should return Network Failure when no internet connection', () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenThrow(NetworkException());

      // Act
      final result = await repository.getConfiguration();

      // Assert
      expect(
        result,
        equals(Left<Failure, ConfigurationResponseModel>(NetworkFailure())),
      );
    });

    test(
        'Should return Server Failure when the call to remote data source throws ServerException',
        () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenThrow(const ServerException(message: 'Server error'));

      // Act
      final result = await repository.getConfiguration();

      // Assert
      verify(
        dataSource.getConfiguration(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ConfigurationResponseModel>(
            ServerFailure(message: 'Server error'),
          ),
        ),
      );
    });
    test(
        'Should return Unauthorized Failure when the call to remote data source is unauthorizedException',
        () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenThrow(const UnauthorizedException(message: 'error'));

      // Act
      final result = await repository.getConfiguration();

      // Assert
      verify(
        dataSource.getConfiguration(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ConfigurationResponseModel>(
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
        dataSource.getConfiguration(),
      ).thenThrow(const ClientException(error: '-1', message: 'error'));

      // Act
      final result = await repository.getConfiguration();

      // Assert
      verify(
        dataSource.getConfiguration(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, ConfigurationResponseModel>(
            ClientFailure(error: '-1', message: 'error'),
          ),
        ),
      );
    });
    test('Should allow multiple calls without interference', () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenAnswer((_) async => tConfigurationResponseModel);

      // Act
      final results = await Future.wait([
        repository.getConfiguration(),
        repository.getConfiguration(),
      ]);

      // Assert
      expect(
        results,
        equals([
          const Right<Failure, ConfigurationResponseModel>(
            tConfigurationResponseModel,
          ),
          const Right<Failure, ConfigurationResponseModel>(
            tConfigurationResponseModel,
          ),
        ]),
      );
    });
    test(
        'Should return Catch Failure when the call to remote data source is CatchException',
        () async {
      // Arrange
      when(
        dataSource.getConfiguration(),
      ).thenThrow(
        CatchException(
          exception: '-1',
          stackTrace: StackTrace.fromString('error'),
        ),
      );

      // Act
      final result = await repository.getConfiguration();

      // Assert
      verify(
        dataSource.getConfiguration(),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          Left<Failure, ConfigurationResponseModel>(
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
        dataSource.getConfiguration(),
      ).thenThrow(TimeoutException('Request timeout'));

      // Act
      final result = await repository.getConfiguration();

      // Assert
      expect(result, isA<Left<Failure, ConfigurationResponseModel>>());
    });
  });

  test('Should return Catch Failure when the response contains null fields',
      () async {
    // Arrange
    const expectedException = 'Malformed data';
    final expectedStackTrace = StackTrace.fromString('mocked-stack-trace');

    when(
      dataSource.getConfiguration(),
    ).thenThrow(
      CatchException(
        exception: expectedException,
        stackTrace: expectedStackTrace,
      ),
    );

    // Act
    final result = await repository.getConfiguration();

    // Assert
    expect(result.isLeft(), true);
    final failure = result.fold((l) => l, (r) => null)! as CatchFailure;

    // Check individual fields
    expect(failure.exception, expectedException);
    expect(failure.stackTrace.toString(), expectedStackTrace.toString());
  });
}
