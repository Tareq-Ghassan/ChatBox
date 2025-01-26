import 'package:chat/features/pre_login/data/data_source/configuration_data_source.dart';
import 'package:chat/features/pre_login/data/repository/configuration_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'configuration_repo_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ConfigurationDataSource>(),
])
void main() {
  late MockConfigurationDataSource dataSource;
  late ConfigurationRepositoryImpl repository;

  setUp(
    () {
      dataSource = MockConfigurationDataSource();
      repository = ConfigurationRepositoryImpl(dataSource: dataSource);
    },
  );
}
