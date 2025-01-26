import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:chat/features/pre_login/domain/repository/configuration_repository.dart';
import 'package:dartz/dartz.dart';

/// [ConfigurationUseCase] represent get configuration use case
class ConfigurationUseCase extends BaseUseCase<Configuration, NoParams> {
  /// [ConfigurationUseCase] constructor
  ConfigurationUseCase({required this.repository});

  /// [repository] represent configuration repo
  final ConfigurationRepository repository;
  @override
  Future<Either<Failure, Configuration>> call(NoParams params) async =>
      repository.getConfiguration();
}
