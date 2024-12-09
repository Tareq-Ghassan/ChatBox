import 'package:chat/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// [UseCase] a generic class represent usecases call function
abstract class UseCase<Type, Params> {
  /// [call] usecase call function
  Future<Either<Failure, Type>> call(Params params);
}

/// [NoParams] represent a no paramters call function
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
