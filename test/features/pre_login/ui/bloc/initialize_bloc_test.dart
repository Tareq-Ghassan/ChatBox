// ignore_for_file: lines_longer_than_80_chars

import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/usecase/configuration_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/ui/bloc/initialize_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<InitializeUseCase>(),
  MockSpec<ConfigurationUseCase>(),
])
import 'initialize_bloc_test.mocks.dart';

void main() {
  late MockInitializeUseCase mockInitializeUseCase;
  late MockConfigurationUseCase mockConfigurationUsecase;

  late InitializeBloc bloc;
  const tAppKey = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx';
  const tAppSecret = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx';
  const tInitialize = Initialize(isInitialize: true);

  const tCountryCode = CountryCode(name: 'name', code: 'code');

  const tConfiguration = Configuration(countryCodes: [tCountryCode]);

  setUp(() {
    mockInitializeUseCase = MockInitializeUseCase();
    mockConfigurationUsecase = MockConfigurationUseCase();
    bloc = InitializeBloc(
      initializeUseCase: mockInitializeUseCase,
      configurationUsecase: mockConfigurationUsecase,
    );
  });

  test('InitialState should be Idle first', () async {
    // assert
    expect(bloc.state, isA<InitializeState>());
    expect(bloc.state, equals(Idle()));
  });

  group(
    'Initialize App',
    () {
      test('Should call InitializeUseCase', () async {
        // arrange
        when(mockInitializeUseCase(any))
            .thenAnswer((_) async => const Right(tInitialize));
        // act
        bloc.add(const InitializeApp(appKey: tAppKey, appSecret: tAppSecret));
        await untilCalled(mockInitializeUseCase(any));

        // assert
        verify(mockInitializeUseCase(any)).called(1);
        verifyNoMoreInteractions(mockInitializeUseCase);
      });
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(mockInitializeUseCase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const InitializeApp(appKey: tAppKey, appSecret: tAppSecret));

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
        when(mockInitializeUseCase(any))
            .thenAnswer((_) async => const Right(tInitialize));

        // assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const InitializeApp(appKey: tAppKey, appSecret: tAppSecret));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            Loading(),
            const InitializeLoaded(initialize: tInitialize),
          ]),
        );
      });

      test(
          'should emit [Idle, Loading, Loaded] with proper message for the error when getting data fails',
          () async {
        // arrange
        when(mockInitializeUseCase(any)).thenAnswer(
          (_) async => const Left(
            CatchFailure(exception: 'error', stackTrace: StackTrace.empty),
          ),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const InitializeApp(appKey: tAppKey, appSecret: tAppSecret));

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
    'Get Configuration',
    () {
      test('Should call ConfigurationUseCase', () async {
        // arrange
        when(mockConfigurationUsecase(any))
            .thenAnswer((_) async => const Right(tConfiguration));
        // act
        bloc.add(const GetConfiguration());
        await untilCalled(mockConfigurationUsecase(any));

        // assert
        verify(mockConfigurationUsecase(any)).called(1);
        verifyNoMoreInteractions(mockConfigurationUsecase);
      });
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(mockConfigurationUsecase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetConfiguration());

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
        when(mockConfigurationUsecase(any))
            .thenAnswer((_) async => const Right(tConfiguration));

        // assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetConfiguration());

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            Loading(),
            const ConfigurationLoaded(configuration: tConfiguration),
          ]),
        );
      });

      test(
          'should emit [Idle, Loading, Loaded] with proper message for the error when getting data fails',
          () async {
        // arrange
        when(mockConfigurationUsecase(any)).thenAnswer(
          (_) async => const Left(
            CatchFailure(exception: 'error', stackTrace: StackTrace.empty),
          ),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetConfiguration());

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
