import 'package:bloc/bloc.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:equatable/equatable.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

/// [InitializeBloc] class
class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  InitializeBloc() : super(InitializeInitial()) {
    on<InitializeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
