import 'package:chat/features/pre_login/data/model/init.dart';

/// [InitlizationDataSource] an abstract class holds Data Source
abstract class InitlizationDataSource {
  /// Calls `serverInit` API
  Future<InitializeModel> getIsInitialized();
}
