import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';

/// [CheckLoginStatusUseCase] to check if user logged in already or not
class CheckLoginStatusUseCase extends BaseUseCase<String, NoParams> {
  /// [CheckLoginStatusUseCase] constructor
  CheckLoginStatusUseCase({required this.repository});

  /// [repository] represent repo
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      repository.getJWT();
}
