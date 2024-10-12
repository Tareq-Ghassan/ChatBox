import 'package:chat/data/repository/init_repo.dart';
import 'package:chat/provider/BloC/init/init_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  /******************** BloC **************/
  BlocProvider<InitBloc>(
    create: (context) => InitBloc(InitRepository()),
  ),
  /******************** Cubit **************/
  // BlocProvider<LocaleCubit>(
  //   create: (BuildContext context) => LocaleCubit(),
  // ),

];
