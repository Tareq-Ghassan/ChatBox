part of '../di.dart';

/// [HomeModule] DI
class HomeModule implements BaseDi {
  @override
  void deregister() {
    if (sl.isRegistered<SwipeOffsetCubit>()) {
      sl<SwipeOffsetCubit>().close();
      sl.unregister<SwipeOffsetCubit>();
    }
    if (sl.isRegistered<AppBarTitleCubit>()) {
      sl<AppBarTitleCubit>().close();
      sl.unregister<AppBarTitleCubit>();
    }
    if (sl.isRegistered<HomeIndexCubit>()) {
      sl<HomeIndexCubit>().close();
      sl.unregister<HomeIndexCubit>();
    }
  }

  @override
  void inject() {
    sl
      //* Cubit
      ..registerLazySingleton(SwipeOffsetCubit.new)
      ..registerLazySingleton(AppBarTitleCubit.new)
      ..registerLazySingleton(HomeIndexCubit.new);
  }

  @override
  Modules get moduleName => Modules.home;
}
