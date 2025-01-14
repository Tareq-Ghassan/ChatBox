import 'package:chat/core/error/exceptions.dart';
import 'package:chat/core/error/failure.dart';
import 'package:chat/features/pre_login/data/data_source/initialize_data_source.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:dartz/dartz.dart';

/// [InitializeRepositoryImpl] repository implementation
class InitializeRepositoryImpl implements InitializeRepository {
  /// [InitializeRepositoryImpl] constructor
  InitializeRepositoryImpl({
    required this.dataSource,
  });

  /// [dataSource] represent data source
  final InitializeDataSource dataSource;

  @override
  Future<Either<Failure, Initialize>> initialize({
    required String appKey,
    required String appSecret,
  }) async {
    try {
      final response = await dataSource.initialize(
        appKey: appKey,
        appSecret: appSecret,
      );

      return Right(response);
    } on NetworkException catch (_) {
      return Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, error: e.error));
    } on ClientException catch (e) {
      return Left(ClientFailure(message: e.message, error: e.error));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on CatchException catch (e) {
      return Left(
        CatchFailure(exception: e.exception, stackTrace: e.stackTrace),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
