import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/core/util/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
MockSpec<NetworkInfo>(),
MockSpec<MiddlewareApi>(),
])
import 'base_data_source_test.mocks.dart';

class TestDataSource extends BaseRemoteDataSource {
TestDataSource({required super.networkInfo, required super.api});

Future<String> fetchData() async {
  return executeApiCall<String>(
    apiCall: () async => {'data': 'Success'},
    fromJson: (json) => json['data'] as String,
  );
}
}

void main() {
late MockNetworkInfo mockNetworkInfo;
late MockMiddlewareApi mockApi;

late TestDataSource dataSource;
setUp(() {
  mockNetworkInfo = MockNetworkInfo();
  mockApi = MockMiddlewareApi();
  dataSource = TestDataSource(networkInfo: mockNetworkInfo, api: mockApi);
});
group('NetworkInfo check', () {
  test('Should throw NetworkException when offline', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

    // Act & Assert
    expect(
      () async => dataSource.fetchData(),
      throwsA(isA<NetworkException>()),
    );
    verify(mockNetworkInfo.isConnected).called(1);
  });

  test('Should call API when online', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    // Act
    final result = await dataSource.fetchData();

    // Assert
    expect(result, 'Success');
    verify(mockNetworkInfo.isConnected)
        .called(1); // Ensure network check was performed
  });
});
}
