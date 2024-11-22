// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [HomeIndexCubit] which manages `Home tabs` as its state
class HomeIndexCubit extends Cubit<int> {
  /// The initial state of the [HomeIndexCubit] is `0`.
  HomeIndexCubit() : super(0);

  /// [index] function to set a new index value
  set index(int newVal) => emit(newVal);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}

/// A [SwipeOffsetCubit] which manages `SwipeOffset for chat item` as its state
class SwipeOffsetCubit extends Cubit<double> {
  /// The initial state of the [SwipeOffsetCubit] is `0`.
  SwipeOffsetCubit() : super(0);

  /// [updateOffset] function to update a new swipeOffset value
  void updateOffset(double delta, double maxOffset) {
    emit((state + delta).clamp(-maxOffset, 0.0));
  }

  /// [reset] function to rest swipeOffset
  void reset() {
    emit(0);
  }
}
