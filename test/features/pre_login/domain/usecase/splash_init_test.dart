import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/get_is_initialized.dart';
import 'package:chat/features/pre_login/domain/usecase/params/get_is_intialized_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<InitializeRepository>()])

// import generated mock classes
import './splash_init_test.mocks.dart';

void main() {
  late GetIsInitialized useCase;
  late MockInitializeRepository mockInitializeRepository;

  setUpAll(() {
    mockInitializeRepository = MockInitializeRepository();
    useCase = GetIsInitialized(repository: mockInitializeRepository);
  });

  const tIsInitialize = true;
  const tInitialize = Initialize(isInitialize: tIsInitialize);
  const tParams = GetIsIntializedParams(appKey: '', appSecret: '');

  test('Should get Initialization value form repo', () async {
    // arrange
    when(
      mockInitializeRepository.getIsInitialized(
        appKey: tParams.appKey,
        appSecret: tParams.appSecret,
      ),
    ).thenAnswer((_) async => const Right<Failure, Initialize>(tInitialize));

    // act
    final result = await useCase(tParams);

    // assert
    expect(result, const Right<Failure, Initialize>(tInitialize));
    verify(
      mockInitializeRepository.getIsInitialized(
        appKey: tParams.appKey,
        appSecret: tParams.appSecret,
      ),
    );
    verifyNoMoreInteractions(mockInitializeRepository);
  });
}
