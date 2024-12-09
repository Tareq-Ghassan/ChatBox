import 'package:chat/core/model/secure_preferences.dart';
import 'package:chat/core/model/secure_prefernces_keys.dart';
import 'package:chat/features/authentication/data/repository/authentication_repo.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_event.dart';
import 'package:chat/features/authentication/ui/bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[AuthenticationBloc] Init BloC
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  ///[AuthenticationBloc] constructor
  AuthenticationBloc(this.authenticationRepo)
      : super(AuthenticationIsNotSearched()) {
    on<PerformLogin>((event, emit) async {
      emit(AuthenticationIsLoading());
      try {
        final login = await authenticationRepo.login(
          email: event.email,
          password: event.password,
        );
        if (login != null) {
          if (login.header != null &&
              login.header!.errorCode == '00000' &&
              login.header!.jwt != null &&
              login.header!.jwt!.isNotEmpty &&
              login.userData != null) {
            await SecurePreferences().setString(
              SecurePreferencesKeys.jwt,
              login.header!.jwt!,
            );
            emit(AuthenticationIsLoaded(login));
          } else if (login.header != null &&
              (login.header!.errorCode == '404' ||
                  login.header!.errorCode == '401')) {
            emit(
              AuthenticationShowFailure(
                '${login.header!.errorCode} - ${login.header!.message}',
              ),
            );
          } else {
            debugPrint('Perform Login event: ');
            emit(AuthenticationFailure());
          }
        } else {
          debugPrint('Perform Login event: login is null');
          emit(AuthenticationFailure());
        }
      } catch (error) {
        debugPrint('Perform Login event: catch ');
        emit(AuthenticationCatch());
        debugPrint(error.toString());
      }
    });
    on<Regisetr>((event, emit) async {
      emit(AuthenticationIsLoading());
      try {
        final login = await authenticationRepo.regisetr(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
        );
        if (login != null) {
          if (login.header != null &&
              login.header!.errorCode == '00000' &&
              login.header!.jwt != null &&
              login.header!.jwt!.isNotEmpty &&
              login.userData != null) {
            await SecurePreferences().setString(
              SecurePreferencesKeys.jwt,
              login.header!.jwt!,
            );
            emit(AuthenticationIsLoaded(login));
          } else if (login.header != null &&
              login.header!.errorCode != null &&
              login.header!.errorCode!.isNotEmpty &&
              login.header!.errorCode != '400') {
            emit(
              AuthenticationShowFailure(
                '${login.header!.errorCode} - ${login.header!.message}',
              ),
            );
          } else {
            debugPrint('Perform Login event: ');
            emit(AuthenticationFailure());
          }
        } else {
          debugPrint('Perform Login event: login is null');
          emit(AuthenticationFailure());
        }
      } catch (error) {
        debugPrint('Perform Login event: catch ');
        emit(AuthenticationCatch());
        debugPrint(error.toString());
      }
    });
  }

  ///[authenticationRepo] holds the repo
  final AuthenticationRepo authenticationRepo;
}
