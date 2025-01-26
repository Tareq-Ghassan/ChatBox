import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tCountryCode = CountryCode(name: 'name', code: 'code');

  const tConfiguration = Configuration(countryCodes: [tCountryCode]);

  test('Configuration props should return correct values', () async {
    // assert
    expect(tConfiguration.countryCodes.first, tCountryCode);
  });

  test('Configuration equality should be based on props', () async {
    // arrange
    const tCountryCode2 = CountryCode(name: 'name', code: 'code');
    const tConfiguration2 = Configuration(countryCodes: [tCountryCode2]);

    const tCountryCode3 = CountryCode(name: 'name2', code: 'code');
    const tConfiguration3 = Configuration(countryCodes: [tCountryCode3]);

    // assert
    expect(tConfiguration, equals(tConfiguration2));
    expect(tConfiguration, isNot(equals(tConfiguration3)));
  });
}
