// ignore_for_file: public_member_api_docs

/// [ServerException] represent any server exception could happen
class ServerException implements Exception {
  /// [ServerException] constructor
  const ServerException({required this.message, this.error = ''});
  final String message;
  final String error;
}

/// [CacheException] represent any cache exception could happen
class CacheException implements Exception {
  /// [CacheException] constructor
  const CacheException({required this.message});
  final String message;
}

/// [CatchException] represent any catch exception could happen
class CatchException implements Exception {
  /// [CatchException] constructor
  const CatchException({required this.exception, required this.stackTrace});
  final String exception;
  final StackTrace stackTrace;
}

/// [ClientException] any exception form Client
class ClientException implements Exception {
  /// [ClientException] constructor
  const ClientException({required this.message, required this.error});
  final String message;
  final String error;
}

/// [UnauthorizedException] any exception for unathorization
class UnauthorizedException implements Exception {
  /// [UnauthorizedException] constructor
  const UnauthorizedException({required this.message});
  final String message;
}

/// [ErrorException] any exception that need to be shown on UI
class ErrorException implements Exception {
  /// [ErrorException] constructor
  const ErrorException({required this.message});
  final String message;
}

/// [NetworkException] no internet connnection Exception
class NetworkException implements Exception {}
