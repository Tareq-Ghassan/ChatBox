import 'package:chat/features/authentication/data/model/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [AuthenticationRepo] a repository class for Authentication
class AuthenticationRepo {
  /// [login] function to preform login
  Future<Login?> login({
    required String email,
    required String password,
  }) async {
    await dotenv.load();
    try {
      final response = await api.post(
        'user',
        'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      debugPrint(response.data.toString());
      if (response.data != null) {
        debugPrint(response.data.toString());
        return Login.fromJson(response.data as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      debugPrint('Error in login: $e');
      throw Exception('Failed to login');
    }
  }

  /// [register] function to register new user
  Future<Login?> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await dotenv.load();
    try {
      final response = await api.post(
        'user',
        'register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      debugPrint(response.data.toString());
      if (response.data != null) {
        debugPrint(response.data.toString());
        return Login.fromJson(response.data as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      debugPrint('Error in login: $e');
      throw Exception('Failed to login');
    }
  }
}
