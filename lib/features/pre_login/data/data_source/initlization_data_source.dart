
import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/exceptions.dart';
import 'package:chat/features/pre_login/data/model/initlization_model.dart';

/// [InitlizationDataSource] an abstract class holds Data Source
abstract class InitlizationDataSource {
  /// Calls `serverInit` API
  Future<InitlizationModel> getIsInitialized({
    required String appKey,
    required String appSecret,
  });
}

/// [InitlizationDataSourceImpl] represnet Data source implementation
class InitlizationDataSourceImpl extends BaseRemoteDataSource
    implements InitlizationDataSource {
  /// [InitlizationDataSourceImpl] constructor
  InitlizationDataSourceImpl(this.api, {required super.networkInfo});

  /// [api] holds an instent of api client
  final ApiClient api;

  @override
  Future<InitlizationModel> getIsInitialized({
    required String appKey,
    required String appSecret,
  }) async {
    final result = await executeApiCall<InitlizationModel>(
      apiCall: () async {
        final response = await api.post(
          'init',
          'serverInit',
          data: {
            'appKey': appKey,
            'appSecret': appSecret,
          },
        );
        return response.data as Map<String, dynamic>;
      },
      fromJson: InitlizationModel.fromJson,
    );
    if (result.header?.errorCode == '0') {
      return result;
    } else if (result.header?.errorCode == '-1') {
      throw ClientException(
        error: result.header!.errorCode.toString(),
        message: result.header!.message.toString(),
      );
    } else if (result.header != null) {
      throw UnauthorizedException(
        message: result.header!.message.toString(),
      );
    } else {
      throw const ServerException(
        message: 'Failed',
      );
    }
  }
}
