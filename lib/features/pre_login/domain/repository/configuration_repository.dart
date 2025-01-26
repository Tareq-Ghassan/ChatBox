import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:dartz/dartz.dart';

/// [ConfigurationRepository] non implement class represent
/// configuration repo
abstract class ConfigurationRepository {
  Future<Either<Failure, Configuration>> getConfiguration();
}
