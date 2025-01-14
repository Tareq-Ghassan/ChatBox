import 'package:chat/core/data/model/header_model.dart';
import 'package:chat/features/pre_login/domain/entity/initialize.dart';

/// [InitializeModel] holds initialization of the app
class InitializeModel extends Initialize {
  /// [InitializeModel] constructor
  const InitializeModel({required super.isInitialize, this.header});

  /// [InitializeModel.fromJson] convert to [InitializeModel] object
  InitializeModel.fromJson(Map<String, dynamic> json)
      : header = json['header'] != null
            ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
            : null,
        super(
          isInitialize: json['header'] != null &&
              (json['header'] as Map<String, dynamic>)['errorCode'] == '0',
        );

  /// [header] holds header response
  final HeaderModel? header;
}
