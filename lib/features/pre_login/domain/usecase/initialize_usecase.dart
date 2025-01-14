import 'package:chat/core/error/failure.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/params/initialize_params.dart';
import 'package:dartz/dartz.dart';

/// [InitializeUseCase] represent get is init use case
class InitializeUseCase implements BaseUseCase<Initialize, InitializeParams> {
  /// [InitializeUseCase] constructor
  InitializeUseCase({required this.repository});

  /// [repository] holds [InitializeRepository] class
  final InitializeRepository repository;

  // /// [call] exe function
  @override
  Future<Either<Failure, Initialize>> call(
    InitializeParams initializeParams,
  ) async =>
      repository.initialize(
        appKey: initializeParams.appKey,
        appSecret: initializeParams.appSecret,
      );
}
