part of 'util.dart';

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
