part of 'remote.dart';

/// [BaseRemoteDataSource] a generic data source class
abstract class BaseRemoteDataSource {
  /// [BaseRemoteDataSource] constructor
  BaseRemoteDataSource({
    required this.networkInfo,
    required this.api,
  });

  /// [networkInfo] represent network info
  final NetworkInfo networkInfo;

  /// [api] holds an instant of api client
  final MiddlewareApi api;

  /// [executeApiCall] utility method that handles the common logic for
  /// making API requests and processing responses
  Future<T> executeApiCall<T>({
    required Future<Map<String, dynamic>> Function() apiCall,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      throw NetworkException();
    }
    try {
      // Perform the API call
      final responseData = await apiCall();
      final result = fromJson(responseData);
      return result;
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode != null) {
        if (e.response!.statusCode! >= 500) {
          throw ServerException(
            message: e.message.toString(),
            error: e.error.toString(),
          );
        } else {
          throw ClientException(
            message: e.message.toString(),
            error: e.error.toString(),
          );
        }
      }
      throw NetworkException();
    } on FormatException catch (e, stackTrace) {
      throw CatchException(
        exception: e.toString(),
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      throw CatchException(
        exception: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
