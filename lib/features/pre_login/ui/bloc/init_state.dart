import 'package:chat/features/pre_login/data/model/init.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///[InitState] `immutable` class created to hold state
@immutable
abstract class InitState extends Equatable {
  /// [InitState] constructor
  const InitState();
  @override
  List<InitializeModel> get props => [];
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
  final InitializeModel _appConfig;

  /// [getConfig] getter
  InitializeModel get getConfig => _appConfig;
  @override
  List<InitializeModel> get props => [_appConfig];
}

/// [InitFailure] state
class InitFailure extends InitState {}

/// [InitCatch] state
class InitCatch extends InitState {}
