import 'package:chat/core/util/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_utils_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnection mockInternetConnection;

  setUpAll(() {
    mockInternetConnection = MockInternetConnection();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnection);
  });

  group('isConnected', () {
    test('should check if the device is online', () async {
      
      // arrange
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) async => true);
      // act
      final result = await networkInfoImpl.isConnected;

      // assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, true);
      verifyNoMoreInteractions(mockInternetConnection);
    });
  });
}
