import 'package:chat/core/error/failure.dart';
import 'package:chat/core/usecase/usecase.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/get_is_initialized.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockInitializeRepository extends Mock implements InitializeRepository {}

void main() {
  late GetIsInitialized useCase;
  late MockInitializeRepository mockInitializeRepository;

  setUpAll(() {
    mockInitializeRepository = MockInitializeRepository();
    useCase = GetIsInitialized(repository: mockInitializeRepository);
  });

  const tIsInitialize = true;
  const tInitialize = Initialize(isInitialize: tIsInitialize);

  test('Should get Initialization value form repo', () async {
    // arrange
    when(mockInitializeRepository.getIsInitialized())
        .thenAnswer((_) async => const Right(tInitialize));

    // act
    final result = await useCase(NoParams());

    // assert
    expect(result, const Right<Failure, Initialize>(tInitialize));
    verify(mockInitializeRepository.getIsInitialized());
    verifyNoMoreInteractions(mockInitializeRepository);
  });
}
