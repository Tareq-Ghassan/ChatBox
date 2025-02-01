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
      ..registerFactory(
        () => InitializeBloc(
          configurationUsecase: sl(),
          initializeUseCase: sl(),
          loginStatusUsecase: sl(),
        ),
      )

      ///! initialize
      //* Use Cases
      ..registerLazySingleton(() => InitializeUseCase(repository: sl()))
      //* Repository
      ..registerLazySingleton<InitializeRepository>(
        () => InitializeRepositoryImpl(dataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<InitializeDataSource>(
        () => InitializationDataSourceImpl(api: sl(), networkInfo: sl()),
      )

      ///! configuration
      //* Use Cases
      ..registerLazySingleton(() => ConfigurationUseCase(repository: sl()))
      //* Repository
      ..registerLazySingleton<ConfigurationRepository>(
        () => ConfigurationRepositoryImpl(dataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<ConfigurationDataSource>(
        () => ConfigurationDataSourceImpl(api: sl(), networkInfo: sl()),
      )

      ///! loginStatus
      //* Use Cases
      ..registerLazySingleton(() => CheckLoginStatusUseCase(repository: sl()))
      //* Repository
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(localDataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<AuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSourceImpl(securePreferences: sl()),
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

    ///! initialize
    //* Use Cases
    if (sl.isRegistered<InitializeUseCase>()) {
      sl.unregister<InitializeUseCase>();
    }
    //* Repository
    if (sl.isRegistered<InitializeRepository>()) {
      sl.unregister<InitializeRepository>();
    }

    //* DataSource
    if (sl.isRegistered<InitializeDataSource>()) {
      sl.unregister<InitializeDataSource>();
    }

    ///! configuration
    //* Use Cases
    if (sl.isRegistered<ConfigurationUseCase>()) {
      sl.unregister<ConfigurationUseCase>();
    }
    //* Repository
    if (sl.isRegistered<ConfigurationRepository>()) {
      sl.unregister<ConfigurationRepository>();
    }

    //* DataSource
    if (sl.isRegistered<ConfigurationDataSource>()) {
      sl.unregister<ConfigurationDataSource>();
    }

    ///! loginStatus
    //* Use Cases
    if (sl.isRegistered<CheckLoginStatusUseCase>()) {
      sl.unregister<CheckLoginStatusUseCase>();
    }
    //* Repository
    if (sl.isRegistered<AuthenticationRepository>()) {
      sl.unregister<AuthenticationRepository>();
    }

    //* DataSource
    if (sl.isRegistered<AuthenticationLocalDataSource>()) {
      sl.unregister<AuthenticationLocalDataSource>();
    }
  }
}
