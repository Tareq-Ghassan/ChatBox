import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:chat/features/authentication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';

/// [AuthenticationRepositoryImpl] an implementation repo
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  /// [AuthenticationRepositoryImpl] constructor
  const AuthenticationRepositoryImpl({
    required this.localDataSource,
  });

  /// [localDataSource] dependency
  final AuthenticationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> storeJWT(String jwt) async {
    try {
      await localDataSource.cacheJWT(jwt: jwt);
      return const Right<Failure, void>(null);
    } catch (e, stackTrace) {
      return Left<Failure, void>(
        CacheFailure(exception: e.toString(), stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Either<Failure, String>> getJWT() async {
    try {
      return Right(await localDataSource.getJWT());
    } on UnauthorizedException catch (e) {
      return Left<Failure, String>(UnauthorizedFailure(message: e.message));
    } catch (e, stackTrace) {
      return Left<Failure, String>(
        CacheFailure(exception: e.toString(), stackTrace: stackTrace),
      );
    }
  }
}
