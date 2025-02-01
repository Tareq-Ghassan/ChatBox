part of 'local.dart';

/// [SecurePreferences] an abstraction for local storage operations.
abstract class SecurePreferences {
  ///[SecurePreferences] constructor
  SecurePreferences({required this.securePreferences});

  /// instance of securePreferences package
  final FlutterSecureStorage securePreferences;

  /// Save a boolean value
  Future<void> setBool({required String key, required bool value});

  /// Get a boolean value
  Future<bool?> getBool(String key);

  /// Save a string value
  Future<void> setString({required String key, required String value});

  /// Get a string value
  Future<String?> getString(String key);
}
