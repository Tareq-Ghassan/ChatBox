import 'package:chat/core/data/data_source/remote/base_remote_data_source.dart';
import 'package:chat/core/error/exceptions.dart';
import 'package:chat/core/util/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
import 'base_data_source_test.mocks.dart';

class TestDataSource extends BaseRemoteDataSource {
  TestDataSource({required super.networkInfo});

  Future<String> fetchData() async {
    return executeApiCall<String>(
      apiCall: () async => {'data': 'Success'},
      fromJson: (json) => json['data'] as String,
    );
  }
}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late TestDataSource dataSource;
  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    dataSource = TestDataSource(networkInfo: mockNetworkInfo);
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
