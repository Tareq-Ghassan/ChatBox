import 'package:chat/core/error/failure.dart';
import 'package:chat/core/usecase/usecase.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:dartz/dartz.dart';

/// [GetIsInitialized] represent get is init use case
class GetIsInitialized implements UseCase<Initialize, NoParams> {
  /// [GetIsInitialized] constructor
  GetIsInitialized({required this.repository});

  /// [repository] holds [InitializeRepository] class
  final InitializeRepository repository;

  // /// [call] exe function
  @override
  Future<Either<Failure, Initialize>> call(NoParams params) async =>
      repository.getIsInitialized();
}
