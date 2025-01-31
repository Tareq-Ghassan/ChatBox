import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/signup_repository.dart';
import 'package:chat/features/authentication/domain/usecase/params/signup_params.dart';
import 'package:dartz/dartz.dart';

/// [SignupUsecase] represent sign up use case
class SignupUsecase extends BaseUseCase<Login, SignupParams> {
  /// [SignupUsecase] constructor
  SignupUsecase({required this.repository});

  /// [repository] represent Signup Repository
  final SignupRepository repository;

  @override
  Future<Either<Failure, Login>> call(SignupParams params) async =>
      repository.signup(
        name: params.name,
        countryCode: params.countryCode,
        phoneNumber: params.phoneNumber,
        email: params.email,
        password: params.password,
        confirmPassword: params.confirmPassword,
      );
}
