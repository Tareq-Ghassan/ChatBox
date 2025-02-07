import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/data_source/get_all_chats_data_source.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/repository/get_all_chats_repository.dart';
import 'package:dartz/dartz.dart';

/// [GetAllChatsRepositoryImpl] an implementation class for get all chats repo
class GetAllChatsRepositoryImpl implements GetAllChatsRepository {
  /// [GetAllChatsRepositoryImpl] constructor
  GetAllChatsRepositoryImpl({required this.datasource});

  /// [datasource] is a [GetAllChatsDataSource]
  final GetAllChatsDataSource datasource;

  @override
  Future<Either<Failure, Chats>> getAllChats({
    required int index,
    required int perPage,
  }) async {
    try {
      final result =
          await datasource.getAllChats(index: index, perPage: perPage);
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
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
