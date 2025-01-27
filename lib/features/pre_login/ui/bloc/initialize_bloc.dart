// ignore: depend_on_referenced_packages
// ignore_for_file: document_ignores

import 'package:bloc/bloc.dart';
import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:chat/features/pre_login/domain/usecase/configuration_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/params/initialize_params.dart';
import 'package:equatable/equatable.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

/// [InitializeBloc] class
class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  /// [InitializeBloc] constructor
  InitializeBloc({
    required this.initializeUseCase,
    required this.configurationUsecase,
  }) : super(Idle()) {
    on<InitializeApp>((event, emit) async {
      emit(Loading());
      final result = await initializeUseCase(
        InitializeParams(appKey: event.appKey, appSecret: event.appSecret),
      );
      result.fold((l) {
        emit(
          Error(
            message: FailureMapper.mapFailureToMessage(l),
            header: FailureMapper.mapFailureToHeader(l),
          ),
        );
      }, (ifRight) {
        emit(
          InitializeLoaded(initialize: ifRight),
        );
      });
    });
    on<GetConfiguration>((event, emit) async {
      emit(Loading());
      final result = await configurationUsecase(NoParams());
      result.fold((l) {
        emit(
          Error(
            message: FailureMapper.mapFailureToMessage(l),
            header: FailureMapper.mapFailureToHeader(l),
          ),
        );
      }, (r) {
        emit(
          ConfigurationLoaded(configuration: r),
        );
      });
    });
  }

  /// is a[InitializeUseCase]
  final InitializeUseCase initializeUseCase;

  /// is a[ConfigurationUseCase]
  final ConfigurationUseCase configurationUsecase;
}
