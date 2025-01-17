import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/data/model/initialize_model.dart';

/// [InitializeDataSource] an abstract class holds Data Source
abstract class InitializeDataSource {
  /// Calls `serverInit` API
  Future<InitializeModel> initialize({
    required String appKey,
    required String appSecret,
  });
}

/// [InitlizationDataSourceImpl] represnet Data source implementation
class InitlizationDataSourceImpl extends BaseRemoteDataSource
    implements InitializeDataSource {
  /// [InitlizationDataSourceImpl] constructor
  InitlizationDataSourceImpl({
    required super.api,
    required super.networkInfo,
  });

  @override
  Future<InitializeModel> initialize({
    required String appKey,
    required String appSecret,
  }) async {
    final result = await executeApiCall<InitializeModel>(
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
      fromJson: InitializeModel.fromJson,
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
