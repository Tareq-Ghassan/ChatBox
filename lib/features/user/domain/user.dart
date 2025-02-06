import 'package:equatable/equatable.dart';

/// [User] holds user data
class User with EquatableMixin {
  /// [User] constructor
  const User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  /// [id] holds use id
  final String id;

  /// [name] holds name
  final String name;

  /// [email] holds email
  final String email;

  /// [profileImage] holds profile Image
  final String profileImage;

  /// [phoneNumber] holds phone Number
  final PhoneNumber phoneNumber;

  @override
  List<Object?> get props => [id, phoneNumber, name, email, profileImage];
}

/// [PhoneNumber] holds Phone Number
class PhoneNumber with EquatableMixin {
  /// [PhoneNumber] constructor
  const PhoneNumber({required this.number, required this.code});

  /// [number] holds number
  final String number;

  /// [code] holds code
  final String code;

  @override
  List<Object?> get props => [number, code];
}
