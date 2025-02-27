import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:chat/features/authentication/data/data_source/login_data_source.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/login_repo.dart';
import 'package:dartz/dartz.dart';

/// [LoginRepositoryImpl] represent an implement class for `LoginRepository`
class LoginRepositoryImpl implements LoginRepository {
  /// [LoginRepositoryImpl] constructor
  LoginRepositoryImpl({
    required this.dataSource,
    required this.localDataSource,
  });

  /// [dataSource]
  final LoginDataSource dataSource;

  /// [localDataSource] handles local storage
  final AuthenticationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.login(email: email, password: password);
      await localDataSource.cacheJWT(jwt: result.header.jwt);
      return Right(result);
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
    } on CacheException catch (e) {
      return Left(
        CacheFailure(exception: e.exception, stackTrace: e.stackTrace),
      );
    } catch (e, stackTrace) {
      return Left(
        CatchFailure(exception: e.toString(), stackTrace: stackTrace),
      );
    }
  }
}
