// ignore_for_file: unused_field

import 'package:chat/features/authentication/domain/entity/login.dart';

/// [Login] holds login operation
class LoginModel extends Login {
  /// [LoginModel] constructor
  const LoginModel({
    required HeaderModel header,
    required UserDataModel userData,
  }) : super(header: header, userData: userData);

  /// [LoginModel.fromJson] convert to [LoginModel] object

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final header = json['header'] != null
        ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
        : const HeaderModel(jwt: '');
    final userData = json['body'] != null
        ? UserDataModel.fromJson(json['body'] as Map<String, dynamic>)
        : const UserDataModel(
            name: '',
            email: '',
            phoneNumber: PhoneNumber(number: '', code: ''),
          );
    return LoginModel(header: header, userData: userData);
  }
}

/// [UserDataModel] holds user data
class UserDataModel extends UserData {
  /// [UserDataModel] constructor
  const UserDataModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
  });

  /// [UserDataModel.fromJson] convert to [UserDataModel] object
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    final phoneNumber = json['phoneNumber'] != null
        ? PhoneNumberModel.fromJson(json['phoneNumber'] as Map<String, dynamic>)
        : const PhoneNumberModel(code: '', number: '');
    final name = json['name'] != null ? json['name'] as String : '';
    final email = json['email'] != null ? json['email'] as String : '';

    return UserDataModel(email: email, name: name, phoneNumber: phoneNumber);
  }
}

/// [PhoneNumberModel] holds Phone Number
class PhoneNumberModel extends PhoneNumber {
  /// [PhoneNumberModel] constructor
  const PhoneNumberModel({required super.code, required super.number});

  /// [PhoneNumberModel.fromJson] convert to [PhoneNumberModel] object
  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) {
    final code = json['code'] != null ? json['code'] as String : '';
    final number = json['number'] != null ? json['number'] as String : '';
    return PhoneNumberModel(code: code, number: number);
  }
}

/// [HeaderModel] represent header response
class HeaderModel extends Header {
  /// constructor
  const HeaderModel({
    required super.jwt,
    this.errorCode,
    this.message,
  });

  /// [HeaderModel.fromJson] to convert to [HeaderModel] object
  factory HeaderModel.fromJson(Map<String, dynamic> json) {
    final errorCode = json['errorCode'] as String?;
    final message = json['message'] as String?;
    final jwt = json['jwt'] as String? ?? '';
    return HeaderModel(jwt: jwt, errorCode: errorCode, message: message);
  }

  /// [errorCode] holds error code
  final String? errorCode;

  /// [message] holds error message
  final String? message;
}
