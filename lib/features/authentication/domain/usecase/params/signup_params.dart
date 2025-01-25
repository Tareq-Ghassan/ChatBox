/// [SignupParams] api request params
class SignupParams {
  /// constructor
  const SignupParams({
    required this.name,
    required this.countryCode,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// [name] user Name
  final String name;

  /// [countryCode] user phone number country code
  final String countryCode;

  /// [name] user phone number
  final String phoneNumber;

  /// [name] user email
  final String email;

  /// [name] user password
  final String password;

  /// [name] user confirmPassword
  final String confirmPassword;
}
