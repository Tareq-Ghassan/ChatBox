import 'package:equatable/equatable.dart';

/// [Login] holds login operation
class Login extends Equatable {
  /// [Login] constructor
  const Login({required this.header, required this.userData});

  /// [header] holds header response
  final Header header;

  /// [userData] holds user data response
  final UserData userData;

  @override
  List<Object?> get props => [header, userData];
}

/// [UserData] holds user data
class UserData {
  /// [UserData] constructor
  const UserData({
    required this.phoneNumber,
    required this.name,
    required this.email,
  });

  /// [name] holds name
  final String name;

  /// [email] holds email
  final String email;

  /// [phoneNumber] holds phone Number
  final PhoneNumber phoneNumber;
}

/// [PhoneNumber] holds Phone Number
class PhoneNumber {
  /// [PhoneNumber] constructor
  const PhoneNumber({required this.number, required this.code});

  /// [number] holds number
  final String number;

  /// [code] holds code
  final String code;
}

/// [Header] represent header response
class Header {
  /// constructor
  const Header({required this.jwt});

  /// [jwt] holds login token
  final String jwt;
}
