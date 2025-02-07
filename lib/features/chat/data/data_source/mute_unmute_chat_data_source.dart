import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/error/error.dart';
import 'package:chat/features/chat/data/model/header_res_model.dart';

/// [MuteUnmuteChatDataSource] abstract class call remote to mute or unmute
/// message
abstract class MuteUnmuteChatDataSource {
  /// [muteUnmute] function
  Future<void> muteUnmute({required bool isMute, required String chatId});
}

/// [MuteUnmuteChatDataSourceImpl] implementation for [MuteUnmuteChatDataSource]
///
/// either fetch `mute` or `unmute` api depend on `isMute` param
class MuteUnmuteChatDataSourceImpl extends BaseRemoteDataSource
    implements MuteUnmuteChatDataSource {
  /// [MuteUnmuteChatDataSourceImpl] constructor
  MuteUnmuteChatDataSourceImpl({
    required super.networkInfo,
    required super.api,
  });
  @override
  Future<void> muteUnmute({
    required bool isMute,
    required String chatId,
  }) async {
    final result = await executeApiCall<HeaderResModel>(
      apiCall: () async {
        final response = await api.put(
          'chat',
          isMute ? 'mute' : 'unmute',
          data: {
            'chatId': chatId,
          },
        );
        return response.data as Map<String, dynamic>;
      },
      fromJson: HeaderResModel.fromJson,
    );
    if (result.header?.errorCode == '00000') {
      return;
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
