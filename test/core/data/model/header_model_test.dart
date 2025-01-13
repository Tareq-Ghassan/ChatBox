import 'dart:convert';

import 'package:chat/core/data/model/header_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/fixture_reader.dart';

void main() {
  final tHeaderModel = HeaderModel(
    errorCode: '00000',
    message: 'success',
  );

  group('form Json Header', () {
    test('should parse Header correctly', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(
          fileName: 'header',
          featureName: AppFeature.core,
        ),
      );

      // act
      final result = HeaderModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result.errorCode, tHeaderModel.errorCode);
      expect(result.message, tHeaderModel.message);

    });

    test('should parse message correctly', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(
          fileName: 'header_null_message',
          featureName: AppFeature.core,
          isError: true,
        ),
      );

      // act
      final result = HeaderModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result.message, isA<String?>());
    });

    test('should parse errorCode correctly', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(
          fileName: 'header_null_error',
          featureName: AppFeature.core,
          isError: true,
        ),
      );

      // act
      final result = HeaderModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result.errorCode, isA<String?>());
    });
  });
}
