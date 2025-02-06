import 'package:chat/core/usecase/base_usecase.dart';
import 'package:chat/features/authentication/domain/usecase/check_login_status_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// [JwtInterceptor] automatically appends JWT token to all requests
class JwtInterceptor extends Interceptor {
  ///[JwtInterceptor] constructor
  JwtInterceptor({required this.checkLoginStatusUseCase});

  /// [checkLoginStatusUseCase] is to get jwt
  final CheckLoginStatusUseCase checkLoginStatusUseCase;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('🔄 Checking JWT before request...');

    final result = await checkLoginStatusUseCase(NoParams());

    result.fold(
      (failure) {
        debugPrint('❌ Failed to get JWT: $failure');
        handler.next(options);
      },
      (jwt) {
        debugPrint('✅ JWT Found, attaching to request...');
        options.headers['Authorization'] = 'Bearer $jwt';
        handler.next(options);
      },
    );
  }
}
