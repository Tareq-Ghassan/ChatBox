import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:dartz/dartz.dart';

/// [LoginRepository] represent login usecase repo
abstract class LoginRepository {
  /// [login] 
  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
  });
}
