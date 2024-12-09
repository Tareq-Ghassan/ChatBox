import 'dart:convert';

import 'package:chat/core/model/header.dart';
import 'package:chat/features/pre_login/data/model/init.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tInitializeModel = InitializeModel(
    isInitialize: Header(errorCode: '0', message: 'success').errorCode == '0',
    header: Header(
      errorCode: '0',
      message: 'success',
    ),
  );

  test('should be a subclass of Initialize entity', () async {
    // arrange
    expect(tInitializeModel, isA<Initialize>());
    // act

    // assert
  });

  group('from json', () {
    test('should return a valid model from json data', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(featureName: 'pre_login', fileName: 'initialize'),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on errorCode", () async {
      // arrange
      final tInitializeModel = InitializeModel(
        isInitialize:
            Header(errorCode: null, message: 'success').errorCode == '0',
        header: Header(
          errorCode: null,
          message: 'success',
        ),
      );
      final jsonMap = json.decode(
        fixture(
          featureName: 'pre_login',
          fileName: 'error/initialize_null_error',
        ),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on message", () async {
      // arrange
      final tInitializeModel = InitializeModel(
        isInitialize: Header(errorCode: '0', message: null).errorCode == '0',
        header: Header(
          errorCode: '0',
          message: null,
        ),
      );
      final jsonMap = json.decode(
        fixture(
          featureName: 'pre_login',
          fileName: 'error/initialize_null_message',
        ),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
    test("shouln't return a null exception on header", () async {
      // arrange
      final tInitializeModel = InitializeModel(
        isInitialize: false,
        header: null,
      );
      final jsonMap = json.decode(
        fixture(
          featureName: 'pre_login',
          fileName: 'error/initialize_null_header',
        ),
      );

      // act
      final result = InitializeModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tInitializeModel);
    });
  });
}
