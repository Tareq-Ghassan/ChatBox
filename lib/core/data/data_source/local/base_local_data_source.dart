part of 'local.dart';

/// [BaseLocalDataSource] a base class for storing
/// and retrieving data from cache
abstract class BaseLocalDataSource {
  /// [BaseLocalDataSource] constructor
  BaseLocalDataSource({
    required this.securePreferences,
  });

  /// [securePreferences] hold a singleton of [SecurePreferences]
  final SecurePreferences securePreferences;
}
