part of 'di.dart';

/// [BaseDi]
abstract class BaseDi {
  /// Name of the module (for logging/debugging)
  Modules get moduleName;

  /// [inject] where you register everything
  /// (Bloc, Use Case, Repository, Data source, etc...)
  void inject();

  /// [deregister] where you deregister everything
  /// you registered in `inject` function
  /// (Bloc, Use Case, Repository, Data source, etc...)
  void deregister();
}
