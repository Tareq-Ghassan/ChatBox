import 'package:chat/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// [BaseUseCase] a generic class represent usecase call function
abstract class BaseUseCase<Type, Params> {
  /// [call] usecase call function
  Future<Either<Failure, Type>> call(Params params);
}

/// [NoParams] represent a no parameters call function
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
