import 'package:chat/core/model/header.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';

/// [InitializeModel] holds initialization of the app
class InitializeModel extends Initialize {
  /// [InitializeModel] constructor
  InitializeModel({required this.header, required super.isInitialize});

  /// [InitializeModel.fromJson] convert to [InitializeModel] object
  InitializeModel.fromJson(Map<String, dynamic> json)
      : super(
          isInitialize: json['header'] != null &&
              (json['header'] as Map<String, dynamic>)['errorCode'] == '0',
        ) {
    header = json['header'] != null
        ? Header.fromJson(json['header'] as Map<String, dynamic>)
        : null;
  }

  /// [header] holds header response
  Header? header;
}
