import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/pre_login/data/model/configuration_model.dart';

/// [ConfigurationDataSource] abstract class
abstract class ConfigurationDataSource {
  /// [getConfiguration] function
  Future<ConfigurationResponseModel> getConfiguration();
}

/// [ConfigurationDataSourceImpl] implementation 
class ConfigurationDataSourceImpl extends BaseRemoteDataSource
    implements ConfigurationDataSource {

/// [ConfigurationDataSourceImpl] constructor
ConfigurationDataSourceImpl({required super.networkInfo,required super.api,})

  
  @override
  Future<ConfigurationResponseModel> getConfiguration() async{
      final result = await executeApiCall<ConfigurationResponseModel>(
      apiCall: () async {
        final response = await api.get(
          'init',
          'getConfiguration',

        );
        return response.data as Map<String, dynamic>;
      },
      fromJson: ConfigurationResponseModel.fromJson,
    );
    if (result.header?.errorCode == '00000') {
      return result;
    } else if (result.header!=null) {
      throw ClientException(
        error: result.header!.errorCode.toString(),
        message: result.header!.message.toString(),
      );
    }  else {
      throw const ServerException(
        message: 'Failed',
      );
    }
    
  }

 
}
