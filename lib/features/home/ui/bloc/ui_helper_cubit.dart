// ignore_for_file: avoid_setters_without_getters, document_ignores

import 'package:chat/core/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [HomeIndexCubit] which manages `Home tabs` as its state
class HomeIndexCubit extends Cubit<int> {
  /// The initial state of the [HomeIndexCubit] is `0`.
  HomeIndexCubit() : super(0);

  /// [index] function to set a new index value
  set index(int newVal) => emit(newVal);
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

/// A [AppBarTitleCubit] which manages `AppBar Title` as its state
class AppBarTitleCubit extends Cubit<String> {
  /// The initial state of the [AppBarTitleCubit] is `Home`.
  AppBarTitleCubit() : super(appLocalizations.home);

  set title(String newTitle) => emit(newTitle);
}
