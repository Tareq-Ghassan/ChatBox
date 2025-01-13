import 'package:chat/core/api/api_client.dart';
import 'package:chat/features/pre_login/data/model/initlization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// [InitlizationDataSource] an abstract class holds Data Source
abstract class InitlizationDataSource {
  /// Calls `serverInit` API
  Future<InitlizationModel> getIsInitialized();
}

/// [InitlizationDataSourceImpl] represnet Data source implementation
class InitlizationDataSourceImpl implements InitlizationDataSource {
  /// [InitlizationDataSourceImpl] constructor
  InitlizationDataSourceImpl(this.api);

  /// [api] holds an instent of api client
  final ApiClient api;

  @override
  Future<InitlizationModel> getIsInitialized() async {
    await dotenv.load();
    try {
      final response = await api.post(
        'init',
        'serverInit',
        data: {
          'appKey': dotenv.env['APP_KEY'],
          'appSecret': dotenv.env['APP_SECRET'],
        },
      );
      debugPrint(response.data.toString());
      return InitlizationModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }
}
