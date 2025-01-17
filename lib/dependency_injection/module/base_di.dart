part of '../di.dart';

/// [BaseDi]
abstract class BaseDi {
  /// Name of the module (for logging/debugging)
  String get name;

  /// [register] where you register everything
  /// (Bloc, Use Case, Repository, Data source, etc...)
  void register();

  /// [deregister] where you deregister everything
  /// you registered in `register` function
  /// (Bloc, Use Case, Repository, Data source, etc...)
  void deregister();
}
