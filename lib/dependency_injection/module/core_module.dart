part of '../di.dart';

/// [Core] module
class Core implements BaseDi {
  /// [Core] return the same instant
  factory Core() => _instance;
  Core._internal();
  static final Core _instance = Core._internal();

  @override
  void deregister() {
    if (sl.isRegistered<MiddlewareApi>()) sl.unregister<MiddlewareApi>();
    if (sl.isRegistered<NetworkInfo>()) sl.unregister<NetworkInfo>();
    if (sl.isRegistered<Dio>()) sl.unregister<Dio>();

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

  @override
  void inject() {
    const timeout = Duration(seconds: 30);
    //! create Dio instance and add the interceptor

    //! External
    sl
      ..registerLazySingleton(
        () {
          final dio = Dio(
            BaseOptions(
              baseUrl: dotenv.env['BASE_URL'] ?? '',
              connectTimeout: timeout,
              receiveTimeout: timeout,
              sendTimeout: timeout,
            ),
          );
          dio.interceptors.add(
            JwtInterceptor(
              checkLoginStatusUseCase: sl(),
            ),
          );
          return dio;
        },
      )
      ..registerLazySingleton(InternetConnection.new)
      ..registerLazySingleton(FlutterSecureStorage.new)
      //! Core
      ..registerLazySingleton<MiddlewareApi>(
        () => MiddlewareApiImpl(http: sl()),
      )
      ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl()),
      )
      ..registerLazySingleton<SecurePreferences>(
        () => SecurePreferencesImpl(securePreferences: sl()),
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

    //! Features - Pre Login
    PreLoginModule().inject();
  }

  @override
  Modules get moduleName => Modules.core;
}
