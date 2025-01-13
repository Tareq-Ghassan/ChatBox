
import 'package:chat/features/pre_login/domain/usecase/get_is_initialized.dart';
import 'package:chat/features/pre_login/ui/bloc/init_event.dart';
import 'package:chat/features/pre_login/ui/bloc/init_state.dart';
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
        final config = await initRepository();
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
  final GetIsInitialized initRepository;
}
