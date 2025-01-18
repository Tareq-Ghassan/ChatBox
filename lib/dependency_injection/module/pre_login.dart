part of '../di.dart';

/// [PreLoginModule]
class PreLoginModule implements BaseDi {
  @override
  Modules get moduleName => Modules.preLogin;

  /// [inject] where you register everything
  /// (Bloc, Use Case, Repository, Data source, etc...)
  @override
  void inject() {
    sl
      //* Bloc
      ..registerFactory(() => InitializeBloc(usecase: sl()))

      //* Use Cases
      ..registerLazySingleton(() => InitializeUseCase(repository: sl()))
      //* Repository
      ..registerLazySingleton<InitializeRepository>(
        () => InitializeRepositoryImpl(dataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<InitializeDataSource>(
        () => InitializationDataSourceImpl(api: sl(), networkInfo: sl()),
      );
  }

  /// [deregister] where you deregister everything
  /// you registered in `inject` function
  /// (Bloc, Use Case, Repository, Data source, etc...)
  @override
  void deregister() {
    //* Bloc
    if (sl.isRegistered<InitializeBloc>()) {
      sl<InitializeBloc>().close();
      sl.unregister<InitializeBloc>();
    }
    sl
      //* Use Cases
      ..unregister<InitializeUseCase>()
      //* Repository
      ..unregister<InitializeRepository>()
      //* DataSource
      ..unregister<InitializeDataSource>();
  }
}
