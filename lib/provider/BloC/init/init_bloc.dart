import 'package:chat/data/repository/init_repo.dart';
import 'package:chat/provider/BloC/init/init_event.dart';
import 'package:chat/provider/BloC/init/init_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[InitBloc] Init BloC
class InitBloc extends Bloc<InitEvent, InitState> {
  ///[InitBloc] constructor
  InitBloc(this.initRepository)
      : super(InitIsNotSearched()) {
    on<FetchInit>((event, emit) async {
      emit(InitIsLoading());
      try {
        final config = await initRepository.init();
        if (config != null) {
          debugPrint('FetchInit event success:');
          emit(InitIsLoaded(config));
        } else {
          debugPrint('FetchInit event: config is null');
          emit(InitFailure());
        }
      } catch (error) {
        debugPrint('FetchInit event: catch ');
        emit(InitCatch());
        debugPrint(error.toString());
      }
    });
  }

  ///[initRepository] holds the repo
  final InitRepository initRepository;
}