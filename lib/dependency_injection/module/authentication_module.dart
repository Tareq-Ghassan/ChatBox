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
//! login usecase
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

    //! Signup usecase

    //* Use Cases
    if (sl.isRegistered<SignupUsecase>()) {
      sl.unregister<SignupUsecase>();
    }
    //* Repository
    if (sl.isRegistered<SignupRepository>()) {
      sl.unregister<SignupRepository>();
    }

    //* DataSource
    if (sl.isRegistered<SignupDataSource>()) {
      sl.unregister<SignupDataSource>();
    }
  }

  @override
  void inject() {
    sl
      //* Bloc
      ..registerFactory(
        () => AuthenticationBloc(
          loginUsecase: sl(),
          signupUsecase: sl(),
        ),
      )
//! login usecase
      //* Use Cases
      ..registerLazySingleton(() => LoginUsecase(repository: sl()))
      //* Repository
      ..registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(dataSource: sl(), localDataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<LoginDataSource>(
        () => LoginDataSourceImpl(api: sl(), networkInfo: sl()),
      )

//! Signup usecase
      //* Use Cases
      ..registerLazySingleton(() => SignupUsecase(repository: sl()))
      //* Repository
      ..registerLazySingleton<SignupRepository>(
        () => SignupRepositoryImpl(dataSource: sl(), localDataSource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<SignupDataSource>(
        () => SignupDataSourceImpl(api: sl(), networkInfo: sl()),
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
    if (sl.isRegistered<NameCubit>()) {
      sl<NameCubit>().close();
      sl.unregister<NameCubit>();
    }
    if (sl.isRegistered<CountryCodeCubit>()) {
      sl<CountryCodeCubit>().close();
      sl.unregister<CountryCodeCubit>();
    }
    if (sl.isRegistered<HidePasswordCubit>()) {
      sl<HidePasswordCubit>().close();
      sl.unregister<HidePasswordCubit>();
    }
    if (sl.isRegistered<ConfirmPasswordCubit>()) {
      sl<ConfirmPasswordCubit>().close();
      sl.unregister<ConfirmPasswordCubit>();
    }
    if (sl.isRegistered<PhoneNumberCubit>()) {
      sl<PhoneNumberCubit>().close();
      sl.unregister<PhoneNumberCubit>();
    }
  }

  @override
  void inject() {
    sl
      //* Cubit
      ..registerLazySingleton(EmailCubit.new)
      ..registerLazySingleton(HidePasswordCubit.new)
      ..registerLazySingleton(PasswordCubit.new)
      ..registerLazySingleton(ConfirmPasswordCubit.new)
      ..registerLazySingleton(NameCubit.new)
      ..registerLazySingleton(PhoneNumberCubit.new)
      ..registerLazySingleton(CountryCodeCubit.new);
  }

  @override
  Modules get moduleName => Modules.authenticationUiModule;
}
