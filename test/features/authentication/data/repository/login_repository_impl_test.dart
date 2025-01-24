// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/data_source/login_data_source.dart';
import 'package:chat/features/authentication/data/model/login_model.dart';
import 'package:chat/features/authentication/data/repository/login_repository_impl.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginDataSource>()])
void main() {
  late MockLoginDataSource dataSource;
  late LoginRepositoryImpl repo;
  const tHeader = HeaderModel(
    errorCode: '00000',
    message: 'Success',
    jwt: 'xxxxxx',
  );
  const tUserData =
      UserDataModel(name: 'Tareq Ghassan', email: 'test@gmail.com');
  const tLoginModel = LoginModel(header: tHeader, userData: tUserData);
  const tLogin = tLoginModel;

  setUp(() {
    dataSource = MockLoginDataSource();
    repo = LoginRepositoryImpl(dataSource: dataSource);
  });

  group('get Login Data', () {
    test(
        'Should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(dataSource.login(email: '', password: '')).thenAnswer(
        (_) async => tLoginModel,
      );

      // act
      final result = await repo.login(email: '', password: '');

      // assert
      expect(result, const Right<Failure, Login>(tLoginModel));
    });
    test('Should return Network Failure when no internet connection', () async {
      // Arrange
      when(
        dataSource.login(email: '', password: ''),
      ).thenThrow(NetworkException());

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      expect(result, equals(Left<Failure, Login>(NetworkFailure())));
    });

    test(
        'Should return Server Failure when the call to remote data source throws ServerException',
        () async {
      // Arrange
      when(
        dataSource.login(email: '', password: ''),
      ).thenThrow(const ServerException(message: 'Server error'));

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      verify(
        dataSource.login(email: '', password: ''),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, Login>(
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
        dataSource.login(email: '', password: ''),
      ).thenThrow(const UnauthorizedException(message: 'error'));

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      verify(
        dataSource.login(email: '', password: ''),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, Login>(
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
        dataSource.login(email: '', password: ''),
      ).thenThrow(const ClientException(error: '-1', message: 'error'));

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      verify(
        dataSource.login(email: '', password: ''),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          const Left<Failure, Login>(
            ClientFailure(error: '-1', message: 'error'),
          ),
        ),
      );
    });
    test('Should allow multiple calls without interference', () async {
      // Arrange
      when(
        dataSource.login(email: '', password: ''),
      ).thenAnswer((_) async => tLoginModel);

      // Act
      final results = await Future.wait([
        repo.login(email: '', password: ''),
        repo.login(email: '', password: ''),
      ]);

      // Assert
      expect(
        results,
        equals([
          const Right<Failure, Login>(tLogin),
          const Right<Failure, Login>(tLogin),
        ]),
      );
    });
    test(
        'Should return Catch Failure when the call to remote data source is CatchException',
        () async {
      // Arrange
      when(
        dataSource.login(email: '', password: ''),
      ).thenThrow(
        CatchException(
          exception: '-1',
          stackTrace: StackTrace.fromString('error'),
        ),
      );

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      verify(
        dataSource.login(email: '', password: ''),
      );
      verifyNoMoreInteractions(dataSource);
      expect(
        result,
        equals(
          Left<Failure, Login>(
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
        dataSource.login(email: '', password: ''),
      ).thenThrow(TimeoutException('Request timeout'));

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      expect(result, isA<Left<Failure, Login>>());
    });

    test('Should return Catch Failure when the response contains null fields',
        () async {
      // Arrange
      const expectedException = 'Malformed data';
      final expectedStackTrace = StackTrace.fromString('mocked-stack-trace');

      when(
        dataSource.login(email: '', password: ''),
      ).thenThrow(
        CatchException(
          exception: expectedException,
          stackTrace: expectedStackTrace,
        ),
      );

      // Act
      final result = await repo.login(email: '', password: '');

      // Assert
      expect(result.isLeft(), true);
      final failure = result.fold((l) => l, (r) => null)! as CatchFailure;

      // Check individual fields
      expect(failure.exception, expectedException);
      expect(failure.stackTrace.toString(), expectedStackTrace.toString());
    });
  });
}
