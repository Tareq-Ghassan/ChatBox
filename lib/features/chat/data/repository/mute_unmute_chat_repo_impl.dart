import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/data_source/mute_unmute_chat_data_source.dart';
import 'package:chat/features/chat/domain/repository/mute_unmute_chat_repository.dart';
import 'package:dartz/dartz.dart';

/// [MuteUnmuteChatRepositoryImpl] an implementation for 
/// [MuteUnmuteChatRepository]
class MuteUnmuteChatRepositoryImpl implements MuteUnmuteChatRepository {
  /// [MuteUnmuteChatRepositoryImpl] constructor
  MuteUnmuteChatRepositoryImpl({required this.dataSource});

  /// [dataSource] is a [MuteUnmuteChatDataSource]
  final MuteUnmuteChatDataSource dataSource;

  @override
  Future<Either<Failure, String>> muteUnmute({
    required bool isMute,
    required String chatId,
  }) async {
    try {
      await dataSource.muteUnmute(isMute: isMute, chatId: chatId);
      return Right<Failure, String>(chatId);
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
