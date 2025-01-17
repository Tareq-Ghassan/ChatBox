import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Category entity test',
    () {
      late bool tIsInitialize;
      late Initialize tInitialize;
      setUp(() {
        tIsInitialize = true;
        tInitialize = Initialize(
          isInitialize: tIsInitialize,
        );
      });
      test('Initialize props should return correct values', () {
        // Assert
        expect(tInitialize.isInitialize, tIsInitialize);
      });
      test('Initialize equality should be based on props', () {
        // Arrange
        const tIsInitialize2 = false;
        const tInitialize2 = Initialize(
          isInitialize: tIsInitialize2,
        );
        // Assert
        expect(tIsInitialize, equals(tIsInitialize));
        expect(tIsInitialize, isNot(equals(tInitialize2)));
      });
    },
  );
}
