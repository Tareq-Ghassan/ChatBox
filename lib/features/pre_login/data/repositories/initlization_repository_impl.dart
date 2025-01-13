import 'package:chat/core/util/network_info.dart';
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

  /// [networkInfo] represent network info
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Initialize>> getIsInitialized() async {
    final isConntected = await networkInfo.isConnected;
    if (isConntected) {
      try {
        final response = await dataSource.getIsInitialized();
        if (response.header?.errorCode == '0') {
          return Right(response);
        }else{
          return Left(ClientFailure());
        }
      } on ServerFailure {
        return Left(ServerFailure());
      } catch (e) {
        return Left(CatchFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
