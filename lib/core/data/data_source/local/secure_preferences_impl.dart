part of 'local.dart';

/// [SecurePreferencesImpl] a secure storage implementation of
/// [SecurePreferences]
class SecurePreferencesImpl extends SecurePreferences {
  /// [SecurePreferencesImpl] constructor
  SecurePreferencesImpl({required super.securePreferences});

  /// [setBool] set value of type [bool]
  @override
  Future<void> setBool({required String key, required bool value}) async {
    await securePreferences.write(key: key, value: value.toString());
  }

  /// [getBool] get value of type [bool]
  @override
  Future<bool?> getBool(String key) async {
    final value = await securePreferences.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  /// [setString] set value of type [String]
  @override
  Future<void> setString({required String key, required String value}) async {
    await securePreferences.write(key: key, value: value);
  }

  /// [getString] get value of type [String]
  @override
  Future<String?> getString(String key) async {
    return securePreferences.read(key: key);
  }
}
