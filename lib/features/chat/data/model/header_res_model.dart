import 'package:chat/features/authentication/data/model/login_model.dart';

/// [HeaderResModel] represent a class for any api that only retrieve header
class HeaderResModel {
  /// [HeaderResModel] constructor
  const HeaderResModel({required this.header});

  /// [HeaderResModel.fromJson] a factory constructor to convert
  /// json into object
  factory HeaderResModel.fromJson(Map<String, dynamic> json) {
    final header =
        json['header'] != null && json['header'] is Map<String, dynamic>
            ? HeaderModel.fromJson(json['header'] as Map<String, dynamic>)
            : null;

    return HeaderResModel(
      header: header,
    );
  }
  /// [header] 
  final HeaderModel? header;
}
