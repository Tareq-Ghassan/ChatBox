import 'package:chat/features/user/domain/user.dart';
import 'package:equatable/equatable.dart';

/// [Login] holds login operation
class Login extends Equatable {
  /// [Login] constructor
  const Login({required this.header, required this.userData});

  /// [header] holds header response
  final Header header;

  /// [userData] holds user data response
  final User userData;

  @override
  List<Object?> get props => [header, userData];
}



/// [Header] represent header response
class Header {
  /// constructor
  const Header({required this.jwt});

  /// [jwt] holds login token
  final String jwt;
}
