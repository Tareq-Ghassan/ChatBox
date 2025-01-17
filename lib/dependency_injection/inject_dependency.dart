part of 'di.dart';

/// [sl] Get it instance
final sl = GetIt.instance;

/// [injectDependencies]
Future<void> injectDependencies() async {
  await dotenv.load();

//! External
  sl
    ..registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? '')),
    )
    ..registerLazySingleton(InternetConnection.new)

//! Core
    ..registerLazySingleton<MiddlewareApi>(() => MiddlewareApiImpl(http: sl()))
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl()),
    );

//! Features - Pre Login
  PreLoginModule().register();
}
