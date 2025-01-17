import 'package:equatable/equatable.dart';
/// [Initialize] represent initialization entity class
class Initialize extends Equatable {
  /// [Initialize] constructor
  const Initialize({required this.isInitialize});

  /// [isInitialize] holds initialization value
  final bool isInitialize;

  @override
  List<bool> get props => [isInitialize];
}
