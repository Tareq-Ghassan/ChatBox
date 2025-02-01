import 'package:chat/core/data/data_source/local/local.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/core/util/util.dart';

/// [AuthenticationLocalDataSource] handles storing and retrieving JWT
abstract class AuthenticationLocalDataSource {
  /// Stores JWT in secure storage
  Future<void> cacheJWT({required String jwt});

  /// Retrieves JWT from secure storage
  Future<String> getJWT();
}

/// [AuthenticationLocalDataSourceImpl] concrete implementation of
/// [AuthenticationLocalDataSource]
class AuthenticationLocalDataSourceImpl extends BaseLocalDataSource
    implements AuthenticationLocalDataSource {
  /// [AuthenticationLocalDataSourceImpl] constructor
  AuthenticationLocalDataSourceImpl({required super.securePreferences});

  @override
  Future<void> cacheJWT({required String jwt}) async {
    try {
      await securePreferences.setString(
        key: SecurePreferencesKeys.jwt,
        value: jwt,
      );
    } catch (e, stackTrace) {
      throw CacheException(exception: e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String> getJWT() async {
    try {
      final token =
          await securePreferences.getString(SecurePreferencesKeys.jwt);
      if (token != null && JWTUtil.validateJWT(token: token)) {
        return token;
      } else {
        throw const UnauthorizedException(message: 'Invalid Token');
      }
    }catch (e, stackTrace) {
      throw CacheException(exception: e.toString(), stackTrace: stackTrace);
    }
  }
}
