import 'package:chat/core/error/error.dart';
import 'package:dartz/dartz.dart';

/// [InputConvertor] utility class to convert data
class InputConvertor {
  /// [stringToInteger] convert [String] into [int]
  Either<Failure, int> stringToInteger(String str) {
    try {
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
