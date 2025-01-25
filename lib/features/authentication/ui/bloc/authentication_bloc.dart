import 'package:bloc/bloc.dart';
import 'package:chat/core/util/util.dart';
import 'package:chat/features/authentication/domain/entity/login.dart';
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/params/login_params.dart';
import 'package:chat/features/authentication/domain/usecase/params/signup_params.dart';
import 'package:chat/features/authentication/domain/usecase/signup_usecase.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

///[AuthenticationBloc] authentication BloC
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  ///[AuthenticationBloc] constructor
  AuthenticationBloc({required this.loginUsecase, required this.signupUsecase})
      : super(Idle()) {
    on<PerformLogin>(
      (event, emit) async {
        emit(Loading());
        final result = await loginUsecase(
          LoginParams(email: event.email, password: event.password),
        );
        result.fold(
          (l) => emit(
            Error(
              message: FailureMapper.mapFailureToMessage(l),
              header: FailureMapper.mapFailureToHeader(l),
            ),
          ),
          (r) => emit(Loaded(r)),
        );
      },
    );
    on<Register>((event, emit) async {
      emit(Loading());
      final result = await signupUsecase(
        SignupParams(
          name: event.name,
          countryCode: event.countryCode,
          phoneNumber: event.phoneNumber,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
        ),
      );
      result.fold(
        (l) => emit(
          Error(
            message: FailureMapper.mapFailureToMessage(l),
            header: FailureMapper.mapFailureToHeader(l),
          ),
        ),
        (r) => emit(Loaded(r)),
      );
    });
  }

  /// [loginUsecase]
  final LoginUsecase loginUsecase;

  /// [signupUsecase]
  final SignupUsecase signupUsecase;
}
