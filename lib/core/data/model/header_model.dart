import 'package:equatable/equatable.dart';

/// [HeaderModel] represent header response
class HeaderModel extends Equatable{
  /// constructor
  const HeaderModel({required this.errorCode, required this.message});

  /// [HeaderModel.fromJson] to convert to [HeaderModel] object
  factory HeaderModel.fromJson(Map<String, dynamic> json) {
    final errorCode = json['errorCode']?.toString();
    final message = json['message']?.toString();
    return HeaderModel(errorCode: errorCode, message: message);
  }

  /// [errorCode] holds error code
  final String? errorCode;

  /// [message] holds error message
  final String? message;
  
  @override
  List<Object?> get props => [errorCode, message];
}
