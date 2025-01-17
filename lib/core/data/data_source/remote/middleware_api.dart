// ignore_for_file: strict_raw_type
part of 'remote.dart';

/// [MiddlewareApi] an abstract class defining API methods
abstract class MiddlewareApi {
  ///[MiddlewareApi] constructor
  MiddlewareApi({required this.http});

  /// instance of DIO package
  final Dio http;

  /// [get] represents the GET method
  Future<Response> get(
    String serviceName,
    String operation, {
    Map<String, dynamic>? params,
  });

  /// [post] represents the POST method
  Future<Response> post(
    String serviceName,
    String operation, {
    Map<String, dynamic>? data,
  });

  /// [put] represents the PUT method
  Future<Response> put(
    String serviceName,
    String operation, {
    Map<String, dynamic>? data,
  });

  /// [delete] represents the DELETE method
  Future<Response> delete(
    String serviceName,
    String operation, {
    Map<String, dynamic>? params,
  });
}
