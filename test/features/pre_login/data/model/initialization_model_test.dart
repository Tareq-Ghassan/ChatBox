import 'dart:convert';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/pre_login/data/model/initlization_model.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/util/fixture_reader.dart';

void main() {
  final tInitializeModel = InitlizationModel(
    isInitialize: HeaderModel(errorCode: '0', message: 'success').errorCode == '0',
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
      final result =
          InitlizationModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on errorCode", () async {
      // arrange
      final tInitializeModel = InitlizationModel(
        isInitialize:
            HeaderModel(errorCode: null, message: 'success').errorCode == '0',
        header: HeaderModel(
          errorCode: null,
          message: 'success',
        ),
      );
      final jsonMap = json.decode(
        fixture(
          fileName: 'initialize_null_error',
          featureName: AppFeature.preLogin,
          isError: true,
        ),
      );

      // act
      final result =
          InitlizationModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on message", () async {
      // arrange
      final tInitializeModel = InitlizationModel(
        isInitialize: HeaderModel(errorCode: '0', message: null).errorCode == '0',
        header: HeaderModel(
          errorCode: '0',
          message: null,
        ),
      );
      final jsonMap = json.decode(
        fixture(
          fileName: 'initialize_null_message',
          featureName: AppFeature.preLogin,
          isError: true,
        ),
      );

      // act
      final result =
          InitlizationModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on header", () async {
      // arrange
      const tInitializeModel = InitlizationModel(
        isInitialize: false,
        header: null,
      );
      final jsonMap = json.decode(
        fixture(
          featureName: AppFeature.preLogin,
          fileName: 'initialize_null_header',
          isError: true,
        ),
      );

      // act
      final result =
          InitlizationModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
  });
}
