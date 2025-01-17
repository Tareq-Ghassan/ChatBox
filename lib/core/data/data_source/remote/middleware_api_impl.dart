// ignore_for_file: strict_raw_type
part of 'remote.dart';

/// [MiddlewareApiImpl] implements ApiClient with actual API calls
class MiddlewareApiImpl extends MiddlewareApi {
  /// [MiddlewareApiImpl] constructor
  MiddlewareApiImpl({required super.http});
  @override
  Future<Response> get(
    String serviceName,
    String operation, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final url = '$serviceName/$operation';
      return await http.get(url, queryParameters: params);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Error response: ${e.response!.data}');
        return e.response!;
      } else {
        debugPrint('Error sending request: ${e.message}');
        rethrow;
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }

  @override
  Future<Response> post(
    String serviceName,
    String operation, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final url = '$serviceName/$operation';
      return await http.post(url, data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Error response: ${e.response!.data}');
        return e.response!;
      } else {
        debugPrint('Error sending request: ${e.message}');
        rethrow;
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }

  @override
  Future<Response> put(
    String serviceName,
    String operation, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final url = '$serviceName/$operation';
      return await http.put(url, data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Error response: ${e.response!.data}');
        return e.response!;
      } else {
        debugPrint('Error sending request: ${e.message}');
        rethrow;
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }

  @override
  Future<Response> delete(
    String serviceName,
    String operation, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final url = '$serviceName/$operation';
      return await http.delete(url, queryParameters: params);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Error response: ${e.response!.data}');
        return e.response!;
      } else {
        debugPrint('Error sending request: ${e.message}');
        rethrow;
      }
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }
  }
}
