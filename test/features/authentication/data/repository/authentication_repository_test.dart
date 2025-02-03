// ignore_for_file: lines_longer_than_80_chars, document_ignores


import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:chat/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthenticationLocalDataSource>(),
])
void main() {
  late AuthenticationRepositoryImpl auth;
  late MockAuthenticationLocalDataSource localDataSource;

  setUp(
    () {
      localDataSource = MockAuthenticationLocalDataSource();
      auth = AuthenticationRepositoryImpl(localDataSource: localDataSource);
    },
  );
  group(
    'Store JWT',
    () {
      test('Should store JWT', () async {
        //? Arrange
        when(localDataSource.cacheJWT(jwt: 'jwt'))
            .thenAnswer((_) async => const Right<Failure, void>(null));
        //# Act
        final result = await auth.storeJWT('jwt');
        //! Assert
        expect(result, const Right<Failure, void>(null));
      });

      test('Should return CacheFailure when cache throws Exception', () async {
        //? Arrange
        when(localDataSource.cacheJWT(jwt: 'jwt')).thenThrow(
          (_) async => CacheFailure(
            exception: 'Exception',
            stackTrace: StackTrace.fromString('stackTrace'),
          ),
        );
        //# Act
        final result = await auth.storeJWT('jwt');
        //! Assert
        expect(
          result,
          Left<Failure, void>(
            CacheFailure(
              exception: 'Exception',
              stackTrace: StackTrace.fromString('stackTrace'),
            ),
          ),
        );
      });
    },
  );

  group(
    'Get JWT',
    () {
      test('Should get JWT', () async {
        //? Arrange
        when(localDataSource.getJWT()).thenAnswer((_) async => '');
        //# Act
        final result = await auth.getJWT();
        //! Assert
        expect(result, const Right<Failure, String?>(''));
      });
      test(
          'Should return UnAuthorizedFailure when data source throws UnAuthorizedException',
          () async {
        //? Arrange
        when(localDataSource.getJWT()).thenThrow(
          (_) async => const UnauthorizedFailure(
            message: 'Invalid Token',
          ),
        );
        //# Act
        final result = await auth.getJWT();
        //! Assert
        expect(
          result,
          const Left<Failure, String>(
            UnauthorizedFailure(
              message: 'Invalid Token',
            ),
          ),
        );
      });
      test('Should return CacheFailure when cache throws Exception', () async {
        //? Arrange
        when(localDataSource.getJWT()).thenThrow(
          (_) async => CacheFailure(
            exception: 'Exception',
            stackTrace: StackTrace.fromString('stackTrace'),
          ),
        );
        //# Act
        final result = await auth.getJWT();
        //! Assert
        expect(
          result,
          Left<Failure, String?>(
            CacheFailure(
              exception: 'Exception',
              stackTrace: StackTrace.fromString('stackTrace'),
            ),
          ),
        );
      });
    },
  );
}
