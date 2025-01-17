import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/features/pre_login/data/data_source/initialize_data_source.dart';
import 'package:chat/features/pre_login/data/repositories/initialize_repository_impl.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/ui/bloc/initialize_bloc.dart';
import 'package:get_it/get_it.dart';

/// [sl] Get it instance
final sl = GetIt.instance;

/// [init]
void init() {
//! Featurers - Pre Login
  //* Bloc
  sl
    ..registerFactory(() => InitializeBloc(usecase: sl()))

    //* Use Cases
    ..registerLazySingleton(() => InitializeUseCase(repository: sl()))

    //* Repository
    ..registerLazySingleton<InitializeRepository>(
      () => InitializeRepositoryImpl(
        dataSource: sl(),
      ),
    )
    //* DataSource
    ..registerLazySingleton<InitializeDataSource>(
      () => InitlizationDataSourceImpl(
        api: sl(),
        networkInfo: sl(),
      ),
    )

//! Core
    ..registerLazySingleton<MiddlewareApi>(MiddlewareApiImpl.new);

//! External
}
