import 'package:chat/features/pre_login/data/model/initialize_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///[InitState] `immutable` class created to hold state
@immutable
abstract class InitState extends Equatable {
  /// [InitState] constructor
  const InitState();
  @override
  List<InitlizationModel> get props => [];
}

/// [InitIsNotSearched] state
class InitIsNotSearched extends InitState {}

/// [InitIsLoading] state
class InitIsLoading extends InitState {}

/// [InitIsLoaded] state
class InitIsLoaded extends InitState {
  /// [InitIsLoaded] constructor
  const InitIsLoaded(
    this._appConfig,
  );
  final InitlizationModel _appConfig;

  /// [getConfig] getter
  InitlizationModel get getConfig => _appConfig;
  @override
  List<InitlizationModel> get props => [_appConfig];
}

/// [InitFailure] state
class InitFailure extends InitState {}

/// [InitCatch] state
class InitCatch extends InitState {}
