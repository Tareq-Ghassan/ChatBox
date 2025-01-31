import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/authentication/data/model/login_model.dart';

/// [SignupDataSource] represent data source
abstract class SignupDataSource {
  /// [signup] function
  Future<LoginModel> signup({
    required String name,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  });
}

/// [SignupDataSourceImpl] data source implementation
class SignupDataSourceImpl extends BaseRemoteDataSource
    implements SignupDataSource {
  /// [SignupDataSourceImpl] constructor
  SignupDataSourceImpl({required super.networkInfo, required super.api});

  @override
  Future<LoginModel> signup({
    required String name,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final result = await executeApiCall<LoginModel>(
      apiCall: () async {
        final response = await api.post(
          'user',
          'register',
          data: {
            'name': name,
            'email': email,
            'password': password,
            'confirmPassword': confirmPassword,
            'phoneNumber': phoneNumber,
            'countryCode': countryCode,
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
