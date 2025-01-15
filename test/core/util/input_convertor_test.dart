import 'package:chat/core/error/error.dart';
import 'package:chat/core/util/input_convertor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConvertor inputConvertor;
  setUp(() {
    inputConvertor = InputConvertor();
  });
  group('String to unsigned int', () {
    test('Should return integer when the string represent unsigned int', () {
      // Arrange
      const str = '123';

      // Act
      final result = inputConvertor.stringToInteger(str);

      // Assert
      expect(result, const Right<Failure, int>(123));
    });

    test('Should return failure when the string is not an integer', () {
      // Arrange
      const str = 'abs';

      // Act
      final result = inputConvertor.stringToInteger(str);

      // Assert
      expect(result, Left<Failure, int>(InvalidInputFailure()));
    });
  });
}
