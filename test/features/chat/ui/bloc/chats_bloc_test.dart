// ignore_for_file: lines_longer_than_80_chars, document_ignores

import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/domain/entity/chats.dart';
import 'package:chat/features/chat/domain/usecase/get_all_chats_usecase.dart';
import 'package:chat/features/chat/domain/usecase/mute_unmute_chat_usecase.dart';
import 'package:chat/features/chat/ui/bloc/chats_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chats_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetAllChatsUseCase>(),
  MockSpec<MuteUnmuteChatUsecase>(),
])
void main() {
  late ChatsBloc bloc;
  late MockGetAllChatsUseCase getAllChatsUseCase;
  late MockMuteUnmuteChatUsecase muteUnmuteChatUsecase;

  const tChats = Chats(
    chats: [],
    currentPage: 1,
    perPage: 12,
    totalChats: 1,
    totalPages: 1,
  );

  setUp(
    () {
      getAllChatsUseCase = MockGetAllChatsUseCase();
      muteUnmuteChatUsecase = MockMuteUnmuteChatUsecase();
      bloc = ChatsBloc(
        getAllChatsUseCase: getAllChatsUseCase,
        muteUnmuteChatUsecase: muteUnmuteChatUsecase,
      );
    },
  );

  test('InitialState should be Idle first', () async {
    // assert
    expect(bloc.state, isA<ChatsState>());
    expect(bloc.state, equals(Idle()));
  });

  group(
    'Get All Chats',
    () {
      test('Should call GetAllChatsUseCase', () async {
        // arrange
        when(getAllChatsUseCase(any))
            .thenAnswer((_) async => const Right(tChats));
        // act
        bloc.add(const GetAllChats(index: 1, perPage: 10));
        await untilCalled(getAllChatsUseCase(any));

        // assert
        verify(getAllChatsUseCase(any)).called(1);
        verifyNoMoreInteractions(getAllChatsUseCase);
      });
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(getAllChatsUseCase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetAllChats(index: 1, perPage: 10));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
      test(
          'should emit [Idle, Loading, Loaded] when data is gotten successfully',
          () async {
        // arrange
        when(getAllChatsUseCase(any))
            .thenAnswer((_) async => const Right(tChats));

        // assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetAllChats(index: 1, perPage: 10));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            Loading(),
            const ChatsLoaded(chats: tChats),
          ]),
        );
      });

      test(
          'should emit [Idle, Loading, Loaded] with proper message for the error when getting data fails',
          () async {
        // arrange
        when(getAllChatsUseCase(any)).thenAnswer(
          (_) async => const Left(
            CatchFailure(exception: 'error', stackTrace: StackTrace.empty),
          ),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const GetAllChats(index: 1, perPage: 10));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
    },
  );

  group(
    'Mute And Unmute Chats',
    () {
      test('Should call GetAllChatsUseCase', () async {
        // arrange
        when(muteUnmuteChatUsecase(any))
            .thenAnswer((_) async => const Right('1'));
        // act
        bloc.add(const MuteUnmute(chatId: '1', isMute: true));
        await untilCalled(muteUnmuteChatUsecase(any));

        // assert
        verify(muteUnmuteChatUsecase(any)).called(1);
        verifyNoMoreInteractions(muteUnmuteChatUsecase);
      });
      test('should emit [Idle, Error] when usecase returns [Failure]',
          () async {
        // arrange
        when(muteUnmuteChatUsecase(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'error')),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const MuteUnmute(chatId: '1', isMute: true));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
      test(
          'should emit [Idle, Loading, Loaded] when data is gotten successfully',
          () async {
        // arrange
        when(muteUnmuteChatUsecase(any))
            .thenAnswer((_) async => const Right('1'));

        // assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const MuteUnmute(chatId: '1', isMute: true));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder([
            Loading(),
             MuteUnmuteDone(),
          ]),
        );
      });

      test(
          'should emit [Idle, Loading, Loaded] with proper message for the error when getting data fails',
          () async {
        // arrange
        when(muteUnmuteChatUsecase(any)).thenAnswer(
          (_) async => const Left(
            CatchFailure(exception: 'error', stackTrace: StackTrace.empty),
          ),
        );

        // Assert
        expect(bloc.state, equals(Idle()));

        // act
        bloc.add(const MuteUnmute(chatId: '1', isMute: true));

        // assert
        await expectLater(
          bloc.stream,
          emitsInOrder(
            [Loading(), const Error(message: 'error', header: 'Error')],
          ),
        );
      });
    },
  );
}
