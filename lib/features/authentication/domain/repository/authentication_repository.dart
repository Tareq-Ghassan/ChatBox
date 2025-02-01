import 'package:chat/core/error/error.dart';
import 'package:dartz/dartz.dart';

/// [AuthenticationRepository] a repo to store and get JWT 
abstract class AuthenticationRepository {
  /// [storeJWT]
  Future<Either<Failure, void>> storeJWT(String jwt);

  ///[getJWT]
  Future<Either<Failure, String>> getJWT();
}
