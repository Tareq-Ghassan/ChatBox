/// [NetworkInfo] abstract class to get connectivity status
abstract class NetworkInfo {
  /// [isConnected] holds if phone is connected to network
  Future<bool> get isConnected;
}
