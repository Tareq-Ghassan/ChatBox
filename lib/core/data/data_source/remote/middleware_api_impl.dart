// ignore_for_file: strict_raw_type
part of 'remote.dart';

/// [MiddlewareApiImpl] implements ApiClient with actual API calls
class MiddlewareApiImpl extends MiddlewareApi {
  /// Factory constructor to return the same instance
  factory MiddlewareApiImpl() {
    return _instance;
  }
  // Private constructor to prevent external instantiation
  MiddlewareApiImpl._internal();

  // The singleton instance of APIserver
  static final MiddlewareApiImpl _instance = MiddlewareApiImpl._internal();

  @override
  Future<Response> get(
    String serviceName,
    String operation, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final url = '$serviceName/$operation';
      return await dio.get(url, queryParameters: params);
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
      return await dio.post(url, data: data);
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
      return await dio.put(url, data: data);
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
      return await dio.delete(url, queryParameters: params);
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
