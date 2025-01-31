import 'dart:convert';

import 'package:chat/features/authentication/data/model/login_model.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/util/fixture_reader.dart';

void main() {
  late HeaderModel tHeader;
  late PhoneNumber tPhoneNumber;
  late UserDataModel tUserData;
  late LoginModel tLoginModel;

  setUpAll(() {
    tHeader = const HeaderModel(
      errorCode: '00000',
      message: 'Success',
      jwt: 'xxxxxx',
    );
    tPhoneNumber = const PhoneNumber(number: '02', code: '+1');
    tUserData = UserDataModel(
      name: 'Tareq Ghassan',
      email: 'test@gmail.com',
      phoneNumber: tPhoneNumber,
    );
    tLoginModel = LoginModel(header: tHeader, userData: tUserData);
  });
  group('inheritance Test', () {
    test('test LoginModel is sub of Login', () {
      // Assert
      expect(tLoginModel, isA<Login>());
    });
    test('test HeaderModel is sub of Header', () {
      // Assert
      expect(tLoginModel.header, isA<Header>());
    });
    test('test UserDataModel is sub of UserData', () {
      // Assert
      expect(tLoginModel.userData, isA<UserData>());
    });
  });

  test('Should return a valid model from json data', () async {
    // arrange
    final jsonMap = json.decode(
      fixture(featureName: AppFeature.authentication, fileName: 'login'),
    );

    // act
    final result = LoginModel.fromJson(jsonMap as Map<String, dynamic>);

    // assert

    expect(result.header.jwt, tLoginModel.header.jwt);
    expect(result.userData.name, tLoginModel.userData.name);
    expect(result.userData.email, tLoginModel.userData.email);
  });
}
