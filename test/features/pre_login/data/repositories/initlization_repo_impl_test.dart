// ignore_for_file: lines_longer_than_80_chars

import 'package:chat/core/error/failure.dart';
import 'package:chat/core/util/network_info.dart';
import 'package:chat/features/pre_login/data/data_source/initlization_data_source.dart';
import 'package:chat/features/pre_login/data/model/initlization_model.dart';
import 'package:chat/features/pre_login/data/repositories/initlization_repository_impl.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<InitlizationDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'initlization_repo_impl_test.mocks.dart';

void main() {
  late InitlizationRepositoryImpl repository;
  late MockInitlizationDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockDataSource = MockInitlizationDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = InitlizationRepositoryImpl(
      dataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getIsInitialized', () {
    const tIsInitialize = true;
    const tInitializeModel = InitlizationModel(isInitialize: tIsInitialize);
    const Initialize tInitialize = tInitializeModel;
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      await repository.getIsInitialized();

      // assert
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });
    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'Should return remote data when the call to remote data source is successful',
          () async {
        // Arrange
        when(mockDataSource.getIsInitialized())
            .thenAnswer((_) async => tInitializeModel);

        // Act
        final result = await repository.getIsInitialized();

        // Assert
        expect(
          result,
          equals(const Right<Failure, Initialize>(tInitialize)),
        );
      });
    });
    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}
