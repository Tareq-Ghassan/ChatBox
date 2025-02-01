// ignore_for_file: public_member_api_docs, document_ignores

part of 'error.dart';

/// [Failure] an abstract class holds error object
abstract class Failure extends Equatable {
  /// Constructor for [Failure].
  /// Passes properties to [Equatable]'s props.
  const Failure([this.properties = const <dynamic>[]]);

  /// [properties] list of errors
  final List<dynamic> properties;

  @override
  List<Object?> get props => properties;
}

/// [ServerFailure] any Failures form Server
class ServerFailure extends Failure {
  /// [ServerFailure] constructor
  const ServerFailure({required this.message, this.error = ''});
  final String message;
  final String error;
}

/// [CatchFailure] any Format failure
class CatchFailure extends Failure {
  /// [CatchFailure] constructor
  const CatchFailure({required this.exception, required this.stackTrace});
  final String exception;
  final StackTrace stackTrace;
}

/// [CacheFailure] any Format failure
class CacheFailure extends Failure {
  /// [CacheFailure] constructor
  const CacheFailure({required this.exception, required this.stackTrace});
  final String exception;
  final StackTrace stackTrace;
}

/// [ClientFailure] any Failures form Client
class ClientFailure extends Failure {
  /// [ClientFailure] constructor
  const ClientFailure({required this.message, required this.error});
  final String message;
  final String error;
}

/// [UnauthorizedFailure] any Failures for unauthorized
class UnauthorizedFailure extends Failure {
  /// [UnauthorizedFailure] constructor
  const UnauthorizedFailure({required this.message});
  final String message;
}

/// [NetworkFailure] no internet connection Failures
class NetworkFailure extends Failure {}

/// [InvalidInputFailure] no internet connection Failures
class InvalidInputFailure extends Failure {}
