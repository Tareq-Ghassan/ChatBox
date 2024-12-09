import 'package:chat/core/api/network_info.dart';
import 'package:chat/features/pre_login/data/data_source/initlization_data_source.dart';
import 'package:chat/features/pre_login/data/repositories/initlization_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockInitlizationDataSource extends Mock
    implements InitlizationDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  InitlizationRepositoryImpl repository;
  MockInitlizationDataSource mockDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockDataSource = MockInitlizationDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = InitlizationRepositoryImpl(
      dataSource: mockDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

}
