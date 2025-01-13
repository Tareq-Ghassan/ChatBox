/// [HeaderModel] represent header response
class HeaderModel {
  /// constructor
  HeaderModel({required this.errorCode, required this.message});

  /// [HeaderModel.fromJson] to convert to [HeaderModel] object
  HeaderModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode']?.toString();
    message = json['message']?.toString();
  }

  /// [errorCode] holds error code
  String? errorCode;

  /// [message] holds error message
  String? message;
}
