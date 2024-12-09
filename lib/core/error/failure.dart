import 'package:equatable/equatable.dart';

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
class ServerFailure extends Failure {}

/// [ClientFailure] any Failures form Client
class ClientFailure extends Failure {}

/// [UnauthorizedFailure] any Failures for unathorization
class UnauthorizedFailure extends Failure {}

/// [ErrorFailure] any error Failure that need to be shown on UI
class ErrorFailure extends Failure {}
