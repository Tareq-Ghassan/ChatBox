import 'dart:convert';

import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/pre_login/data/model/configuration_model.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/util/fixture_reader.dart';

void main() {
  const tCountryCodeModel = CountryCodeModel(name: 'Afghanistan', code: '+93');
  const tCountryCodeModel2 = CountryCodeModel(name: 'Albania', code: '+355');

  const tConfigurationModel = ConfigurationModel(
    countryCodes: [tCountryCodeModel, tCountryCodeModel2],
  );
  test('should be a subclass of Configuration entity', () async {
    // assert
    expect(tConfigurationModel, isA<Configuration>());
  });
  group('from json', () {
    test('should return a valid model from json data', () async {
      // arrange
      final jsonMap = json.decode(
        fixture(
          fileName: 'configuration',
          featureName: AppFeature.preLogin,
        ),
      );

      // act
      final result =
          ConfigurationResponseModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result.body, tConfigurationModel);
    });
    test("shouldn't return a exception on parsing", () async {
      // arrange
      const tConfigurationModel = ConfigurationModel(
        countryCodes: [tCountryCodeModel, tCountryCodeModel2],
      );
      const tHeaderModel = HeaderModel(errorCode: '00000', message: 'Success');
      const tConfigurationResponseModel = ConfigurationResponseModel(
        header: tHeaderModel,
        body: tConfigurationModel,
      );
      final jsonMap = json.decode(
        fixture(
          featureName: AppFeature.preLogin,
          fileName: 'configuration_error',
          isError: true,
        ),
      );

      // act
      final result =
          ConfigurationResponseModel.fromJson(jsonMap as Map<String, dynamic>);

      // assert
      expect(result, tConfigurationResponseModel);
    });
  });
}
