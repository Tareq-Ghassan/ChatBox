/// [MuteUnmuteParams] holds API Params and flag to determine the correct action
class MuteUnmuteParams {
  /// [MuteUnmuteParams] constructor
  const MuteUnmuteParams({required this.chatId, required this.isMute});

  /// [isMute]
  final bool isMute;

  ///[chatId]
  final String chatId;
}
