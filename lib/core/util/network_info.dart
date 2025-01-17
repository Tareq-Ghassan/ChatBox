import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// [NetworkInfo] abstract class to get connectivity status
abstract class NetworkInfo {
  /// [isConnected] holds if phone is connected to network
  Future<bool> get isConnected;
}

/// [NetworkInfoImpl] Aa implementation class for [NetworkInfo]
class NetworkInfoImpl implements NetworkInfo {
  /// [NetworkInfoImpl] constructor
  NetworkInfoImpl(this.internetConnection);

  /// [internetConnection] holds instant of the package
  final InternetConnection internetConnection;

  @override
  Future<bool> get isConnected async => internetConnection.hasInternetAccess;
}
