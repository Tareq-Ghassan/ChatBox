import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/user/domain/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tPhoneNumber = PhoneNumber(number: 'Afghanistan', code: '+93');
  const tHeader = Header(jwt: 'xxxx');
  const tUserData = User(
    id: '',
    name: 'Tareq',
    email: 't@t.t',
    phoneNumber: tPhoneNumber,
    profileImage: '',
  );
  const tLogin = Login(header: tHeader, userData: tUserData);
  test('Login props should return correct values', () async {
    // assert
    expect(tLogin.header, tHeader);
    expect(tLogin.userData, tUserData);
    expect(tLogin.userData.name, 'Tareq');
    expect(tLogin.userData.email, 't@t.t');
    expect(tLogin.header.jwt, 'xxxx');
  });

  test('Login equality should be based on props', () async {
    // arrange
    const tPhoneNumber2 = PhoneNumber(number: 'Afghanistan', code: '+93');
    const tHeader2 = Header(jwt: 'xxxx');
    const tUserData2 = User(
      id: '',
      name: 'Tareq',
      email: 't@t.t',
      phoneNumber: tPhoneNumber2,
      profileImage: '',
    );
    const tLogin2 = Login(header: tHeader2, userData: tUserData2);
    const tHeader3 = Header(jwt: 'xxxx');
    const tPhoneNumber3 = PhoneNumber(number: 'Afghanistan', code: '+93');
    const tUserData3 = User(
      id: '',
      name: 'Tareq2',
      email: 't@t.t',
      phoneNumber: tPhoneNumber3,
      profileImage: '',
    );
    const tLogin3 = Login(header: tHeader3, userData: tUserData3);

    // assert
    expect(tLogin, equals(tLogin2));
    expect(tLogin, isNot(equals(tLogin3)));
  });
}
