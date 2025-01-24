import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/model/login_model.dart';

/// [LoginDataSource] represent login data source
abstract class LoginDataSource {
  /// [login] function
  Future<LoginModel> login({
    required String email,
    required String password,
  });
}

/// [LoginDataSourceImpl] an implement class for data source
class LoginDataSourceImpl extends BaseRemoteDataSource
    implements LoginDataSource {
  /// [LoginDataSourceImpl] constructor
  LoginDataSourceImpl({required super.networkInfo, required super.api});

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final result = await executeApiCall<LoginModel>(
      apiCall: () async {
        final response = await api.post(
          'user',
          'login',
          data: {
            'email': email,
            'password': password,
          },
        );
        return response.data as Map<String, dynamic>;
      },
      fromJson: LoginModel.fromJson,
    );
    if (result.header is HeaderModel) {
      final headerModel = result.header as HeaderModel;
      if (headerModel.errorCode == '00000' && result.header.jwt.isNotEmpty) {
        return result;
      } else {
        throw ClientException(
          message: headerModel.message.toString(),
          error: headerModel.errorCode.toString(),
        );
      }
    } else {
      throw const ClientException(message: 'Invalid header', error: 'UNKNOWN');
    }
  }
}


// import 'package:chat/features/authentication/data/model/login_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// /// [AuthenticationRepo] a repository class for Authentication
// class AuthenticationRepo {
//   /// [register] function to register new user
//   Future<LoginModel?> register({
//     required String name,
//     required String email,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     await dotenv.load();
//     try {
//       // final response = await api.post(
//       //   'user',
//       //   'register',
//       //   data: {
//       //     'name': name,
//       //     'email': email,
//       //     'password': password,
//       //     'confirmPassword': confirmPassword,
//       //   },
//       // );
//       // debugPrint(response.data.toString());
//       // if (response.data != null) {
//       //   debugPrint(response.data.toString());
//       //   return Login.fromJson(response.data as Map<String, dynamic>);
//       // }
//       return null;
//     } catch (e) {
//       debugPrint('Error in login: $e');
//       throw Exception('Failed to login');
//     }
//   }
// }
