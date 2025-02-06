import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/user/data/user_model.dart';

/// [Login] holds login operation
class LoginModel extends Login {
  /// [LoginModel] constructor
  const LoginModel({
    required HeaderModel header,
    required UserModel userData,
  }) : super(header: header, userData: userData);

  /// [LoginModel.fromJson] convert to [LoginModel] object

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final header = json['header'] != null
        ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
        : const HeaderModel(jwt: '');
    final userData = json['body'] != null
        ? UserModel.fromJson(json['body'] as Map<String, dynamic>)
        : const UserModel(
            id: '',
            name: '',
            email: '',
            phoneNumber: PhoneNumberModel(number: '', code: ''),
            profileImage: '',
          );
    return LoginModel(header: header, userData: userData);
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
