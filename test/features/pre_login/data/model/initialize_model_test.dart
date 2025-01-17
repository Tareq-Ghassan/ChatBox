import 'dart:convert';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/pre_login/data/model/initialize_model.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/util/fixture_reader.dart';

void main() {
  final tInitializeModel = InitializeModel(
    isInitialize:
        HeaderModel(errorCode: '0', message: 'success').errorCode == '0',
    header: HeaderModel(
      errorCode: '0',
      message: 'success',
    ),
  );

  test('should be a subclass of Initialize entity', () async {
    // assert
    expect(tInitializeModel, isA<Initialize>());
  });

  group('from json', () {
    test('should return a valid model from json data', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(
          fileName: 'initialize',
          featureName: AppFeature.preLogin,
        ),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouldn't return a null exception on header", () async {
      // arrange
      const tInitializeModel = InitializeModel(
        isInitialize: false,
      );
      final jsonMap = json.decode(
        fixture(
          featureName: AppFeature.preLogin,
          fileName: 'initialize_null_header',
          isError: true,
        ),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
  });
}
