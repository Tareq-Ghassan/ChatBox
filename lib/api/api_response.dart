/// [Header] represent header response
class Header {
  /// constructor
  Header({required this.errorCode, required this.message});

  /// [Header.fromJson] to convert to [Header] object
  Header.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'] as String?;
    message = json['message'] as String?;
  }

  /// [errorCode] holds error code
  String? errorCode;

  /// [message] holds error message
  String? message;
}
