import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [InitEvent] `immutable` class created to hold events
@immutable
abstract class InitEvent extends Equatable {
  /// [InitEvent] constructor
  const InitEvent();
  @override
  List<Object> get props => [];
}

///[FetchInit] fetch event
class FetchInit extends InitEvent {
  ///[FetchInit] constructor
  const FetchInit();

  ///[props]
  @override
  List<Object> get props => super.props;
}

///[ResetInit] reset event
class ResetInit extends InitEvent {
  ///[ResetInit] constructor
  const ResetInit();

  ///[props]
  @override
  List<Object> get props => super.props;
}
