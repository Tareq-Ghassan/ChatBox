// ignore_for_file: lines_longer_than_80_chars

import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUsecase>()])
void main() {
  late AuthenticationBloc bloc;
  late MockLoginUsecase loginUsecase;
  const tHeader = Header(jwt: 'xxxx');
  const tUserData = UserData(name: 'Tareq', email: 't@t.t');
  const tLogin = Login(header: tHeader, userData: tUserData);
  const email = '';
  const password = '';

  setUp(() {
    loginUsecase = MockLoginUsecase();
    bloc = AuthenticationBloc(loginUsecase: loginUsecase);
  });
  test('AuthenticationState should be Idle first', () async {
    // assert
    expect(bloc.state, isA<AuthenticationState>());
    expect(bloc.state, equals(Idle()));
  });
  test('Should call LoginUsecase', () async {
    // arrange
    when(loginUsecase(any)).thenAnswer((_) async => const Right(tLogin));
    // act
    bloc.add(const PerformLogin(email: email, password: password));
    await untilCalled(loginUsecase(any));

    // assert
    verify(loginUsecase(any)).called(1);
    verifyNoMoreInteractions(loginUsecase);
  });
  test('should emit [Idle, Error] when usecase returns [Failure]', () async {
    // arrange
    when(loginUsecase(any))
        .thenAnswer((_) async => const Left(ServerFailure(message: 'error')));

    // Assert
    expect(bloc.state, equals(Idle()));

    // act
    bloc.add(const PerformLogin(email: email, password: password));

    // assert
    await expectLater(
      bloc.stream,
      emitsInOrder([Loading(), const Error(message: 'Error')]),
    );
  });
  test('should emit [Idle, Loading, Loaded] when data is gotten successfully',
      () async {
    // arrange
    when(loginUsecase(any)).thenAnswer((_) async => const Right(tLogin));

    // assert
    expect(bloc.state, equals(Idle()));

    // act
    bloc.add(const PerformLogin(email: email, password: password));

    // assert
    await expectLater(
      bloc.stream,
      emitsInOrder([
        Loading(),
        const Loaded(tLogin),
      ]),
    );
  });

  test(
      'should emit [Idle, Loading, Loaded] with proper message for the error when getting data fails',
      () async {
    // arrange
    when(loginUsecase(any)).thenAnswer(
      (_) async => const Left(
        CatchFailure(exception: 'error', stackTrace: StackTrace.empty),
      ),
    );

    // Assert
    expect(bloc.state, equals(Idle()));

    // act
    bloc.add(const PerformLogin(email: email, password: password));

    // assert
    await expectLater(
      bloc.stream,
      emitsInOrder([Loading(), const Error(message: 'catch')]),
    );
  });
}
