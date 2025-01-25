import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/signup_repository.dart';
import 'package:chat/features/authentication/domain/usecase/params/signup_params.dart';
import 'package:chat/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignupRepository>()])
void main() {
  late SignupUsecase useCase;
  late MockSignupRepository repo;
  const tSignupParams = SignupParams(
    name: 'name',
    countryCode: 'countryCode',
    phoneNumber: 'phoneNumber',
    email: 'email',
    password: 'password',
    confirmPassword: 'confirmPassword',
  );
  const tHeader = Header(jwt: 'xxxx');
  const tUserData = UserData(name: 'Tareq', email: 't@t.t');
  const tLogin = Login(header: tHeader, userData: tUserData);

  setUp(
    () {
      repo = MockSignupRepository();
      useCase = SignupUsecase(repository: repo);
    },
  );
  test('Should return Entity when repo return Entity', () async {
    // arrange
    when(
      repo.signup(
        name: tSignupParams.name,
        email: tSignupParams.email,
        phoneNumber: tSignupParams.phoneNumber,
        password: tSignupParams.password,
        confirmPassword: tSignupParams.confirmPassword,
        countryCode: tSignupParams.countryCode,
      ),
    ).thenAnswer(
      (_) async => const Right<Failure, Login>(tLogin),
    );

    // act
    final result = await useCase(tSignupParams);

    // assert
    expect(result, const Right<Failure, Login>(tLogin));
    verify(
      repo.signup(
        name: tSignupParams.name,
        email: tSignupParams.email,
        phoneNumber: tSignupParams.phoneNumber,
        password: tSignupParams.password,
        confirmPassword: tSignupParams.confirmPassword,
        countryCode: tSignupParams.countryCode,
      ),
    );
    verifyNoMoreInteractions(repo);
  });
  test('Should return failure when Repo return Failure', () async {
    // arrange
    when(
      repo.signup(
        name: tSignupParams.name,
        email: tSignupParams.email,
        phoneNumber: tSignupParams.phoneNumber,
        password: tSignupParams.password,
        confirmPassword: tSignupParams.confirmPassword,
        countryCode: tSignupParams.countryCode,
      ),
    ).thenAnswer(
      (_) async => const Left<Failure, Login>(ServerFailure(message: '')),
    );

    // act
    final result = await useCase(tSignupParams);
    // assert
    expect(result, const Left<Failure, Login>(ServerFailure(message: '')));
    verify(
      repo.signup(
        name: tSignupParams.name,
        email: tSignupParams.email,
        phoneNumber: tSignupParams.phoneNumber,
        password: tSignupParams.password,
        confirmPassword: tSignupParams.confirmPassword,
        countryCode: tSignupParams.countryCode,
      ),
    );
    verifyNoMoreInteractions(repo);
  });
}
