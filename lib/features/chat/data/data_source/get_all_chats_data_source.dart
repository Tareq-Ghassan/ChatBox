import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/model/chats_model.dart';

/// [GetAllChatsDataSource] abstract class
abstract class GetAllChatsDataSource {
  Future<ChatsModel> getAllChats();
}

/// [GetAllChatsDataSource] implementation for get all chats data source
class GetAllChatsDataSourceImpl extends BaseRemoteDataSource
    implements GetAllChatsDataSource {
  /// [GetAllChatsDataSourceImpl] constructor
  GetAllChatsDataSourceImpl({
    required super.networkInfo,
    required super.api,
  });

  @override
  Future<ChatsModel> getAllChats() async {
    final result = await executeApiCall<ChatsModel>(
      apiCall: () async {
        final response = await api.get(
          'init',
          'getConfiguration',
        );
        return response.data as Map<String, dynamic>;
      },
      fromJson: ChatsModel.fromJson,
    );
    if (result.header?.errorCode == '00000') {
      return result;
    } else if (result.header != null) {
      throw ClientException(
        error: result.header!.errorCode.toString(),
        message: result.header!.message.toString(),
      );
    } else {
      throw const ServerException(
        message: 'Failed',
      );
    }
  }
}
