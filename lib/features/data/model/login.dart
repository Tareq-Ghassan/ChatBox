/// [Login] holds login operation
class Login {
  /// [Login] constructor
  Login({required this.header});

  /// [Login.fromJson] convert to [Login] object
  Login.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null
        ? Header.fromJson(json['header'] as Map<String, dynamic>)
        : null;
    userData = json['body'] != null
        ? UserData.fromJson(json['body'] as Map<String, dynamic>)
        : null;
  }

  /// [header] holds header response
  Header? header;

  /// [userData] holds user data response
  UserData? userData;
}

/// [UserData] holds user data
class UserData {
  /// [UserData] constructor
  UserData({this.name, this.email});

  /// [UserData.fromJson] convert to [UserData] object
  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    email = json['email'] as String?;
  }

  /// [name] holds name
  String? name;

  /// [email] holds email
  String? email;
}

/// [Header] represent header response
class Header {
  /// constructor
  Header({required this.errorCode, required this.message});

  /// [Header.fromJson] to convert to [Header] object
  Header.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'] as String?;
    message = json['message'] as String?;
    jwt = json['jwt'] as String?;
  }

  /// [errorCode] holds error code
  String? errorCode;

  /// [message] holds error message
  String? message;

  /// [message] holds login token
  String? jwt;
}
