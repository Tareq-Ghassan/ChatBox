import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/pre_login/domain/entity/configuration.dart';
import 'package:equatable/equatable.dart';

/// [ConfigurationResponseModel] represent api response class for get
/// Configuration
class ConfigurationResponseModel extends Equatable {
  /// [ConfigurationResponseModel] constructor
  const ConfigurationResponseModel({this.header, this.body});

  /// [ConfigurationResponseModel.fromJson] a factory constructor to convert
  /// json into object
  factory ConfigurationResponseModel.fromJson(Map<String, dynamic> json) {
    final header =
        json['header'] != null && json['header'] is Map<String, dynamic>
            ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
            : null;
    final body = json['body'] != null && json['body'] is Map<String, dynamic>
        ? ConfigurationModel.fromJson(json['body'] as Map<String, dynamic>)
        : null;
    return ConfigurationResponseModel(header: header, body: body);
  }

  /// [header] api header
  final HeaderModel? header;

  /// [body] api body
  final ConfigurationModel? body;

  @override
  List<Object?> get props => [header, body];
}

/// [ConfigurationModel] represent Configuration Model
class ConfigurationModel extends Configuration {
  /// [ConfigurationModel] constructor
  const ConfigurationModel({required super.countryCodes});

  /// [ConfigurationModel.fromJson] a factory constructor to convert json
  /// into object
  factory ConfigurationModel.fromJson(Map<String, dynamic> json) {
    final countryCodes = (json['countryCodes'] as List<dynamic>?)
            ?.map((v) => CountryCodeModel.fromJson(v as Map<String, dynamic>))
            .toList() ??
        [];
    return ConfigurationModel(countryCodes: countryCodes);
  }
}

/// [CountryCodeModel] represent Country Code Model
class CountryCodeModel extends CountryCode {
  /// [CountryCodeModel] constructor
  const CountryCodeModel({required super.name, required super.code});

  /// [CountryCodeModel.fromJson] a factory constructor to convert json
  /// into object
  factory CountryCodeModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] is String ? json['name'] as String : '';
    final code = json['code'] is String ? json['code'] as String : '';
    return CountryCodeModel(code: code, name: name);
  }
}
