import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/data/data_source/configuration_data_source.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:chat/features/pre_login/domain/repository/configuration_repository.dart';
import 'package:dartz/dartz.dart';

/// [ConfigurationRepositoryImpl] represent implementation class for repository
class ConfigurationRepositoryImpl implements ConfigurationRepository {
  /// [ConfigurationRepositoryImpl] constructor
  ConfigurationRepositoryImpl({required this.dataSource});

  /// [dataSource] represent configuration data source
  final ConfigurationDataSource dataSource;

  @override
  Future<Either<Failure, Configuration>> getConfiguration() async {
    try {
      final result = await dataSource.getConfiguration();

      return Right(result.body!);
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
