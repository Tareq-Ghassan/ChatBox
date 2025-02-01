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
  }

  @override
  void inject() {
    const timeout = Duration(seconds: 30);
    //! External
    sl
      ..registerLazySingleton(
        () => Dio(
          BaseOptions(
            baseUrl: dotenv.env['BASE_URL'] ?? '',
            connectTimeout: timeout,
            receiveTimeout: timeout,
            sendTimeout: timeout,
          ),
        ),
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
      );

    //! Features - Pre Login
    PreLoginModule().inject();
  }

  @override
  Modules get moduleName => Modules.core;
}
