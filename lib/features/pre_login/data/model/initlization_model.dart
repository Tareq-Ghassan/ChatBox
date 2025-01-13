import 'package:chat/core/model/header.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';

/// [InitlizationModel] holds initialization of the app
class InitlizationModel extends Initialize {
  /// [InitlizationModel] constructor
  const InitlizationModel({required super.isInitialize, this.header});

  /// [InitlizationModel.fromJson] convert to [InitlizationModel] object
  InitlizationModel.fromJson(Map<String, dynamic> json)
      : header = json['header'] != null
            ? Header.fromJson(json['header'] as Map<String, dynamic>)
            : null,
        super(
          isInitialize: json['header'] != null &&
              (json['header'] as Map<String, dynamic>)['errorCode'] == '0',
        );

  /// [header] holds header response
  final Header? header;
}
