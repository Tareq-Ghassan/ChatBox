import 'package:chat/features/user/domain/user.dart';

/// [UserModel] holds user data
class UserModel extends User {
  /// [UserModel] constructor
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.profileImage,
  });

  /// [UserModel.fromJson] convert to [UserModel] object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json['_id'] != null ? json['_id'] as String : '';
    final phoneNumber = json['phoneNumber'] != null
        ? PhoneNumberModel.fromJson(json['phoneNumber'] as Map<String, dynamic>)
        : const PhoneNumberModel(code: '', number: '');
    final name = json['name'] != null ? json['name'] as String : '';
    final email = json['email'] != null ? json['email'] as String : '';
    final profileImage =
        json['profileImage'] != null ? json['profileImage'] as String : '';

    return UserModel(
      id: id,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );
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
