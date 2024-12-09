import 'package:chat/core/api/network_info.dart';
import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/data/data_source/initlization_data_source.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:dartz/dartz.dart';

/// [InitlizationRepositoryImpl] repository implementation
class InitlizationRepositoryImpl implements InitializeRepository {

/// [InitlizationRepositoryImpl] constructor
  InitlizationRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });
  /// [dataSource] represent data source
  final InitlizationDataSource dataSource;
  /// [dataSource] represent network info
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Initialize>> getIsInitialized() {
    // TODO: implement getIsInitialized
    throw UnimplementedError();
  }
}
