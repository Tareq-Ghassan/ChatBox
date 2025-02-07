part of '../di.dart';

/// [ChatModule] DI
class ChatModule implements BaseDi {
  @override
  void deregister() {
    //* Bloc
    if (sl.isRegistered<ChatsBloc>()) {
      sl<ChatsBloc>().close();
      sl.unregister<ChatsBloc>();
    }
    //! Get All Chats usecase
    //* Use Cases
    if (sl.isRegistered<GetAllChatsUseCase>()) {
      sl.unregister<GetAllChatsUseCase>();
    }
    //* Repository
    if (sl.isRegistered<GetAllChatsRepository>()) {
      sl.unregister<GetAllChatsRepository>();
    }

    //* DataSource
    if (sl.isRegistered<GetAllChatsDataSource>()) {
      sl.unregister<GetAllChatsDataSource>();
    }
  }

  @override
  void inject() {
    //* Bloc
    sl
      ..registerLazySingleton(() => ChatsBloc(getAllChatsUseCase: sl()))

      //! Get All Chats usecase
      //* Use Cases
      ..registerLazySingleton(() => GetAllChatsUseCase(repo: sl()))
      //* Repository
      ..registerLazySingleton<GetAllChatsRepository>(
        () => GetAllChatsRepositoryImpl(datasource: sl()),
      )
      //* DataSource
      ..registerLazySingleton<GetAllChatsDataSource>(
        () => GetAllChatsDataSourceImpl(api: sl(), networkInfo: sl()),
      );
  }

  @override
  Modules get moduleName => Modules.chat;
}
