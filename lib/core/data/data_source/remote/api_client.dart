// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [ApiClient] an abstract class defining API methods
abstract class ApiClient {
  ///[ApiClient] constructor
  ApiClient() : dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));

  /// instance of DIO package
  final Dio dio;

  /// [get] represents the GET method
  Future<Response> get(
    String serviceName,
    String  operation, {
    Map<String, dynamic>? params,
  });

  /// [post] represents the POST method
  Future<Response> post(
    String serviceName,
    String  operation,{
    Map<String, dynamic>? data,
  });

  /// [put] represents the PUT method
  Future<Response> put(
    String serviceName,
    String  operation, {
    Map<String, dynamic>? data,
  });

  /// [delete] represents the DELETE method
  Future<Response> delete(
    String serviceName,
    String  operation, {
    Map<String, dynamic>? params,
  });
}
