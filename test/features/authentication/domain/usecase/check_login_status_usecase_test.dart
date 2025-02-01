import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/authentication/domain/repository/authentication_repository.dart';
import 'package:chat/features/authentication/domain/usecase/check_login_status_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_login_status_usecase_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthenticationRepository>(),
])
void main() {
  late CheckLoginStatusUseCase useCase;
  late MockAuthenticationRepository repository;

  setUp(
    () {
      repository = MockAuthenticationRepository();
      useCase = CheckLoginStatusUseCase(repository: repository);
    },
  );

  test('Should check login status and return boolean', () async {
    //? Arrange
    when(repository.getJWT())
        .thenAnswer((_) async => const Right<Failure, String>('JWT'));

    //# Act
    final result = await useCase(NoParams());

    //! Assert
    expect(result, const Right<Failure, String>('JWT'));
  });

  test('Should return failure when Repo return Failure', () async {
    //? Arrange
    when(repository.getJWT()).thenAnswer(
      (_) async => const Left<Failure, String>(
        UnauthorizedFailure(message: 'Invalid Token'),
      ),
    );

    //# Act
    final result = await useCase(NoParams());

    //! Assert
    expect(
      result,
      const Left<Failure, String>(
        UnauthorizedFailure(message: 'Invalid Token'),
      ),
    );
  });
}
