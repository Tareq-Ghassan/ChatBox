// ignore_for_file: lines_longer_than_80_chars, document_ignores

import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/user/domain/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginUsecase>(),
  MockSpec<SignupUsecase>(),
])
void main() {
  late AuthenticationBloc bloc;
  late MockLoginUsecase loginUsecase;
  late MockSignupUsecase signupUsecase;

  const tPhoneNumber = PhoneNumber(number: 'Afghanistan', code: '+93');
  const tHeader = Header(jwt: 'xxxx');
  const tUserData = User(
    id: '',
    name: 'Tareq',
    email: 't@t.t',
    phoneNumber: tPhoneNumber,
    profileImage: '',
  );
  const tLogin = Login(header: tHeader, userData: tUserData);
  const email = '';
  const password = '';

  setUp(() {
    loginUsecase = MockLoginUsecase();
    signupUsecase = MockSignupUsecase();
    bloc = AuthenticationBloc(
      loginUsecase: loginUsecase,
      signupUsecase: signupUsecase,
    );
  });
  test('AuthenticationState should be Idle first', () async {
    // assert
    expect(bloc.state, isA<AuthenticationState>());
    expect(bloc.state, equals(Idle()));
  });

  group(
    'Login use case',
    () {
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
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(loginUsecase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        //! Assert
        expect(bloc.state, equals(Idle()));

        //# Act
        bloc.add(const PerformLogin(email: email, password: password));

        //! Assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            Loading(),
            const Error(
              message:
                  'An error occurred while sending the data. Please try again. If this issue keeps happening, contact our customer center',
              header: 'Unable to process the request',
            ),
          ]),
        );
      });
      test(
          'should emit [Idle, Loading, Loaded] when data is gotten successfully',
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
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
    },
  );

  group(
    'Sing up use case',
    () {
      test('Should call SignupUsecase', () async {
        // arrange
        when(signupUsecase(any)).thenAnswer((_) async => const Right(tLogin));
        // act
        bloc.add(const PerformLogin(email: email, password: password));
        await untilCalled(loginUsecase(any));

        // assert
        verify(loginUsecase(any)).called(1);
        verifyNoMoreInteractions(loginUsecase);
      });
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(loginUsecase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const PerformLogin(email: email, password: password));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
      test(
          'should emit [Idle, Loading, Loaded] when data is gotten successfully',
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
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
    },
  );
}
