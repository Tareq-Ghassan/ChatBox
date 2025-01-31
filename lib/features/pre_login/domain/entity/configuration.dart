import 'package:equatable/equatable.dart';

/// [Configuration] entity
class Configuration with EquatableMixin {
  /// [Configuration] constructor
  const Configuration({required this.countryCodes});

  /// [countryCodes] holds country Codes
  final List<CountryCode> countryCodes;
  @override
  List<Object?> get props => [countryCodes];
}

/// [CountryCode] entity holds country code
class CountryCode with EquatableMixin {
  /// [CountryCode] constructor
  const CountryCode({required this.name, required this.code});

  /// [name] country name
  final String name;

  /// [code] country code
  final String code;

  @override
  List<Object?> get props => [name,code];
}
