import 'package:chat/api/api_response.dart';

/// [Init] holds initialization of the app
class Init {
  /// [Init] constructor
  Init({required this.header});

  /// [Init.fromJson] convert to [Init] object
  Init.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null
        ? Header.fromJson(json['header'] as Map<String, dynamic>)
        : null;
  }

  /// [header] holds header response
  Header? header;
}
