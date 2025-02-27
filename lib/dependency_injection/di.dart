import 'package:chat/core/data/data_source/local/local.dart';
import 'package:chat/core/data/data_source/remote/remote.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/dependency_injection/modules.dart';
import 'package:chat/features/authentication/data/data_source/authentication_local_data_source.dart';
import 'package:chat/features/authentication/data/data_source/login_data_source.dart';
import 'package:chat/features/authentication/data/data_source/signup_data_source.dart';
import 'package:chat/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:chat/features/authentication/data/repository/login_repository_impl.dart';
import 'package:chat/features/authentication/data/repository/signup_repository_impl.dart';
import 'package:chat/features/authentication/domain/repository/authentication_repository.dart';
import 'package:chat/features/authentication/domain/repository/login_repo.dart';
import 'package:chat/features/authentication/domain/repository/signup_repository.dart';
import 'package:chat/features/authentication/domain/usecase/check_login_status_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_bloc.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/home/ui/bloc/ui_helper_cubit.dart';
import 'package:chat/features/pre_login/data/data_source/configuration_data_source.dart';
import 'package:chat/features/pre_login/data/data_source/initialize_data_source.dart';
import 'package:chat/features/pre_login/data/repository/configuration_repository_impl.dart';
import 'package:chat/features/pre_login/data/repository/initialize_repository_impl.dart';
import 'package:chat/features/pre_login/domain/repository/configuration_repository.dart';
import 'package:chat/features/pre_login/domain/repository/initialize_repository.dart';
import 'package:chat/features/pre_login/domain/usecase/configuration_usecase.dart';
import 'package:chat/features/pre_login/domain/usecase/initialize_usecase.dart';
import 'package:chat/features/pre_login/ui/bloc/initialize_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'module/pre_login_module.dart';
part 'base_di.dart';
part 'module/core_module.dart';
part 'module/authentication_module.dart';
part 'module/home_module.dart';


/// [sl] service locator - Get it instance -
final sl = GetIt.instance;
