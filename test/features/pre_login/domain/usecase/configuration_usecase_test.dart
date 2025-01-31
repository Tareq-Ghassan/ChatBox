import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:chat/features/pre_login/domain/repository/configuration_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/configuration_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'configuration_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ConfigurationRepository>()])
void main() {
  late ConfigurationUseCase usecase;
  late MockConfigurationRepository repo;
  const tCountryCode = CountryCode(name: 'name', code: 'code');

  const tConfiguration = Configuration(countryCodes: [tCountryCode]);

  setUp(() {
    repo = MockConfigurationRepository();
    usecase = ConfigurationUseCase(repository: repo);
  });

  test('getConfiguration should return entity', () async {
    // Arrange
    when(
      repo.getConfiguration(),
    ).thenAnswer(
      (_) async => const Right<Failure, Configuration>(tConfiguration),
    );

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, const Right<Failure, Configuration>(tConfiguration));
    verify(
      repo.getConfiguration(),
    );
    verifyNoMoreInteractions(repo);
  });

  test('getConfiguration should return failure when Repo return Failure ',
      () async {
    // Arrange
    when(repo.getConfiguration()).thenAnswer(
      (_) async => const Left<Failure, Configuration>(
        ServerFailure(message: ''),
      ),
    );

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(
      result,
      const Left<Failure, Configuration>(
        ServerFailure(message: ''),
      ),
    );
    verify(
      repo.getConfiguration(),
    );
    verifyNoMoreInteractions(repo);
  });
}
