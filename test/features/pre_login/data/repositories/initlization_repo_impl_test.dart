import 'package:chat/core/util/network_info.dart';
import 'package:chat/features/pre_login/data/data_source/initlization_data_source.dart';
import 'package:chat/features/pre_login/data/repositories/initlization_repository_impl.dart';
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
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // act
      await repository.getIsInitialized();

      // assert
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });
  });
}
