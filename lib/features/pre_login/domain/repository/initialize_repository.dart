import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:dartz/dartz.dart';

/// [InitializeRepository] repos
abstract class InitializeRepository {
  /// [initialize] return if app is initialized
  Future<Either<Failure, Initialize>> initialize({
    required String appKey,
    required String appSecret,
  });
}
