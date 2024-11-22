import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// [SecurePreferences] singleton
class SecurePreferences {
  /// [SecurePreferences] constructor
  factory SecurePreferences() {
    return _singleton;
  }

  SecurePreferences._internal() : _instance = const FlutterSecureStorage();
  static final SecurePreferences _singleton = SecurePreferences._internal();
  late final FlutterSecureStorage _instance;

  /// [setBool] set value of type [bool]
  Future<void> setBool({required String key, required bool value}) async {
    await _instance.write(key: key, value: value.toString());
  }

  /// [getBool] get value of type [bool]
  Future<bool?> getBool(String key) async {
    final value = await _instance.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  /// [setString] set value of type [String]
  Future<void> setString(String key, String value) async {
    await _instance.write(key: key, value: value);
  }

  /// [getString] get value of type [String]
  Future<String?> getString(String key) async {
    return _instance.read(key: key);
  }
}
