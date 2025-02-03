import 'package:chat/core/error/error.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/repository/get_all_chats_repository.dart';
import 'package:dartz/dartz.dart';

/// [GetAllChatsUseCase] get all chats use case
class GetAllChatsUseCase extends BaseUseCase<Chats, NoParams> {
  /// [GetAllChatsUseCase] constructor
  GetAllChatsUseCase({required this.repo});

  /// a [GetAllChatsRepository]
  final GetAllChatsRepository repo;
  @override
  Future<Either<Failure, Chats>> call(NoParams params) async =>
      repo.getAllChats();
}
