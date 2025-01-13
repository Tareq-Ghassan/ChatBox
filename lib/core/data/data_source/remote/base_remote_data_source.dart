import 'package:chat/core/error/exceptions.dart';
import 'package:chat/core/util/network_info.dart';
import 'package:dio/dio.dart';

/// [BaseRemoteDataSource] a generic data source class
abstract class BaseRemoteDataSource {
  /// [BaseRemoteDataSource] constuctor
  BaseRemoteDataSource({required this.networkInfo});

  /// [networkInfo] represent network info
  final NetworkInfo networkInfo;

  /// [executeApiCall] utility method that handles the common logic for
  /// making API requests and processing responses
  Future<T> executeApiCall<T>({
    required Future<Map<String, dynamic>> Function() apiCall,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final isConntected = await networkInfo.isConnected;
    if (!isConntected) {
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
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
