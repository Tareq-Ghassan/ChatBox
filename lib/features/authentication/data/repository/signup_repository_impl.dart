import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:chat/features/authentication/data/data_source/signup_data_source.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/repository/signup_repository.dart';
import 'package:dartz/dartz.dart';

/// [SignupRepositoryImpl] represent signup repository implementation
class SignupRepositoryImpl implements SignupRepository {
  /// [SignupRepositoryImpl] constructor
  SignupRepositoryImpl({
    required this.dataSource,
    required this.localDataSource,
  });

  /// [dataSource] represent signup data source
  final SignupDataSource dataSource;

  /// [localDataSource] handles local storage
  final AuthenticationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Login>> signup({
    required String name,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final result = await dataSource.signup(
        name: name,
        countryCode: countryCode,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
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
