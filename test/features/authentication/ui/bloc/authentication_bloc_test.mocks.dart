// Mocks generated by Mockito 5.4.5 from annotations
// in chat/test/features/authentication/ui/bloc/authentication_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:chat/core/error/error.dart' as _i7;
import 'package:chat/features/authentication/domain/entity/login.dart' as _i8;
import 'package:chat/features/authentication/domain/repository/login_repo.dart'
    as _i2;
import 'package:chat/features/authentication/domain/repository/signup_repository.dart'
    as _i4;
import 'package:chat/features/authentication/domain/usecase/login_usecase.dart'
    as _i5;
import 'package:chat/features/authentication/domain/usecase/params/login_params.dart'
    as _i9;
import 'package:chat/features/authentication/domain/usecase/params/signup_params.dart'
    as _i11;
import 'package:chat/features/authentication/domain/usecase/signup_usecase.dart'
    as _i10;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLoginRepository_0 extends _i1.SmartFake
    implements _i2.LoginRepository {
  _FakeLoginRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeSignupRepository_2 extends _i1.SmartFake
    implements _i4.SignupRepository {
  _FakeSignupRepository_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [LoginUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUsecase extends _i1.Mock implements _i5.LoginUsecase {
  @override
  _i2.LoginRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeLoginRepository_0(
              this,
              Invocation.getter(#repository),
            ),
            returnValueForMissingStub: _FakeLoginRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.LoginRepository);

  @override
  _i6.Future<_i3.Either<_i7.Failure, _i8.Login>> call(
    _i9.LoginParams? params,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#call, [params]),
            returnValue: _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>.value(
              _FakeEither_1<_i7.Failure, _i8.Login>(
                this,
                Invocation.method(#call, [params]),
              ),
            ),
            returnValueForMissingStub:
                _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>.value(
                  _FakeEither_1<_i7.Failure, _i8.Login>(
                    this,
                    Invocation.method(#call, [params]),
                  ),
                ),
          )
          as _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>);
}

/// A class which mocks [SignupUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupUsecase extends _i1.Mock implements _i10.SignupUsecase {
  @override
  _i4.SignupRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeSignupRepository_2(
              this,
              Invocation.getter(#repository),
            ),
            returnValueForMissingStub: _FakeSignupRepository_2(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i4.SignupRepository);

  @override
  _i6.Future<_i3.Either<_i7.Failure, _i8.Login>> call(
    _i11.SignupParams? params,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#call, [params]),
            returnValue: _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>.value(
              _FakeEither_1<_i7.Failure, _i8.Login>(
                this,
                Invocation.method(#call, [params]),
              ),
            ),
            returnValueForMissingStub:
                _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>.value(
                  _FakeEither_1<_i7.Failure, _i8.Login>(
                    this,
                    Invocation.method(#call, [params]),
                  ),
                ),
          )
          as _i6.Future<_i3.Either<_i7.Failure, _i8.Login>>);
}
