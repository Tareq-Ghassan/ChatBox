import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/login_repo.dart';
import 'package:chat/features/authentication/domain/usecase/params/login_params.dart';
import 'package:dartz/dartz.dart';

///[LoginUsecase] login usecase
class LoginUsecase extends BaseUseCase<Login, LoginParams> {
  ///[LoginUsecase]constructor
  LoginUsecase({
    required this.repository,
  });

  /// [repository] represent Login Repository
  final LoginRepository repository;

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async =>
      repository.login(email: params.email, password: params.password);
}
