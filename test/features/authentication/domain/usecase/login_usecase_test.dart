import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/login_repo.dart';
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/params/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginRepository>()])
void main() {
  late MockLoginRepository repo;
  late LoginUsecase usecase;

  const tPhoneNumber = PhoneNumber(number: 'Afghanistan', code: '+93');
  const tHeader = Header(jwt: 'xxxx');
  const tUserData =
      UserData(name: 'Tareq', email: 't@t.t', phoneNumber: tPhoneNumber);
  const tLogin = Login(header: tHeader, userData: tUserData);

  const tLoginParams = LoginParams(
    email: '',
    password: '',
  );
  setUp(() {
    repo = MockLoginRepository();
    usecase = LoginUsecase(repository: repo);
  });
  test('Login should return entity', () async {
    // Arrange
    when(
      repo.login(
        email: tLoginParams.email,
        password: tLoginParams.password,
      ),
    ).thenAnswer((_) async => const Right<Failure, Login>(tLogin));

    // Act
    final result = await usecase(tLoginParams);

    // Assert
    expect(result, const Right<Failure, Login>(tLogin));
    verify(
      repo.login(
        email: tLoginParams.email,
        password: tLoginParams.password,
      ),
    );
    verifyNoMoreInteractions(repo);
  });

  test('Login should return failure when Repo return Failure ', () async {
    // Arrange
    when(repo.login(password: '', email: '')).thenAnswer(
      (_) async => const Left<Failure, Login>(ServerFailure(message: '')),
    );

    // Act
    final result = await usecase(tLoginParams);

    // Assert
    expect(
      result,
      const Left<Failure, Login>(ServerFailure(message: '')),
    );
    verify(
      repo.login(
        email: tLoginParams.email,
        password: tLoginParams.password,
      ),
    );
    verifyNoMoreInteractions(repo);
  });
}
