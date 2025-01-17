/// [InitializeParams] represent init params
class InitializeParams {
  /// [InitializeParams] constructor
  const InitializeParams({required this.appKey, required this.appSecret});

  /// [appKey] from env file
  final String appKey;

  /// [appSecret] from env file
  final String appSecret;
}
