import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:dartz/dartz.dart';

/// [SignupRepository] a non implement abstract class
///
/// represent sign up repository
abstract class SignupRepository {
  /// [signup] a signup function
  Future<Either<Failure, Login>> signup({
    required String name,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
