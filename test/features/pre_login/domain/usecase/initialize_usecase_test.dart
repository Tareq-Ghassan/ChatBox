import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/params/initialize_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<InitializeRepository>()])

// import generated mock classes
import './initialize_usecase_test.mocks.dart';

void main() {
  late InitializeUseCase useCase;
  late MockInitializeRepository mockInitializeRepository;

  setUpAll(() {
    mockInitializeRepository = MockInitializeRepository();
    useCase = InitializeUseCase(repository: mockInitializeRepository);
  });

  const tIsInitialize = true;
  const tInitialize = Initialize(isInitialize: tIsInitialize);
  const tParams = InitializeParams(appKey: '', appSecret: '');

  test('Should get Initialization value form repo', () async {
    // arrange
    when(
      mockInitializeRepository.initialize(
        appKey: tParams.appKey,
        appSecret: tParams.appSecret,
      ),
    ).thenAnswer((_) async => const Right<Failure, Initialize>(tInitialize));

    // act
    final result = await useCase(tParams);

    // assert
    expect(result, const Right<Failure, Initialize>(tInitialize));
    verify(
      mockInitializeRepository.initialize(
        appKey: tParams.appKey,
        appSecret: tParams.appSecret,
      ),
    );
    verifyNoMoreInteractions(mockInitializeRepository);
  });
}
