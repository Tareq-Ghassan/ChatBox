import 'package:chat/data/repository/init_repo.dart';
import 'package:chat/provider/BloC/init/init_bloc.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  /******************** BloC **************/
  BlocProvider<InitBloc>(
    create: (context) => InitBloc(InitRepository()),
  ),
  /******************** Cubit **************/
  BlocProvider<EmailCubit>(
    create: (BuildContext context) => EmailCubit(),
  ),
  BlocProvider<PasswordCubit>(
    create: (BuildContext context) => PasswordCubit(),
  ),
  BlocProvider<HidePasswordCubit>(
    create: (BuildContext context) => HidePasswordCubit(),
  ),
];
