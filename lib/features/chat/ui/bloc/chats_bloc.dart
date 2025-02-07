import 'package:bloc/bloc.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/usecase/get_all_chats_usecase.dart';
import 'package:chat/features/chat/domain/usecase/mute_unmute_chat_usecase.dart';
import 'package:chat/features/chat/domain/usecase/params/get_all_chats_params.dart';
import 'package:chat/features/chat/domain/usecase/params/mute_unmute_params.dart';
import 'package:equatable/equatable.dart';

part 'chats_event.dart';
part 'chats_state.dart';

/// [ChatsBloc] class
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  /// [ChatsBloc] constructor
  ChatsBloc({
    required this.getAllChatsUseCase,
    required this.muteUnmuteChatUsecase,
  }) : super(Idle()) {
    on<GetAllChats>((event, emit) async {
      emit(Loading());
      final result = await getAllChatsUseCase(
        GetAllChatsParams(
          index: event.index,
          perPage: event.perPage,
        ),
      );
      result.fold((l) {
        emit(
          Error(
            message: MappersUtil.mapFailureToMessage(l),
            header: MappersUtil.mapFailureToHeader(l),
          ),
        );
      }, (r) {
        emit(
          ChatsLoaded(chats: r),
        );
      });
    });
    on<MuteUnmute>((event, emit) async {
      emit(Loading());
      final result = await muteUnmuteChatUsecase(
        MuteUnmuteParams(
          isMute: event.isMute,
          chatId: event.chatId,
        ),
      );
      result.fold((l) {
        emit(
          Error(
            message: MappersUtil.mapFailureToMessage(l),
            header: MappersUtil.mapFailureToHeader(l),
          ),
        );
      }, (r) {
        emit(
          MuteUnmuteDone(),
        );
      });
    });
  }

  /// [getAllChatsUseCase] is to get chats from remote
  final GetAllChatsUseCase getAllChatsUseCase;

  /// [muteUnmuteChatUsecase] is to either mute or unmute chat
  final MuteUnmuteChatUsecase muteUnmuteChatUsecase;
}
