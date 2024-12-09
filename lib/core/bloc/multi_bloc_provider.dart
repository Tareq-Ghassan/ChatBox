import 'package:chat/features/authentication/data/repository/authentication_repo.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/home/provider/ui_helper_cubit.dart';
import 'package:chat/features/pre_login/data/repositories/init_repo.dart';
import 'package:chat/features/pre_login/ui/bloc/init_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  /******************** BloC **************/
  BlocProvider<InitBloc>(
    create: (context) => InitBloc(InitRepository()),
  ),
  BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc(AuthenticationRepo()),
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
  BlocProvider<ConfirmPasswordCubit>(
    create: (BuildContext context) => ConfirmPasswordCubit(),
  ),
  BlocProvider<NameCubit>(
    create: (BuildContext context) => NameCubit(),
  ),
  BlocProvider<HomeIndexCubit>(
    create: (BuildContext context) => HomeIndexCubit(),
  ),
    BlocProvider<AppBarTitleCubit>(
    create: (BuildContext context) => AppBarTitleCubit(),
  ),
];