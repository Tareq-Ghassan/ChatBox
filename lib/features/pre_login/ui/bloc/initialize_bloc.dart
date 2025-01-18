// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/params/initialize_params.dart';
import 'package:equatable/equatable.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

/// [InitializeBloc] class
class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  /// [InitializeBloc] constructor
  InitializeBloc({required this.usecase}) : super(Idle()) {
    on<InitializeEvent>((event, emit) async {
      if (event is InitializeApp) {
        emit(Loading());
        final result = await usecase(
          InitializeParams(appKey: event.appKey, appSecret: event.appSecret),
        );
        result.fold((ifLeft) {
          emit(Error(message: ifLeft is CatchFailure ? 'catch' : 'Error'));
        }, (ifRight) {
          emit(
            Loaded(initialize: ifRight),
          );
        });
      }
    });
  }

  /// is a[InitializeUseCase]
  final InitializeUseCase usecase;
}
