part of '../di.dart';

/// [AuthenticationModule] DI
class AuthenticationModule extends BaseDi {
  @override
  void deregister() {
    //* Bloc
    if (sl.isRegistered<AuthenticationBloc>()) {
      sl<AuthenticationBloc>().close();
      sl.unregister<AuthenticationBloc>();
    }

    //* Use Cases
    if (sl.isRegistered<LoginUsecase>()) {
      sl.unregister<LoginUsecase>();
    }
    //* Repository
    if (sl.isRegistered<LoginRepository>()) {
      sl.unregister<LoginRepository>();
    }

    //* DataSource
    if (sl.isRegistered<LoginDataSource>()) {
      sl.unregister<LoginDataSource>();
    }
  }

  @override
  void inject() {
    sl
      //* Bloc
      ..registerFactory(() => AuthenticationBloc(loginUsecase: sl()))

      //* Use Cases
      ..registerLazySingleton(() => LoginUsecase(repository: sl()))
      //* Repository
      ..registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(dataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<LoginDataSource>(
        () => LoginDataSourceImpl(api: sl(), networkInfo: sl()),
      );
  }

  @override
  Modules get moduleName => Modules.authentication;
}

/// [AuthenticationUiModule] this is only to inject and deregister
/// ui dependencies
class AuthenticationUiModule extends BaseDi {
  @override
  void deregister() {
    //* Cubit
    if (sl.isRegistered<EmailCubit>()) {
      sl<EmailCubit>().close();
      sl.unregister<EmailCubit>();
    }
    if (sl.isRegistered<PasswordCubit>()) {
      sl<PasswordCubit>().close();
      sl.unregister<PasswordCubit>();
    }
    if (sl.isRegistered<HidePasswordCubit>()) {
      sl<HidePasswordCubit>().close();
      sl.unregister<HidePasswordCubit>();
    }
  }

  @override
  void inject() {
    sl
      //* Cubit
      ..registerFactory(EmailCubit.new)
      ..registerFactory(PasswordCubit.new)
      ..registerFactory(HidePasswordCubit.new);
  }

  @override
  Modules get moduleName => Modules.authenticationUiModule;
}
